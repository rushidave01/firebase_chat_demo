import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  final TextEditingController controller;
  final bool obsecure;
  final String hintText;
  const MyTextField(
      {super.key,
      required this.controller,
      required this.obsecure,
      required this.hintText});

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: widget.obsecure,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade200)),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white)),
          fillColor: Colors.grey[100],
          filled: true,
          hintText: widget.hintText,
          hintStyle: const TextStyle(color: Colors.grey)),
    );
  }
}
