import 'package:flutter/material.dart';


import '../const.dart';

class CustomButton extends StatelessWidget {
 final  String buttonText;
  final VoidCallback buttonOnPressed;
  final double width;
  const CustomButton(
    {  
    required this.buttonText,
    required this.buttonOnPressed,
    required this.width,
      Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: buttonOnPressed,
      child: Container(
        width: width,
        height: 50,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(10)
        ),
    
        child: Center(
          child: Text(
            buttonText,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white
            ),
          )),
      ),
    );
  }
}