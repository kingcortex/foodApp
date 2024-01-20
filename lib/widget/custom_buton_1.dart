import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class CustomButton1 extends StatefulWidget {
  final String text;
  final void Function()? onPressed;
  const CustomButton1({
    required this.text,
    this.onPressed,
    super.key
  });

  @override
  State<CustomButton1> createState() => _CustomButton1State();
}

class _CustomButton1State extends State<CustomButton1> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      // ignore: sort_child_properties_last
      child: SizedBox(
        height: 40,
        width: 143,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.text,
              style: AppTheme.normalBold(color: Colors.white),
            ),
            const SizedBox(width: 11,),
            const Icon(
              Icons.arrow_forward_rounded
            )
          ],
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppTheme.primary100,
        padding: const EdgeInsets.symmetric(vertical: 18),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        ),
        minimumSize: const Size(double.infinity, 0)
      )
    );
  }
}