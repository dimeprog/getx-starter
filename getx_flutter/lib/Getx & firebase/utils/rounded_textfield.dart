import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:getx_flutter/Getx%20&%20firebase/controllers/config.dart';

class RoundedTextField extends StatelessWidget {
  final validator;
  final controller;
  final String? hintText;
  final bool obsecure;

  const RoundedTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.validator,
    this.obsecure = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: key,
      controller: controller,
      obscureText: obsecure,
      validator: validator,
      style: TextStyle(
        color: Colors.black,
        fontSize: getHeight(16),
        fontWeight: FontWeight.w600,
      ),
      decoration: InputDecoration(
        fillColor: Colors.white54,
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white54, width: getHeight(3.0)),
          borderRadius: BorderRadius.circular(
            getHeight(30),
          ),
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.black,
          fontSize: getHeight(16),
          fontWeight: FontWeight.w600,
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.blue, width: 2.0),
          borderRadius: BorderRadius.circular(
            getHeight(30),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.lightBlue, width: 3.0),
          borderRadius: BorderRadius.circular(
            getHeight(30),
          ),
        ),
      ),
    );
  }
}
