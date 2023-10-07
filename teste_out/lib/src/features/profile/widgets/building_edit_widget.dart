import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:teste_out/src/features/profile/profile_controller.dart';

import '../../../entities/building.dart';

class BuildingEditWidget extends StatefulWidget {
  final ProfileController controller;

  const BuildingEditWidget({
    super.key,
    required this.controller,
  });

  @override
  State<BuildingEditWidget> createState() => _BuildingEditWidgetState();
}

class _BuildingEditWidgetState extends State<BuildingEditWidget> {
  Future<void> showBuildingDialog(
      BuildContext context, Building? building) async {
    TextEditingController nameController = TextEditingController();
    TextEditingController adminController = TextEditingController();

    if (building != null) {
      nameController.text = building.name;
      adminController.text = building.administrator;
    }

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(building != null ? 'Editar Prédio' : 'Adicionar Prédio'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: GestureDetector(
                  onTap: () => updateProfileImage(building!),
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
                                    File(building!.photo),
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
                height: 24,
              ),
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Nome do Prédio'),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: adminController,
                decoration:
                    const InputDecoration(labelText: 'Nome do Administrador'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                if (building != null) {
                  editBuilding(
                    building.id - 1,
                    nameController.text,
                    adminController.text,
                  );
                } else {
                  addBuilding(
                    nameController.text,
                    adminController.text,
                  );
                }
                Navigator.pop(context);
              },
              child: const Text('Salvar'),
            ),
          ],
        );
      },
    );
  }

  Future<void> updateProfileImage(Building building) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        building.photo = pickedFile.path;
      });
    }
  }

  void addBuilding(String newName, String newAdmin) {
    setState(() {
      int newId = widget.controller.profile!.about.buildings.isNotEmpty
          ? widget.controller.profile!.about.buildings.last.id + 1
          : 1;

      widget.controller.profile!.about.buildings.add(
        Building(
          id: newId,
          name: newName,
          administrator: newAdmin,
          createAt: DateTime.now(),
          updateAt: DateTime.now(),
          photo: '',
        ),
      );
    });
  }

  void editBuilding(int id, String newName, String newAdmin) {
    setState(() {
      Building? buildingToEdit =
          widget.controller.profile!.about.buildings.firstWhere(
        (building) => building.id == id,
      );

      buildingToEdit.name = newName;
      buildingToEdit.administrator = newAdmin;
      buildingToEdit.updateAt = DateTime.now();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Edifícios'),
            OutlinedButton(
                onPressed: () {
                  showBuildingDialog(context, null);
                },
                child: const Text('Adicionar'))
          ],
        ),
        SizedBox(
          height: 120.0 * widget.controller.profile!.about.buildings.length,
          child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.controller.profile!.about.buildings.length,
              itemBuilder: (context, index) {
                final Building building =
                    widget.controller.profile!.about.buildings[index];
                return Row(
                  children: [
                    Container(
                      width: 44,
                      height: 44,
                      decoration: ShapeDecoration(
                        image: DecorationImage(
                          image: widget.controller.profile!.photo != null
                              ? FileImage(
                                  File(widget.controller.profile!.photo ?? ''),
                                )
                              : const AssetImage(
                                  'assets/imgs/city_adm_photo.png',
                                ) as ImageProvider,
                          fit: BoxFit.fill,
                        ),
                        shape: const OvalBorder(),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(building.name),
                              const SizedBox(
                                width: 4,
                              ),
                              const Image(
                                image:
                                    AssetImage('assets/icons/vector_blue.png'),
                              ),
                              const Spacer(),
                              const Icon(Icons.arrow_drop_down_rounded),
                            ],
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Administrador'),
                              const SizedBox(
                                width: 36,
                              ),
                              Flexible(
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    suffixIcon: const Icon(Icons.edit),
                                    labelText: '@${building.administrator}',
                                  ),
                                  readOnly: true,
                                  onTap: () => showDialog,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const Divider()
                        ],
                      ),
                    ),
                  ],
                );
              }),
        ),
      ],
    );
  }
}
