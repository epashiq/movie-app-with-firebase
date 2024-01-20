import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app_clean_architecture/core/constants/login_constants/login_constants.dart';
import 'package:movie_app_clean_architecture/core/theme/app_theme.dart';
import 'package:movie_app_clean_architecture/feature/movie_feature/presentation/pages/phone_verification_page.dart';

class ContinuWithNumber extends StatelessWidget {
  const ContinuWithNumber({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppTheme.of(context).spaces.space_700,
      width: AppTheme.of(context).spaces.space_900 * 5.2,
      child: ElevatedButton(
          onPressed: () {
            context.push(PhoneVerification.routPath);
          },
          child: const Text(LoginConstants.phoneTxt)),
    );
  }
}
