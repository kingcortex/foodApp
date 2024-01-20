import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(13.5),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: AppTheme.primary100
      ),
      child: const Icon(Icons.add,size: 30, color: Colors.white,),
    );
  }
}