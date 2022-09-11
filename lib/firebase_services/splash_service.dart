import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../ui/auth/login_screen.dart';

class SplashService{
  void isLogin(BuildContext context){
    Timer(const Duration(seconds: 2), ()=>Navigator.push(
        context, MaterialPageRoute(builder: (context)=> const LoginScreen()))
    );
  }
}