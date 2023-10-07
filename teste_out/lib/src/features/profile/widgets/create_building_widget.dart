import 'package:flutter/material.dart';
import 'package:teste_out/src/features/profile/profile_controller.dart';

import '../../../core/ui/constants/constants.dart';
import '../../../core/ui/theme/test_out_theme.dart';
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
          style: TestOutTheme.themeData.textTheme.bodyMedium!.copyWith(
            fontWeight: FontWeight.w700,
          ),
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
                  decoration: const ShapeDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/imgs/city_adm_photo.png',
                      ),
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
                        style: TestOutTheme.themeData.textTheme.bodyMedium!
                            .copyWith(
                          fontWeight: FontWeight.w700,
                        ),
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
                        style: TestOutTheme.themeData.textTheme.bodySmall!
                            .copyWith(
                          color: ColorsConstants.lightGrey,
                        ),
                      )
                    ],
                  ),
                ),
                subtitle: Text(
                  'Edifício da(o) ${controller.profile!.name}',
                  style: TestOutTheme.themeData.textTheme.bodyMedium,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
