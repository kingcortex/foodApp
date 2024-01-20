import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class CustomTextField extends StatefulWidget {
  final String labelText;
  final String hintText;
  final bool isPassword;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  const CustomTextField({
    required this.labelText,
    required this.hintText,
    this.isPassword = false,
    required this.controller,
    required this.validator,
    super.key
    });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.labelText,
            style: AppTheme.smallRegular(color: AppTheme.gray1),
          ),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: widget.controller,
            validator: widget.validator,
            obscureText: widget.isPassword? isVisible : false,
            decoration: InputDecoration(
              suffixIcon: widget.isPassword? IconButton(
                onPressed: (){
                  setState(() {
                    isVisible = !isVisible;
                  });
                }, 
                icon: Icon(isVisible? Icons.visibility_off: Icons.visibility)
                ): null,

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  width: 2,
                  color: AppTheme.gray4,
                )
              ),

              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  width: 2,
                  color: AppTheme.gray4,
                )
              ),

              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  width: 2,
                  color: AppTheme.gray4,
                )
              ),
              
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  width: 2,
                  color: Colors.red
                )
              ),

              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  width: 2,
                  color: Colors.red,
                )
              ),
              contentPadding: const EdgeInsets.all(20),
              hintText: widget.hintText,
              hintStyle: AppTheme.smallerRegular(color: AppTheme.gray4)
            ),
          )
        ],
      ),
    );
  }
}