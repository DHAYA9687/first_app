import 'package:flutter/material.dart';

class Customfromfield extends StatelessWidget {
  final bool obsecure;
  final String hintText;
  final String? Function(String?) validator;
  const Customfromfield(
      {super.key,
      this.obsecure = false,
      required this.hintText,
      required this.validator});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: hintText,
          hintText: hintText,
        ),
        obscureText: obsecure,
        validator: validator,
      ),
    );
  }
}
