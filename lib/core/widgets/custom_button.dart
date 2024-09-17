import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function() onPressed;
  final Widget child;
  final Color backgroundColor;
  final double radius;
  final BorderSide side;

  const CustomButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.backgroundColor = Colors.black,
    this.radius = 8.0,
    this.side = const BorderSide(),
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
          side: const BorderSide(),
        ),
        padding: const EdgeInsets.all(12.0),
      ),
      child: child,
    );
  }
}
