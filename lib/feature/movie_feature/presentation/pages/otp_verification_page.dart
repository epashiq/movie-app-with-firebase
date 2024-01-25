import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_app_clean_architecture/core/constants/login_constants/login_constants.dart';
import 'package:movie_app_clean_architecture/core/theme/app_theme.dart';
import 'package:movie_app_clean_architecture/feature/movie_feature/presentation/providers/auth_provider.dart';
import 'package:movie_app_clean_architecture/feature/movie_feature/presentation/widgets/elevated_button.dart';
import 'package:movie_app_clean_architecture/feature/movie_feature/presentation/widgets/textfield_widget.dart';

class OtpVerification extends HookConsumerWidget {
  static const routPath = '/otppage';
  const OtpVerification({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final otpController = useTextEditingController();
    return Scaffold(
      backgroundColor: AppTheme.of(context).colors.secondary,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFieldWidget(
                labelText: LoginConstants.otpText,
                textfieldIcon: const Icon(Icons.call),
                controller: otpController),
            SizedBox(
              height: AppTheme.of(context).spaces.space_150,
            ),
            LoginButton(
                btText: LoginConstants.otpTxt,
                onTap: () => ref
                    .read(authenticationProvider.notifier)
                    .verifyOtp(context, otpController.text),
                emailController: otpController,
                passwordController: null)
          ],
        ),
      ),
    );
  }
}
