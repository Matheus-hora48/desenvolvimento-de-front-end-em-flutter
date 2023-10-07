import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'src/test_out_app.dart';

Future<void> main() async {
  await initializeDateFormatting();
  runApp(const OutApp());
}
