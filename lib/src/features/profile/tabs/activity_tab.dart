import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:teste_out/src/features/profile/profile_controller.dart';

import '../../../core/styles/font_styles.dart';

class ActivityTab extends StatelessWidget {
  final ProfileController controller;

  const ActivityTab({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: ListView.builder(
          itemCount: controller.profile!.activities.length,
          itemBuilder: (context, index) {
            final activity = controller.profile!.activities[index];
            return ListTile(
              dense: false,
              leading: Container(
                width: 44,
                height: 44,
                decoration: ShapeDecoration(
                  image: DecorationImage(
                    image: controller.profile!.photo != null
                        ? FileImage(
                            File(controller.profile!.photo ?? ''),
                          )
                        : const AssetImage(
                            'assets/imgs/city_adm_photo.png',
                          ) as ImageProvider,
                    fit: BoxFit.fill,
                  ),
                  shape: const OvalBorder(),
                ),
              ),
              title: FittedBox(
                child: Row(
                  children: [
                    Text(controller.profile!.name,
                        style: TextStyles.instance.textSubtitle3),
                    const SizedBox(
                      width: 4,
                    ),
                    const Image(
                      image: AssetImage('assets/icons/vector.png'),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                        '@${activity.author} º ${DateFormat('dd MMM').format(activity.createAt)}',
                        style: TextStyles.instance.textLabel1),
                    const Icon(Icons.arrow_drop_down)
                  ],
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    activity.content,
                    maxLines: 20,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                    style: TextStyles.instance.textSubtitle1,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      const Spacer(),
                      const Icon(Icons.comment_outlined),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(activity.comments.length.toString())
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
