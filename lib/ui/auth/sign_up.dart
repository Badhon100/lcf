import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lcf/ui/auth/login_screen.dart';

import '../../widgets/widget.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
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
    return Scaffold(
      appBar: AppBar(
        title: const Text("Signup"),
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
                emailController: passwordController,
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
                buttonText: "Sign up", 
                buttonOnPressed: (){
                  if(_formKey.currentState!.validate()){
                    _auth.createUserWithEmailAndPassword(
                      email: emailController.text.trim().toString(), 
                      password: passwordController.text.toString()
                    );
                  }
                }
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have an account?"),
                TextButton(
                  onPressed: (){
                    Get.to(()=> const LoginScreen());
                  }, 
                  child: const Text("login"))
              ],
            )
          ],
        ),
      ),
    );
  }
}