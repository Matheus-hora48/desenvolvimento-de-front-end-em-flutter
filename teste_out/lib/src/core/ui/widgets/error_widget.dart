import 'package:flutter/material.dart';

class ShowError extends StatelessWidget {
  final String errorMessage;

  const ShowError({super.key, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Erro: $errorMessage'));
  }
}
