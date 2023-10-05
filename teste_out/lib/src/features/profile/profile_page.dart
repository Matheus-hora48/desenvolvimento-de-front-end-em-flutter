import 'package:flutter/material.dart';
import 'package:teste_out/src/dto/dto_bank_mock.dart';
import 'package:teste_out/src/features/profile/profile_controller.dart';
import 'package:teste_out/src/repositories/profile_repository_impl.dart';

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

  @override
  void initState() {
    findProfile();
    super.initState();
  }

  findProfile() async {
    controller.findProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ValueListenableBuilder(
        valueListenable: controller.statusNotifier,
        builder: (context, status, _) {
          if (status == ProfileStateStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (status == ProfileStateStatus.error) {
            return Center(child: Text('Erro: ${controller.errorMessage}'));
          }
          if (status == ProfileStateStatus.loaded) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 200,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/imgs/photo_bg_profile.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              padding:
                                  const EdgeInsets.only(top: 25, right: 12),
                              child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.arrow_back_ios,
                                  size: 36,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional.bottomStart,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 150, left: 25),
                        child: Stack(
                          children: [
                            Container(
                              width: 120,
                              height: 120,
                              alignment: Alignment.topCenter,
                              padding: const EdgeInsets.only(top: 8),
                              decoration: const ShapeDecoration(
                                shape: CircleBorder(),
                                color: Colors.white,
                              ),
                              child: Container(
                                height: 100,
                                width: 100,
                                decoration: const ShapeDecoration(
                                  shape: CircleBorder(),
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'assets/imgs/city_adm_photo.png'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 50, left: 7),
                              child: Align(
                                alignment: AlignmentDirectional.bottomEnd,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: OutlinedButton(
                                    onPressed: () {},
                                    child: const Text(
                                      'Editar perfil',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      Text(
                        controller.profile!.name,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff1A1C1E),
                        ),
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
