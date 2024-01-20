import 'package:app_cooking/router/app_router.dart';
import 'package:app_cooking/theme/app_theme.dart';
import 'package:flutter/material.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images_ols/bg_onboarding.png"),
            fit: BoxFit.fill
            )
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 91,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Container(
                      height: 79,
                      width: 79,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images_ols/cook_hat.png')
                        )
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      "100K+ Premium Recipe ",
                      style: AppTheme.mediumBold(color: Colors.white),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height > 736? MediaQuery.of(context).size.height*.35 :
                      150,
                    ),
                    Text(
                      "Get\nCooking",
                      style: AppTheme.titleBold(color: Colors.white),
                      textAlign:TextAlign.center,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Simple way to find Tasty Recipe",
                      style: AppTheme.normalRegular(color: Colors.white),
                    ),
                    const SizedBox(
                      height: 64,
                    ),
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () async{
                    Navigator.pushReplacementNamed(context, AppRoute.signIn);
                  },
                  // ignore: sort_child_properties_last
                  child: SizedBox(
                    height: 40,
                    width: 143,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Start Cooking",
                          style: AppTheme.normalBold(color: Colors.white),
                        ),
                        const Icon(
                          Icons.arrow_forward_rounded
                        )
                      ],
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.primary100,
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    )
                  )
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}