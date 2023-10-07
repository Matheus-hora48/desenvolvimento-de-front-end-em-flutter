import 'package:flutter/material.dart';
import 'package:teste_out/src/core/ui/constants/constants.dart';
import 'package:teste_out/src/features/profile/profile_controller.dart';

import '../../../core/ui/theme/test_out_theme.dart';
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
          style: TestOutTheme.themeData.textTheme.bodyMedium!.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(
          height: 30.0 * controller.profile!.about.openingHours.length,
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
                    style:
                        TestOutTheme.themeData.textTheme.labelSmall!.copyWith(
                      color: ColorsConstants.lightGrey,
                    ),
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
                    style:
                        TestOutTheme.themeData.textTheme.labelSmall!.copyWith(
                      color: ColorsConstants.lightGrey,
                    ),
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
