//Custom Material Button To Send Data from Login screen to Home screen or from Register Screen to home screen
import 'package:flutter/material.dart';

class CustomMaterialButton extends StatelessWidget {
  final String text;
  final Color color;
  final double minWidth;
  final double height;
  final double radius;
  final VoidCallback onTap;

  const CustomMaterialButton({
    super.key,
    required this.text,
    this.color = Colors.blueAccent,
    this.minWidth = double.infinity,
    this.height = 50,
    this.radius = 10,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
      height:height ,
      minWidth: minWidth,
      color: color,
      onPressed:onTap ,
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}
