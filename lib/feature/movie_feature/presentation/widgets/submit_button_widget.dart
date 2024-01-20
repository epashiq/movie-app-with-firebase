import 'package:flutter/material.dart';
import 'package:movie_app_clean_architecture/core/constants/login_constants/login_constants.dart';
import 'package:movie_app_clean_architecture/core/theme/app_theme.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
       height: AppTheme.of(context).spaces.space_700,
      width: AppTheme.of(context).spaces.space_900 * 5.2,
      child: ElevatedButton(onPressed: (){
        
      }, child: Text(LoginConstants.submitBtn)),
    );
  }
}