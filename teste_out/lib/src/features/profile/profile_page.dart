import 'package:flutter/material.dart';
import 'package:teste_out/src/core/ui/widgets/loading_widget.dart';
import 'package:teste_out/src/dto/dto_bank_mock.dart';
import 'package:teste_out/src/features/profile/profile_controller.dart';
import 'package:teste_out/src/features/profile/widgets/header_widget.dart';
import 'package:teste_out/src/repositories/profile_repository_impl.dart';

import '../../core/ui/widgets/error_widget.dart';
import 'widgets/tab_bar_name.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final ProfileController controller = ProfileController(
    ProfileRepositoryImpl(
      DtoBankMock(),
    ),
  );

  PageController pageController = PageController();

  @override
  void initState() {
    findProfile();
    super.initState();
  }

  findProfile() async {
    controller.findProfile();
  }

  List<String> breakText(String text, int maxCharsPerLine) {
    List<String> lines = [];
    int startIndex = 0;

    while (startIndex < text.length) {
      int endIndex = startIndex + maxCharsPerLine;
      if (endIndex > text.length) {
        endIndex = text.length;
      }
      lines.add(text.substring(startIndex, endIndex));
      startIndex = endIndex;
    }

    return lines;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ValueListenableBuilder(
        valueListenable: controller.statusNotifier,
        builder: (context, status, _) {
          if (status == ProfileStateStatus.loading) {
            return const ShowLoading();
          }
          if (status == ProfileStateStatus.error) {
            return ShowError(
              errorMessage: controller.errorMessage.toString(),
            );
          }
          if (status == ProfileStateStatus.loaded) {
            return Column(
              children: [
                HeaderWidget(controller: controller),
                const SizedBox(
                  height: 24,
                ),
                TabBarName(
                  pageController: pageController,
                ),
                Divider(
                  color: Color(0xFF4E97FE),
                ),
                const SizedBox(
                  height: 24,
                ),
                Expanded(
                  child: PageView(
                    controller: pageController,
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.profile!.activities.length,
                        itemBuilder: (context, index) {
                          final activity =
                              controller.profile!.activities[index];
                          return ListTile(
                            title: Text(controller.profile!.name),
                            subtitle: Text(
                              activity.content,
                              softWrap: false,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                )
              ],
            );
          }
          return const Center(
            child: Text('Ocorreu um erro inesperado'),
          );
        },
      ),
    );
  }
}
