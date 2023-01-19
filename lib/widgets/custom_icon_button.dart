import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  CustomIconButton({
    super.key,
    required this.radius,
    required this.iconData,
    required this.onTap,
    this.iconColor,
  });

  final double radius;
  final IconData iconData;
  final Color? iconColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Icon(
            color: iconColor ?? Theme.of(context).colorScheme.primary,
            iconData,
          ),
        ),
      ),
    );
  }
}
