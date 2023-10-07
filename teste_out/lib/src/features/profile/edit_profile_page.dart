import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:teste_out/src/core/styles/font_styles.dart';
import 'package:teste_out/src/features/profile/profile_controller.dart';

import '../../entities/profile.dart';
import 'widgets/moderator_widget.dart';

class EditProfilePage extends StatefulWidget {
  final ProfileController controller;

  const EditProfilePage({
    super.key,
    required this.controller,
  });

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  var nameEC = TextEditingController();
  var bioEC = TextEditingController();
  var locationEC = TextEditingController();
  var administratorGeneralEC = TextEditingController();

  @override
  void initState() {
    fillField();
    super.initState();
  }

  fillField() {
    String name = widget.controller.profile!.name;
    String bio = widget.controller.profile!.bio;
    String location = widget.controller.profile!.location;
    String adminGeneral = widget.controller.profile!.administratorGeneral;

    setState(() {
      nameEC.text = name;
      bioEC.text = bio;
      locationEC.text = location;
      administratorGeneralEC.text = '@$adminGeneral';
    });
  }

  void updateProfile() {
    String name = nameEC.text;
    String bio = bioEC.text;
    String location = locationEC.text;
    String adminGeneral = administratorGeneralEC.text.substring(1);

    Profile perfilAtualizado = Profile(
      id: widget.controller.profile!.id,
      name: name,
      bio: bio,
      photo: widget.controller.profile!.photo,
      photoBg: widget.controller.profile!.photoBg,
      location: location,
      administratorGeneral: adminGeneral,
      moderators: widget.controller.profile!.moderators,
      activities: widget.controller.profile!.activities,
      about: widget.controller.profile!.about,
      createAt: widget.controller.profile!.createAt,
      updateAt: DateTime.now(),
    );

    widget.controller.editProfile(perfilAtualizado);

    Navigator.pop(context, perfilAtualizado);
  }

  Future<void> _updateProfileImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        widget.controller.profile!.photo = pickedFile.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Editar Perfil'),
          actions: [
            TextButton(
              onPressed: () => updateProfile(),
              child: const Text('Salvar'),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 32,
                ),
                Text(
                  'Imagem de perfil',
                  style: TextStyles.instance.textSubtitle3,
                ),
                const SizedBox(
                  height: 12,
                ),
                Center(
                  child: GestureDetector(
                    onTap: _updateProfileImage,
                    child: Stack(
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            image: DecorationImage(
                              image: widget.controller.profile!.photo != null
                                  ? FileImage(
                                      File(widget.controller.profile!.photo ??
                                          ''),
                                    )
                                  : const AssetImage(
                                      'assets/imgs/city_adm_photo.png',
                                    ) as ImageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.black.withOpacity(0.6),
                            ),
                          ),
                        ),
                        const Positioned(
                          bottom: 34,
                          right: 34,
                          child: Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                Text('Nome', style: TextStyles.instance.textSubtitle3),
                const SizedBox(
                  height: 12,
                ),
                TextFormField(
                  decoration: const InputDecoration(),
                  controller: nameEC,
                ),
                const SizedBox(
                  height: 32,
                ),
                Text('Bio', style: TextStyles.instance.textSubtitle3),
                const SizedBox(
                  height: 12,
                ),
                TextFormField(
                  decoration: const InputDecoration(),
                  controller: bioEC,
                ),
                const SizedBox(
                  height: 32,
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
                Text('Administrador geral',
                    style: TextStyles.instance.textSubtitle3),
                const SizedBox(
                  height: 12,
                ),
                TextFormField(
                  decoration: const InputDecoration(),
                  controller: administratorGeneralEC,
                ),
                const SizedBox(
                  height: 32,
                ),
                ModeratorWidget(
                  profile: widget.controller.profile!,
                  controller: widget.controller,
                )
              ],
            ),
          ),
        ));
  }
}
