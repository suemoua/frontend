import 'package:flutter/material.dart';

class CustomTextFieldWidget extends StatelessWidget {
  const CustomTextFieldWidget({
    Key? key,
    this.label,
    this.text,
    required this.prefixIcon,
    this.isNumber = false,
    this.suffixIcon,
    this.obscureText = false,
    this.onPressed,
  }) : super(key: key);
  final TextEditingController? text;
  final String? label;
  final bool isNumber;
  final Icon prefixIcon;
  final IconData? suffixIcon;
  final bool obscureText;
  final Function()? onPressed;



  @override
  Widget build(BuildContext context) {

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label!,
            style: const TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 17,
            ),
          ),
          TextField(
            obscureText: obscureText,
            controller: text,
            keyboardType: isNumber ? TextInputType.number : TextInputType.text,
            decoration: InputDecoration(
              prefixIcon: prefixIcon,
              suffixIcon: IconButton(
                icon: Icon(suffixIcon),
                onPressed: onPressed,

              ),
              hintText: label,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          )
        ],
      ),
    );
  }
}
