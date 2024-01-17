import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_app_clean_architecture/core/constants/login_constants/login_constants.dart';
import 'package:movie_app_clean_architecture/core/theme/app_theme.dart';
import 'package:movie_app_clean_architecture/feature/movie_feature/presentation/providers/auth_provider.dart';
import 'package:movie_app_clean_architecture/feature/movie_feature/presentation/widgets/login_button.dart';
import 'package:movie_app_clean_architecture/feature/movie_feature/presentation/widgets/textfield_widget.dart';

class SignPage extends HookConsumerWidget {
  static const routPath = '/signup';
  const SignPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    return Scaffold(
      backgroundColor: AppTheme.of(context).colors.secondary,
      body: Column(
        children: [
          SizedBox(height: AppTheme.of(context).spaces.space_900),
          Center(
              child: Text(
            loginConstants.createAc,
            style: AppTheme.of(context).typography.h900,
          )),
          SizedBox(height: AppTheme.of(context).spaces.space_600),
          const TextFieldWidget(
              controller: null,
              labelText: loginConstants.userTxt,
              textfieldIcon: Icon(Icons.person)),
          SizedBox(height: AppTheme.of(context).spaces.space_200),
          const TextFieldWidget(
              controller: null,
              labelText: loginConstants.mobTxt,
              textfieldIcon: null),
          SizedBox(height: AppTheme.of(context).spaces.space_200),
          TextFieldWidget(
              controller: emailController,
              labelText: loginConstants.emailTxt,
              textfieldIcon: const Icon(Icons.email_outlined)),
          SizedBox(height: AppTheme.of(context).spaces.space_200),
          TextFieldWidget(
              controller: passwordController,
              labelText: loginConstants.passTxt,
              textfieldIcon: const Icon(Icons.remove_red_eye_outlined)),
          SizedBox(height: AppTheme.of(context).spaces.space_200),
          LoginButton(
            emailController: emailController,
            passwordController: passwordController,
            btText: loginConstants.signUp,
            onTap: () {
              ref.read(authenticationProvider.notifier).signUpAuth(
                emailController.text, passwordController.text, context);
            },
          )
        ],
      ),
    );
  }
}
