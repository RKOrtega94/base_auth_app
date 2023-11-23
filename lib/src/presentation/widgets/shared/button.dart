import 'package:flutter/material.dart';

class AppButtonWidget extends StatelessWidget {
  final String label;
  const AppButtonWidget({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Text(label),
    );
  }
}
