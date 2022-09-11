import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final Icon prefixIcon;
  final bool obscureText;
  const CustomTextField({
    Key? key,
    required this.emailController,
    required this.hintText,
    required this.prefixIcon,
    this.obscureText = false,
  }) : super(key: key);

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: emailController,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        prefix: prefixIcon,
      ),
      validator: (value){
        if(value!.isEmpty){
          return "Enter $hintText";
        }else{
          return null;
        }
      },
    );
  }
}