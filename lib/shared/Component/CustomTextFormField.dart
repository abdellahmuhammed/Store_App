// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final GlobalKey<FormState>? formKey;
  final String label;
  final TextEditingController? controller;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool? passwordSecure;
  final String stringValidate;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final Function(String) onFieldSubmitted;
  final double radius;

  const CustomTextFormField({
    super.key,
    this.formKey,
    required this.label,
    this.prefixIcon,
    this.stringValidate = 'some info is missed',
    this.suffixIcon,
    this.controller,
    this.passwordSecure = false,
    this.keyboardType,
    this.onChanged,
    required this.onFieldSubmitted,
    this.radius =10,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      keyboardType: keyboardType,
      controller: controller,
      obscureText: passwordSecure!,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(radius)),
        label: Text(label, maxLines: 1, overflow: TextOverflow.ellipsis),
        prefixIcon: Icon(prefixIcon),
        suffixIcon: IconButton(
          onPressed: () {},
          icon: Icon(suffixIcon),
        ),
      ),
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}
