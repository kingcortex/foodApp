import 'package:flutter/material.dart';

Widget buttonSignInOption({required String imagePath}) {
  return Container(
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      boxShadow: const [
        BoxShadow(
        color: Color(0xff696969),
        blurRadius: 2.5,
        offset: Offset(0, 0),
      ),
      ]
    ),
    child: Container(
      height: 24,
      width: 24,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath)
        )
      ),
    ),
  );
}