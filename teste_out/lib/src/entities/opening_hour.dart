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
  DateTime start;
  DateTime end;
  bool isClosed;
}
