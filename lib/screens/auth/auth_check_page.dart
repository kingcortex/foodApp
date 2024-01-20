import 'package:app_cooking/model/my_shared_preferences.dart';
import 'package:app_cooking/screens/home_page.dart';
import 'package:app_cooking/screens/onboarding.dart';
import 'package:flutter/material.dart';

class AuthCheckPage extends StatelessWidget {
  const AuthCheckPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: MySharedPreference.getIsConnected(), 
      builder: (context,snapshot) {
        if(snapshot.connectionState == ConnectionState.done){
          return snapshot.data! ?const HomePage() : const Onboarding();
        }else{
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
            );
        }
      }
    );
  }
}