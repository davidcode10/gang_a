import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GlobalTextField extends StatelessWidget {
  GlobalTextField(
      {Key? key,
      required this.obscureText,
      required this.hintText,
      this.suffixIcon,
      this.onSave,
      this.onChange,
      this.validator,
      this.inputFormaters,
      required this.keyboardType,
      this.controller,
      required this.maxLines,
      required this.minLines})
      : super(key: key);

  final bool obscureText;
  final String hintText;
  final Widget? suffixIcon;
  final Function(String?)? onSave;
  final Function(String)? onChange;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final int maxLines;
  final int minLines;
  final List<TextInputFormatter>? inputFormaters;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      cursorColor: Colors.black,
      keyboardType: keyboardType,
      inputFormatters: inputFormaters,
      maxLines: maxLines,
      minLines: minLines,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        fillColor: Colors.white,
        filled: true,
        hintText: hintText,
        hintStyle: const TextStyle(fontSize: 14, color: Colors.black),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black)),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
      ),
      controller: controller,
      onChanged: onChange,
      onSaved: onSave,
      validator: validator,
    );
  }
}