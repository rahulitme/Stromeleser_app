import 'package:flutter/material.dart';

class PowerButton extends StatelessWidget {
  final IconData icon;

  const PowerButton({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon, size: 40),
      onPressed: () {},
      color: Colors.white,
    );
  }
}
