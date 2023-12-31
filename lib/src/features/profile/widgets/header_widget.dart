import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../core/styles/font_styles.dart';
import '../edit_profile_page.dart';
import '../profile_controller.dart';

class HeaderWidget extends StatefulWidget {
  final ProfileController controller;

  const HeaderWidget({
    super.key,
    required this.controller,
  });

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
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
                  image: AssetImage(widget.controller.profile!.photoBg),
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
                            image: widget.controller.profile!.photo != null
                                ? FileImage(
                                    File(
                                        widget.controller.profile!.photo ?? ''),
                                  )
                                : const AssetImage(
                                    'assets/imgs/city_adm_photo.png',
                                  ) as ImageProvider,
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
                            onPressed: () async {
                              var newProfile = await Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => EditProfilePage(
                                    controller: widget.controller,
                                  ),
                                ),
                              );
                              widget.controller.editProfile(newProfile);
                            },
                            child: Text(
                              'Editar perfil',
                              style: TextStyles.instance.textButtonLabel1,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Text(widget.controller.profile!.name,
                      style: TextStyles.instance.textTitle),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  widget.controller.profile!.bio,
                  style: TextStyles.instance.textSubtitle1,
                ),
              ),
              const SizedBox(
                height: 12,
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
                  Text(widget.controller.profile!.location,
                      style: TextStyles.instance.textLabel1),
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
                    'Entrou em ${DateFormat.MMM().format(widget.controller.profile!.createAt).toLowerCase()}/${DateFormat('yy').format(widget.controller.profile!.createAt)}',
                    style: TextStyles.instance.textLabel1,
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
