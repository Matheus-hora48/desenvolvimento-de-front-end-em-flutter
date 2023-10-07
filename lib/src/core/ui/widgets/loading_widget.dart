import 'package:flutter/material.dart';

class ShowLoading extends StatelessWidget {
  const ShowLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          CircularProgressIndicator(),
          SizedBox(
            height: 8,
          ),
          Text('Carregando dados')
        ],
      ),
    );
  }
}
