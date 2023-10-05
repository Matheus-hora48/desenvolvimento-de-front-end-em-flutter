import 'package:flutter/material.dart';

class OpeningHour {
  OpeningHour({
    required this.id,
    required this.dayOfTheWeek,
    required this.start,
    required this.end,
    required this.isClosed,
  });

  final int id;
  final String dayOfTheWeek;
  final TimeOfDay start;
  final TimeOfDay end;
  final bool isClosed;

  factory OpeningHour.fromJson(Map<String, dynamic> json) {
    return OpeningHour(
      id: json['id'],
      dayOfTheWeek: json['dayOfTheWeek'],
      start: _parseTimeOfDay(json['start']),
      end: _parseTimeOfDay(json['end']),
      isClosed: json['isClosed'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'dayOfTheWeek': dayOfTheWeek,
      'start': '${start.hour}:${start.minute}',
      'end': '${end.hour}:${end.minute}',
      'isClosed': isClosed,
    };
  }

  static TimeOfDay _parseTimeOfDay(String timeString) {
    List<String> parts = timeString.split(':');
    return TimeOfDay(hour: int.parse(parts[0]), minute: int.parse(parts[1]));
  }
}
