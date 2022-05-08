import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    Key? key,
    required this.label,
    required this.color,
    required this.onPressed,
    required this.textColor,
  }) : super(key: key);
  final Color color;
  final Color textColor;
  final String label;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      width: double.infinity,
      child: MaterialButton(
        color: color,
        child: Text(
          label,
          style: TextStyle(color: textColor),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
