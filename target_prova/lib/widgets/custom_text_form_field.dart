import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  final String labelText;
  final String? hintText;
  final String? Function(String?)? validator;
  final Function(String?)? onFieldSubmitted;
  final int? maxLength;
  final bool obscureText;
  final bool autofocus;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final TextAlign textAlign;
  final List<TextInputFormatter>? inputFormatters;

  const CustomTextFormField({
    this.labelText = '',
    this.hintText,
    this.maxLength,
    this.obscureText = false,
    this.autofocus = false,
    this.validator,
    this.onFieldSubmitted,
    this.prefixIcon,
    this.controller,
    this.textAlign = TextAlign.start,
    this.inputFormatters,
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
            padding: const EdgeInsets.fromLTRB(8, 0, 0, 8),
            child: Text(labelText),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Colors.white,
            ),
            child: TextFormField(
              controller: controller,
              inputFormatters: inputFormatters ?? [],
              validator: validator,
              onFieldSubmitted: onFieldSubmitted,
              
              obscureText: obscureText,
              textAlign: textAlign,
              maxLength: maxLength,
              autofocus: autofocus,
              decoration: InputDecoration(
                prefixIcon: prefixIcon,
                prefixIconColor: Colors.black,
                hintText: hintText,
                hintStyle: const TextStyle(fontWeight: FontWeight.bold),
                counterText: "",
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
