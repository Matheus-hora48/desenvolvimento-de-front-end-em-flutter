import 'package:flutter/material.dart';
import 'package:teste_out/src/features/profile/profile_controller.dart';

import '../../../entities/opening_hour.dart';
import 'time_picker_dropdown_widget.dart';

class TimeEditWidget extends StatefulWidget {
  final ProfileController controller;
  const TimeEditWidget({
    super.key,
    required this.controller,
  });

  @override
  State<TimeEditWidget> createState() => _TimeEditWidgetState();
}

class _TimeEditWidgetState extends State<TimeEditWidget> {
  void updateOpeningHour(int id, TimeOfDay newStart, TimeOfDay newEnd) {
    setState(() {
      widget.controller.profile!.about.openingHours
          .firstWhere((day) => day.id == id)
          .start = newStart;
      widget.controller.profile!.about.openingHours
          .firstWhere((day) => day.id == id)
          .end = newEnd;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Horário de atendimento'),
        const SizedBox(
          height: 12,
        ),
        SizedBox(
          height: 400,
          child: ListView.builder(
              itemCount: widget.controller.profile!.about.openingHours.length,
              itemBuilder: (context, index) {
                final OpeningHour day =
                    widget.controller.profile!.about.openingHours[index];
                return Column(
                  children: [
                    if (day.start.hour != 0 ||
                        day.start.minute != 0 ||
                        day.end.hour != 0 ||
                        day.end.minute != 0)
                      Row(
                        children: [
                          Container(
                            width: 140,
                            height: 40,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 8,
                            ),
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                  width: 1,
                                  color: Color(0xFFC7C6CA),
                                ),
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            child: Text(
                              day.dayOfTheWeek,
                            ),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          TimePickerDropdown(
                            value: day.start,
                            onChanged: (TimeOfDay? newValue) {
                              if (newValue != null) {
                                updateOpeningHour(
                                  day.id,
                                  newValue,
                                  day.end,
                                );
                              }
                            },
                            items: const [
                              TimeOfDay(hour: 6, minute: 0),
                              TimeOfDay(hour: 7, minute: 0),
                              TimeOfDay(hour: 8, minute: 0),
                              TimeOfDay(hour: 9, minute: 0),
                              TimeOfDay(hour: 10, minute: 0),
                              TimeOfDay(hour: 11, minute: 0),
                              TimeOfDay(hour: 12, minute: 0),
                              TimeOfDay(hour: 13, minute: 0),
                            ],
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          const Text('ás'),
                          const SizedBox(
                            width: 12,
                          ),
                          TimePickerDropdown(
                            value: day.end,
                            onChanged: (TimeOfDay? newValue) {
                              if (newValue != null) {
                                updateOpeningHour(
                                  day.id,
                                  day.start,
                                  newValue,
                                );
                              }
                            },
                            items: const [
                              TimeOfDay(hour: 14, minute: 0),
                              TimeOfDay(hour: 15, minute: 0),
                              TimeOfDay(hour: 16, minute: 0),
                              TimeOfDay(hour: 17, minute: 0),
                              TimeOfDay(hour: 18, minute: 0),
                              TimeOfDay(hour: 19, minute: 0),
                              TimeOfDay(hour: 20, minute: 0),
                              TimeOfDay(hour: 21, minute: 0),
                            ],
                          ),
                        ],
                      ),
                    if (day.start.hour == 0 && day.end.hour == 0)
                      Row(
                        children: [
                          Container(
                            width: 140,
                            height: 40,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 8,
                            ),
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                  width: 1,
                                  color: Color(0xFFC7C6CA),
                                ),
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            child: Text(
                              day.dayOfTheWeek,
                            ),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            height: 40,
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                  width: 1,
                                  color: Color(0xFFC7C6CA),
                                ),
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            child: Center(
                              child: DropdownButton<bool>(
                                underline: const SizedBox(),
                                isDense: true,
                                value: day.isClosed,
                                onChanged: (bool? newValue) {
                                  if (newValue != null) {
                                    setState(() {
                                      day.isClosed = newValue;
                                    });
                                  }
                                },
                                items: [true, false]
                                    .map<DropdownMenuItem<bool>>((bool value) {
                                  return DropdownMenuItem<bool>(
                                    value: value,
                                    child: Text(
                                      value ? 'Fechado' : 'Aberto',
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    const SizedBox(
                      height: 12,
                    ),
                  ],
                );
              }),
        ),
      ],
    );
  }
}
