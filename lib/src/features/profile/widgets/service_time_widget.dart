import 'package:flutter/material.dart';
import 'package:teste_out/src/core/ui/constants/constants.dart';
import 'package:teste_out/src/features/profile/profile_controller.dart';

import '../../../core/styles/font_styles.dart';
import '../../../entities/opening_hour.dart';

class ServiceTimeWidget extends StatelessWidget {
  final ProfileController controller;

  const ServiceTimeWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Horário de Atendimento',
          style: TextStyles.instance.textSubtitle3,
        ),
        SizedBox(
          height: 22.0 * controller.profile!.about.openingHours.length,
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.profile!.about.openingHours.length,
            itemBuilder: (context, index) {
              final OpeningHour hours =
                  controller.profile!.about.openingHours[index];
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    hours.dayOfTheWeek,
                    style: TextStyles.instance.textLabel1,
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(4),
                      height: 1,
                      color: ColorsConstants.lightGrey,
                    ),
                  ),
                  Text(
                    '${hours.start.format(context)} às ${hours.end.format(context)}',
                    style: TextStyles.instance.textLabel1,
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
