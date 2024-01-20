import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Can extends StatelessWidget {
  const Can({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Text(
              'Jour de match',
              style: GoogleFonts.poppins(
                fontSize: 60
              ),
            )
          ]
        )
      )
    );
  }
}