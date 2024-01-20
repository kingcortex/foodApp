import '../theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchTextField extends StatefulWidget {
  void Function()? onTap;
  SearchTextField({
    this.onTap,
    super.key,
  });

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextField(
        onTap: widget.onTap,
        decoration: InputDecoration(
          hintText: 'Search recipe',
          hintStyle: AppTheme.smallerRegular(color: AppTheme.gray4),
          prefixIcon: SizedBox(
            width: 18,
            height: 18,
            child: SvgPicture.asset(
              "assets/icons/search-normal.svg",
              fit: BoxFit.scaleDown,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              width: 2,
              color: AppTheme.gray4
            ) 
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              width: 2,
              color: AppTheme.gray4
            ) 
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              width: 2,
              color: AppTheme.primary100
            ) 
          ),
        ),
      )
    );
  }
}