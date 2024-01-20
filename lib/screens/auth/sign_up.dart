
import 'package:app_cooking/router/app_router.dart';
import 'package:app_cooking/services/authentication.dart';
import 'package:app_cooking/services/validation_textfield.dart';
import 'package:app_cooking/widget/custom_buton_1.dart';
import 'package:app_cooking/widget/custom_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';
import '../../widget/auth_option.dart';
import '../../widget/custom_textfield_1.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final Authentication _authentication = Authentication();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isCheked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10,),
                Text(
                  "Create an account",
                  style: AppTheme.largeBold(),
                ),
                Text(
                  "Let’s help you set up your account, \nit won’t take",
                  style: AppTheme.smallerRegular(color: AppTheme.gray1)
                ),
                const SizedBox(height: 20,),
          
                ///////////////////////////
                ///NAME
                ////////////////////////// 
                CustomTextField(
                  controller: nameController, 
                  validator: Validation.name,
                  labelText: "Name", 
                  hintText: "Enter Name", 
                ),
          
                /////////////////////////
                ///EMAIL
                ////////////////////////
                CustomTextField(
                  controller: emailController,
                  validator: Validation.email,
                  labelText: "Email",
                  hintText: "Enter Email"
                ),
          
                ///////////////////////////
                ///PASSWORD
                //////////////////////////
                CustomTextField(
                  controller: passwordController,
                  validator: Validation.password,
                  labelText: "Password", 
                  hintText: "Enter Password"
                ),
                ///////////////////////////
                ///CONFIRM PASSWORD
                //////////////////////////
                CustomTextField(
                  controller: confirmPasswordController,
                  validator: (value){
                    return Validation.confirmPassWord(
                      value: value,
                      password: passwordController.text
                    );
                  },
                  labelText: "Confirm Password", 
                  hintText: "Retype Password"
                ),
              Row(
                children: [
                  Checkbox(
                    activeColor: AppTheme.secondary100,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                      side: const BorderSide(
                        color: AppTheme.secondary100,
                        width: 2,
                      )
                    ),
                    value: isCheked, 
                    onChanged: (value){
                      setState(() {
                        isCheked = value!;
                      });
                    }
                  ),
                  Text(
                    " Accept terms & Condition",
                    style: AppTheme.smallerRegular(color: AppTheme.secondary100),
                  ),
                ],
              ),
                const SizedBox(height: 26,),
                CustomButton1(
                  text: "Sign Up",
                  onPressed: () async{
                    if (formKey.currentState!.validate()) {
                      CustomDialog.loading(context);
                      User? user = await _authentication.signUpEmail(
                        name: nameController.text, 
                        email: emailController.text, 
                        password: passwordController.text);
                      if (user != null) {
                        if(context.mounted) Navigator.pop(context);
                        navigation();
                        print("inscrit");
                      } else{
                        print("Error");
                      }
                    }else {
                      print("no");
                    }
                  },
                ),
                const SizedBox(height: 14,),
          
                orSigninWith(),
          
                const SizedBox(height: 20,),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          buttonSignInOption(imagePath: "assets/images_ols/icon-google.png"),
                          const SizedBox(width: 35),
                          buttonSignInOption(imagePath: "assets/images_ols/facebook.png")
                        ],
                      )
                    ],
                ),
                const SizedBox(height: 20,),
          
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already a member? ",
                      style: AppTheme.smallerRegular(),
                    ),
          
                    GestureDetector(
                      onTap: () => Navigator.pushReplacementNamed(context, AppRoute.signIn),
                      child: Text(
                        "Sign In ",
                        style: AppTheme.smallerBold(color: AppTheme.secondary100),
                      ),
                    ),
          
                  ],
                ),
          
                const SizedBox(height: 30,)
              ],
            ),
          ),
        ),
      ),
    );
  }

  void navigation() {
    //Navigate to the HomePage when the user is connected
    Navigator.pushNamed(context, AppRoute.app);
  }
}


Widget orSigninWith() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        height: 1,
        width: 50,
        color: AppTheme.gray4,
      ),
      const SizedBox(width: 6),
      Text(
        "Or Sign in With",
        style: AppTheme.smallerRegular(color: AppTheme.gray4),
      ),

      const SizedBox(width: 6),

      Container(
        height: 1,
        width: 50,
        color: AppTheme.gray4,
      ),
      
    ],
  );
}