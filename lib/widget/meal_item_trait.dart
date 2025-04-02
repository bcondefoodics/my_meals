import 'package:flutter/material.dart';

class MealItemTrait extends StatelessWidget {
  const MealItemTrait({super.key, required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        SizedBox(width: 8),
        Text(
          label,
          style: Theme.of(
            context,
          ).textTheme.bodySmall!.copyWith(color: Colors.white),
        ),
      ],
    );
  }
}
