import 'package:flutter/material.dart';
import 'package:teste_out/src/features/profile/profile_controller.dart';
import 'package:teste_out/src/features/profile/widgets/building_edit_widget.dart';
import 'package:teste_out/src/features/profile/widgets/time_edit_widget.dart';

import '../../core/styles/font_styles.dart';

class EditAboutPage extends StatefulWidget {
  final ProfileController controller;
  const EditAboutPage({
    super.key,
    required this.controller,
  });

  @override
  State<EditAboutPage> createState() => _EditAboutPageState();
}

class _EditAboutPageState extends State<EditAboutPage> {
  final locationEC = TextEditingController();
  final phoneEC = TextEditingController();
  final emailEC = TextEditingController();

  fillField() {
    String location = widget.controller.profile!.about.location;
    String phone = widget.controller.profile!.about.phone;
    String email = widget.controller.profile!.about.email;

    setState(() {
      locationEC.text = location;
      phoneEC.text = phone;
      emailEC.text = email;
    });
  }

  @override
  void initState() {
    fillField();
    super.initState();
  }

  void saveChanges() async {
    String newLocation = locationEC.text;
    String newPhone = phoneEC.text;
    String newEmail = emailEC.text;

    widget.controller.profile!.about.location = newLocation;
    widget.controller.profile!.about.phone = newPhone;
    widget.controller.profile!.about.email = newEmail;

    await widget.controller.editProfile(widget.controller.profile!).then(
          (value) => Navigator.pop(context),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Editar sobre'),
        actions: [
          TextButton(
            onPressed: () => saveChanges(),
            child: const Text('Salvar'),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TimeEditWidget(controller: widget.controller),
            BuildingEditWidget(
              controller: widget.controller,
            ),
            Text('Localização', style: TextStyles.instance.textSubtitle3),
            const SizedBox(
              height: 12,
            ),
            TextFormField(
              decoration: const InputDecoration(),
              controller: locationEC,
            ),
            const SizedBox(
              height: 32,
            ),
            Text('Whatsapp', style: TextStyles.instance.textSubtitle3),
            const SizedBox(
              height: 12,
            ),
            TextFormField(
              decoration: const InputDecoration(),
              controller: phoneEC,
            ),
            const SizedBox(
              height: 32,
            ),
            Text('E-mail', style: TextStyles.instance.textSubtitle3),
            const SizedBox(
              height: 12,
            ),
            TextFormField(
              decoration: const InputDecoration(),
              controller: emailEC,
            ),
          ],
        )),
      ),
    );
  }
}
