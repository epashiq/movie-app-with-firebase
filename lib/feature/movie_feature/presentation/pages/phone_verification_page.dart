import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_app_clean_architecture/core/constants/login_constants/login_constants.dart';
import 'package:movie_app_clean_architecture/core/theme/app_theme.dart';
import 'package:movie_app_clean_architecture/feature/movie_feature/presentation/providers/auth_provider.dart';
import 'package:movie_app_clean_architecture/feature/movie_feature/presentation/widgets/elevated_button.dart';
import 'package:movie_app_clean_architecture/feature/movie_feature/presentation/widgets/textfield_widget.dart';

class PhoneVerification extends HookConsumerWidget {
  static const routPath = '/phone';
  const PhoneVerification({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mobController = useTextEditingController();
    return Scaffold(
      backgroundColor: AppTheme.of(context).colors.secondary,
      body: Padding(
        padding: EdgeInsets.all(AppTheme.of(context).spaces.space_300),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFieldWidget(
                  labelText: LoginConstants.phoneNbr,
                  textfieldIcon: const Icon(Icons.call),
                  controller: mobController),
              SizedBox(
                height: AppTheme.of(context).spaces.space_150,
              ),
              LoginButton(
                  btText: 'send otp',
                  onTap: () => ref
                      .read(authenticationProvider.notifier)
                      .verifyPhoneNumber(mobController.text, context),
                  emailController: mobController,
                  passwordController: null)
            ],
          ),
        ),
      ),
    );
  }
}
