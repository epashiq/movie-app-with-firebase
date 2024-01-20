import 'package:flutter/material.dart';
import 'package:movie_app_clean_architecture/core/theme/app_theme.dart';

class LoginButton extends StatelessWidget {
  final String? btText;
  final void Function() onTap;
  final TextEditingController? emailController;
  final TextEditingController? passwordController;
  const LoginButton(
      {super.key,
      required this.btText,
      required this.onTap,
      required this.emailController,
      required this.passwordController});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      height: 60,
      child: TextButton(
        onPressed: onTap,
        style: TextButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            backgroundColor: AppTheme.of(context).colors.primary),
        child: Text(btText!),
      ),
    );
  }
}
