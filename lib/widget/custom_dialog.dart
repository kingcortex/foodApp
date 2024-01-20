import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class CustomDialog {
  
  static void loading(BuildContext context) {
    showDialog(
        barrierDismissible: false,
      context: context,
      builder: (context){
        return Center(
          child: Container(
            alignment: Alignment.center,
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const CircularProgressIndicator(
              color: AppTheme.primary100,
            ),
          )
        );
      }
    );
  }
  static void error(BuildContext context) async{
    showDialog(
        barrierDismissible: false,
      context: context,
      builder: (context){
        return Center(
          child: Container(
            alignment: Alignment.center,
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              Icons.error,
              color: Colors.red.shade300,
              size: 60,
            )
          )
        );
      }
    );
    Future.delayed(const Duration(seconds: 2),
      (){
        Navigator.pop(context);
      }
    );
  }

  static void success(BuildContext context) async{
    showDialog(
        barrierDismissible: false,
      context: context,
      builder: (context){
        return Center(
          child: Container(
            alignment: Alignment.center,
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.check_circle_rounded,
              color: AppTheme.successColor,
              size: 60,
            )
          )
        );
      }
    );
    Future.delayed(const Duration(seconds: 2),
      (){
        Navigator.pop(context);
      }
    );
  }
}