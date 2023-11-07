import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String labelText;
  final int? maxLength;
  final bool obscureText;
  final Widget? prefixIcon;
  final TextEditingController? controller;

  const CustomTextFormField({
    this.labelText = '',
    this.maxLength,
    this.obscureText = false,
    this.prefixIcon,
    this.controller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 0 , 0, 8),
            child: Text(labelText),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Colors.white,
            ),
            child: TextFormField(
              obscureText: obscureText,
              decoration: InputDecoration(
                prefixIcon: prefixIcon,
                prefixIconColor: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
