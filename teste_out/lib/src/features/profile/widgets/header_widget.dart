import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../core/ui/theme/test_out_theme.dart';
import '../profile_controller.dart';

class HeaderWidget extends StatelessWidget {
  final ProfileController controller;

  const HeaderWidget({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              width: double.infinity,
              height: 200,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(controller.profile!.photoBg),
                  fit: BoxFit.fill,
                ),
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: const EdgeInsets.only(top: 25, right: 12),
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
                        decoration: ShapeDecoration(
                          shape: const CircleBorder(),
                          image: DecorationImage(
                            image: AssetImage(controller.profile!.photo),
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
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Text(
                    controller.profile!.name,
                    style: TestOutTheme.themeData.textTheme.titleMedium,
                  ),
                ],
              ),
              const SizedBox(
                height: 32,
              ),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  controller.profile!.bio,
                  style: TestOutTheme.themeData.textTheme.bodyMedium,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.location_pin,
                    size: 16,
                    color: Color(0xFF909094),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    controller.profile!.location,
                    style: TestOutTheme.themeData.textTheme.bodySmall,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  const Icon(
                    Icons.calendar_month_rounded,
                    size: 16,
                    color: Color(0xFF909094),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    '${DateFormat.MMM().format(controller.profile!.createAt).toLowerCase()}/${DateFormat('yy').format(controller.profile!.createAt)}',
                    style: TestOutTheme.themeData.textTheme.bodySmall,
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}