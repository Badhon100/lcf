import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';
import 'package:lcf/ui/ui.dart';

import '../../widgets/widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController;
    passwordController;
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return WillPopScope(

      onWillPop: ()async{
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text("Login"),
        ),
        body: GestureDetector(
          onTap: (){
            FocusManager.instance.primaryFocus!.unfocus();
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                padding: EdgeInsets.symmetric(horizontal: width*0.1),
                child: CustomTextField(
                  emailController: emailController,
                  hintText: "Email",
                  prefixIcon: const Icon(Icons.alternate_email),
          
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width*0.1),
                child: CustomTextField(
                  emailController: emailController,
                  hintText: "Password",
                  prefixIcon: const Icon(Icons.lock),
                  obscureText: true,
                ),
              ),
                  ],
                )
              ),
              
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width*0.2),
                child: CustomButton(
                  width: width*0.8,
                  buttonText: "Login", 
                  buttonOnPressed: (){
                    if(_formKey.currentState!.validate()){
                      
                    }
                  }
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Dont have an account?"),
                  TextButton(
                    onPressed: (){
                      Get.to(()=> const SignUp());
                    }, 
                    child: const Text("Sign up"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

