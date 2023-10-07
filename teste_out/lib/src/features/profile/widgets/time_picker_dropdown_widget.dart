import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimePickerDropdown extends StatelessWidget {
  final TimeOfDay value;
  final ValueChanged<TimeOfDay?>? onChanged;
  final List<TimeOfDay> items;

  const TimePickerDropdown({
    super.key,
    required this.value,
    required this.onChanged,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
        child: DropdownButton<TimeOfDay>(
          underline: const SizedBox(),
          isDense: true,
          value: value,
          onChanged: onChanged,
          items: items.map<DropdownMenuItem<TimeOfDay>>((TimeOfDay value) {
            return DropdownMenuItem<TimeOfDay>(
              value: value,
              child: Text(
                DateFormat.Hm().format(
                  DateTime(
                    2022,
                    1,
                    1,
                    value.hour,
                    value.minute,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
