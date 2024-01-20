
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Colors
  static const Color neutralColor = Color(0xFF000000);
  static const Color gray1 = Color(0xFF484848);
  static const Color gray2 = Color(0xFF797979);
  static const Color gray3 = Color(0xFFA9A9A9);
  static const Color gray4 = Color(0xFFD9D9D9);
  static const Color whiteColor = Color(0xFFFFFFFF);

  static const Color primary100 = Color(0xFF129575);
  static const Color primary80 = Color(0xFF71B1A1);
  static const Color primary60 = Color(0xFFAFD3CA);
  static const Color primary40 = Color(0xFFDBEBE7);
  static const Color primary20 = Color(0xFFF6FAF9);

  static const Color secondary100 = Color(0xFFFF9C00);
  static const Color secondary80 = Color(0xFFFFA61A);
  static const Color secondary60 = Color(0xFFFFBA4D);
  static const Color secondary40 = Color(0xFFFFCE80);
  static const Color secondary20 = Color(0xFFFFE1B3);

  static const Color ratingColor = Color(0xFFFFAD30);
  static const Color warningColor = Color(0xFF804E00);
  static const Color successColor = Color(0xFF31B057);
  static const Color success10Color = Color(0xFFEAF7EE);

  // Typography
  static const String fontFamily = 'Poppins';

  static TextStyle titleBold({Color color = neutralColor}) {
    return GoogleFonts.poppins(
      fontWeight: FontWeight.bold,
      fontSize: 50,
      height: 1,
      color: color,
    );
  }

  static TextStyle headerBold({Color color = neutralColor}) {
    return GoogleFonts.poppins(
      fontWeight: FontWeight.bold,
      fontSize: 30,
      height: 1.5,
      color: color,
    );
  }

  static TextStyle largeBold({Color color = neutralColor}) {
    return GoogleFonts.poppins(
      fontWeight: FontWeight.bold,
      fontSize: 20,
      height: 1.5,
      color: color,
    );
  }

  static TextStyle mediumBold({Color color = neutralColor}) {
    return GoogleFonts.poppins(
      fontWeight: FontWeight.bold,
      fontSize: 18,
      height: 1.5,
      color: color,
    );
  }

  static TextStyle normalBold({Color color = neutralColor}) {
    return GoogleFonts.poppins(
      fontWeight: FontWeight.bold,
      fontSize: 16,
      height: 1.5,
      color: color,
    );
  }

  static TextStyle smallBold({Color color = neutralColor}) {
    return GoogleFonts.poppins(
      fontWeight: FontWeight.bold,
      fontSize: 14,
      height: 1.5,
      color: color,
    );
  }

  static TextStyle smallerBold({Color color = neutralColor}) {
    return GoogleFonts.poppins(
      fontWeight: FontWeight.bold,
      fontSize: 11,
      height: 1.5,
      color: color,
    );
  }

  static TextStyle titleRegular({Color color = neutralColor}) {
    return GoogleFonts.poppins(
      fontSize: 50,
      height: 1.5,
      color: color,
    );
  }

  static TextStyle headerRegular({Color color = neutralColor}) {
    return GoogleFonts.poppins(
      fontSize: 30,
      height: 1.5,
      color: color,
    );
  }

  static TextStyle largeRegular({Color color = neutralColor}) {
    return GoogleFonts.poppins(
      fontSize: 20,
      height: 1.5,
      color: color,
    );
  }

  static TextStyle mediumRegular({Color color = neutralColor}) {
    return GoogleFonts.poppins(
      fontSize: 18,
      height: 1.5,
      color: color,
    );
  }

  static TextStyle normalRegular({Color color = neutralColor}) {
    return GoogleFonts.poppins(
      fontSize: 16,
      height: 1,
      color: color,
    );
  }

  static TextStyle smallRegular({Color color = neutralColor}) {
    return GoogleFonts.poppins(
      fontSize: 14,
      height: 1.5,
      color: color,
    );
  }

  static TextStyle smallerRegular({Color color = neutralColor}) {
    return GoogleFonts.poppins(
      fontSize: 11,
      height: 1.5,
      color: color,
    );
  }
}
