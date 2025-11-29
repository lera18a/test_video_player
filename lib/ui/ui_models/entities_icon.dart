import 'package:flutter/material.dart';

class EntitiesIcon extends StatelessWidget {
  const EntitiesIcon({
    super.key,
    required this.onPressed,
    required this.icon,
    this.size = 14,
  });
  final void Function() onPressed;
  final IconData icon;
  final double size;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      icon: Container(
        height: 44,
        width: 44,
        decoration: BoxDecoration(
          color: Color(0x80E0E7FF),
          borderRadius: BorderRadius.circular(100),
        ),

        child: Icon(icon, color: Colors.white, size: size),
      ),
    );
  }
}
