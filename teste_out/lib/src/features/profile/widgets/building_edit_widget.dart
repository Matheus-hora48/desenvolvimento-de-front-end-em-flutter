import 'package:flutter/material.dart';
import 'package:teste_out/src/features/profile/profile_controller.dart';

import '../../../core/styles/font_styles.dart';
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
              child: Text(
                'Adicionar',
                style: TextStyles.instance.textButtonLabel2,
              ),
            )
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
                              ? AssetImage(building.photo)
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
