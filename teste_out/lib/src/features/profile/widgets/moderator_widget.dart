import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:teste_out/src/core/ui/constants/constants.dart';
import 'package:teste_out/src/entities/profile.dart';
import 'package:teste_out/src/features/profile/profile_controller.dart';

import '../../../core/ui/theme/test_out_theme.dart';
import '../../../entities/moderator.dart';

class ModeratorWidget extends StatefulWidget {
  final ProfileController controller;
  final Profile profile;

  const ModeratorWidget(
      {super.key, required this.profile, required this.controller});

  @override
  _ModeratorWidgetState createState() => _ModeratorWidgetState();
}

class _ModeratorWidgetState extends State<ModeratorWidget> {
  List<TextEditingController> controllers = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < widget.profile.moderators.length; i++) {
      controllers.add(TextEditingController());
    }
  }

  void adicionarModerador() {
    TextEditingController controller = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        title: Text(
          'Adicionar Moderador',
          style: TestOutTheme.themeData.textTheme.bodyMedium!
              .copyWith(fontWeight: FontWeight.w700),
        ),
        content: TextFormField(
          controller: controller,
          decoration: const InputDecoration(labelText: 'Nome do Moderador'),
        ),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                widget.profile.moderators.add(Moderator(
                  name: controller.text,
                  id: widget.profile.moderators.length + 1,
                  createAt: DateTime.now(),
                  updateAt: DateTime.now(),
                ));
                controllers.add(TextEditingController());
                widget.controller.editProfile(widget.profile);

                Navigator.of(context).pop();
              });
            },
            child: const Text(
              'Adicionar',
              style: TextStyle(color: ColorsConstants.blue),
            ),
          ),
        ],
      ),
    );
  }

  void removeModerator(int index) {
    setState(() {
      widget.profile.moderators.removeAt(index);
      controllers.removeAt(index);
      widget.controller.editProfile(widget.profile);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Moderadores',
              style: TestOutTheme.themeData.textTheme.bodyMedium!
                  .copyWith(fontWeight: FontWeight.w700),
            ),
            const Spacer(),
            OutlinedButton(
              onPressed: adicionarModerador,
              child: const Text('Adicionar'),
            )
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: widget.profile.moderators.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      readOnly: true,
                      controller: controllers[index],
                      decoration: InputDecoration(
                        labelText: '@${widget.profile.moderators[index].name}',
                        labelStyle: const TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.remove_circle_outline,
                      color: ColorsConstants.errorColor,
                    ),
                    onPressed: () => removeModerator(index),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
