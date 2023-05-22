import 'package:flutter/material.dart';

class InformationPokemon extends StatelessWidget {
  final String title;
  final Color color;
  const InformationPokemon({
    super.key,
    required this.title,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Text(
        title,
        style: TextStyle(
          color: color,
          fontSize: 20,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }
}