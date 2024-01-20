import 'package:app_cooking/model/user.dart';
import 'package:app_cooking/router/app_router.dart';
import 'package:app_cooking/services/authentication.dart';
import 'package:app_cooking/services/validation_textfield.dart';
import 'package:app_cooking/theme/app_theme.dart';
import 'package:app_cooking/widget/auth_option.dart';
import 'package:app_cooking/widget/custom_buton_1.dart';
import 'package:app_cooking/widget/custom_dialog.dart';
import 'package:app_cooking/widget/custom_textfield_1.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignPageState();
}

class _SignPageState extends State<SignInPage> {
  final Authentication _authentication = Authentication();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics:const BouncingScrollPhysics(),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 94,),
                Text(
                  "HELLO,",
                  style: AppTheme.headerBold(),
                ),
                Text(
                  "Welcome Back!",
                  style: AppTheme.largeRegular(color: AppTheme.gray1)
                ),
                const SizedBox(height: 57),
          
                //////////////////////////
                ///EMAIL
                /////////////////////////
                CustomTextField(
                  controller: emailController,
                  validator: Validation.email,
                  labelText: "Email",
                  hintText: "Enter Email"
                ),
          
                const SizedBox(
                  height: 10,
                ),
          
                /////////////////////////////
                ///PASSWORD
                ////////////////////////////
                CustomTextField(
                  controller: passwordController,
                  validator: Validation.password,
                  isPassword: true,
                  labelText: "Password", 
                  hintText: "Enter Password"
                ),
          
                Text(
                  "Forgot Password",
                  style: AppTheme.smallRegular(color: AppTheme.secondary100),
                ),
          
                const SizedBox(
                  height: 25,
                ),
          
                CustomButton1(
                  text: "Sign in",
                  onPressed:_signIn
                ),
          
                const SizedBox(height: 29),
          
                orSigninWith(),
          
                const SizedBox(height: 29),
          
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
                
                const SizedBox(
                  height: 55,
                ),
          
          
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don’t have an account? ",
                      style: AppTheme.smallerBold(),
                    ),
          
                    GestureDetector(
                      onTap: () => Navigator.pushReplacementNamed(context, AppRoute.signUp),
                      child: Text(
                        "Sign Up ",
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

  void _signIn() async{
    if (formKey.currentState!.validate()) {
      CustomDialog.loading(context);
      AppUser? user = await _authentication.signInEmail(emailController.text, passwordController.text);
      if (user != null) {
        if(context.mounted) Navigator.pop(context);
        if(context.mounted) CustomDialog.success(context);
        Future.delayed(const Duration(seconds: 3), (){navigation();});
        print("trouver");
      }else{
            if(context.mounted) Navigator.pop(context);
            if(context.mounted) CustomDialog.error(context);
            
        print("Error");
      }
    }else {
      print("no");
    }
  }

  void navigation() {
    //Navigate to the HomePage when the user is connected
    Navigator.pushNamed(context, AppRoute.app);
  }
}






////////////////////////////
// Or Sign in With
//////////////////////////// 

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




