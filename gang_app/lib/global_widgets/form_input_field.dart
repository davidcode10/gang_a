import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FormInputField extends StatelessWidget {
  const FormInputField(
      {Key? key,
      this.validator,
      required this.hintText,
      required this.obscureText,
      required this.minLines,
      required this.maxLines,
      required this.onChange,
      required this.onSaved,
      required this.controller,
      required this.keyboardType,
      this.suffixIcon})
      : super(key: key);
  final String? Function(String?)? validator;
  final String hintText;
  final bool obscureText;
  final int minLines;
  final int maxLines;
  final void Function(String) onChange;
  final void Function(String?) onSaved;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final Widget? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        style: GoogleFonts.roboto(fontSize: 16, color: const Color(0xff434343)),
        decoration: InputDecoration(
            labelStyle: GoogleFonts.roboto(
                fontSize: 16, color: const Color(0xff434343)),
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(2))),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xff434343), width: 2),
            ),
            focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xff434343), width: 2)),
            hintText: hintText,
            hintStyle: const TextStyle(
                color: Color(0xff434343),
                fontSize: 12,
                fontWeight: FontWeight.w300),
            suffixIcon: suffixIcon),
        onChanged: onChange,
        onSaved: onSaved,
        validator: validator,
        obscureText: obscureText,
        maxLines: maxLines,
        controller: controller,
        keyboardType: keyboardType,
        minLines: minLines);
  }
}
