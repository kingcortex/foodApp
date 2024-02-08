import 'package:app_cooking/app.dart';
import 'package:app_cooking/model/my_shared_preferences.dart';
import 'package:app_cooking/provider/home_filter_provider.dart';
import 'package:app_cooking/router/app_router.dart';
import 'package:app_cooking/screens/can.dart';
//import 'package:app_cooking/screens/home_page.dart';
import 'package:app_cooking/screens/profile_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'bottom_navigation/botom_navigation_provider.dart';

import 'firebase_options.dart';
import 'screens/search_recipes_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await MySharedPreference.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BottomNAvigationState()),
        ChangeNotifierProvider(create: (context) => HomeFilterState())
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        // onGenerateRoute: onGenerateRoute,
        title: "Cooking",
        onGenerateRoute: onGenerateRoute,
      ),
    );
  }
}
