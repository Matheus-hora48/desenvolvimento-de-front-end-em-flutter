import 'package:flutter/material.dart';
import 'package:teste_out/src/features/profile/profile_controller.dart';

import '../../../core/styles/font_styles.dart';

import '../../../entities/building.dart';

class CreateBuildingWidget extends StatelessWidget {
  final ProfileController controller;

  const CreateBuildingWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Edifícios',
          style: TextStyles.instance.textSubtitle3,
        ),
        SizedBox(
          height: 80.0 * controller.profile!.about.buildings.length,
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.profile!.about.buildings.length,
            itemBuilder: (context, index) {
              final Building building =
                  controller.profile!.about.buildings[index];
              return ListTile(
                leading: Container(
                  width: 44,
                  height: 44,
                  decoration: ShapeDecoration(
                    image: DecorationImage(
                      image: AssetImage(building.photo),
                      fit: BoxFit.fill,
                    ),
                    shape: OvalBorder(),
                  ),
                ),
                title: FittedBox(
                  child: Row(
                    children: [
                      Text(
                        building.name,
                        style: TextStyles.instance.textSubtitle3,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      const Image(
                        image: AssetImage('assets/icons/vector_blue.png'),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        '@${building.administrator}',
                        style: TextStyles.instance.textLabel1,
                      )
                    ],
                  ),
                ),
                subtitle: Text(
                  'Edifício da(o) ${controller.profile!.name}',
                  style: TextStyles.instance.textSubtitle1,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
