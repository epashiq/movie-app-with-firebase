import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_app_clean_architecture/core/constants/login_constants/login_constants.dart';
import 'package:movie_app_clean_architecture/core/theme/app_theme.dart';
import 'package:movie_app_clean_architecture/feature/movie_feature/presentation/pages/sign_page.dart';
import 'package:movie_app_clean_architecture/feature/movie_feature/presentation/providers/auth_provider.dart';
import 'package:movie_app_clean_architecture/feature/movie_feature/presentation/widgets/gooogle_widget.dart';
import 'package:movie_app_clean_architecture/feature/movie_feature/presentation/widgets/elevated_button.dart';
import 'package:movie_app_clean_architecture/feature/movie_feature/presentation/widgets/phone_widget.dart';
import 'package:movie_app_clean_architecture/feature/movie_feature/presentation/widgets/textfield_widget.dart';

class LoginPage extends HookConsumerWidget {
  static const routPath = '/loginPage';
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    return Scaffold(
      backgroundColor: AppTheme.of(context).colors.secondary,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: AppTheme.of(context).spaces.space_900 * 2,
              ),
              Center(
                child: Text(LoginConstants.loginTitle,
                    style: AppTheme.of(context).typography.h1000.copyWith(
                        color: AppTheme.of(context).colors.textSubtle)),
              ),
              SizedBox(
                height: AppTheme.of(context).spaces.space_700,
              ),
              TextFieldWidget(
                controller: emailController,
                labelText: LoginConstants.userTxt,
                textfieldIcon: const Icon(Icons.mail),
              ),
              SizedBox(
                height: AppTheme.of(context).spaces.space_250,
              ),
              TextFieldWidget(
                controller: passwordController,
                labelText: LoginConstants.passTxt,
                textfieldIcon: const Icon(Icons.remove_red_eye_outlined),
              ),
              SizedBox(
                height: AppTheme.of(context).spaces.space_250,
              ),
              LoginButton(
                emailController: emailController,
                passwordController: passwordController,
                btText: LoginConstants.buttonText,
                onTap: () => ref
                    .read(authenticationProvider.notifier)
                    .loginAuth(
                        emailController.text, passwordController.text, context),
              ),
              SizedBox(
                height: AppTheme.of(context).spaces.space_150,
              ),
              InkWell(
                  onTap: () {
                    ref
                        .read(authenticationProvider.notifier)
                        .resetPassword(context, emailController.text);
                  },
                  child: Text(
                    LoginConstants.forgotPassTxt,
                    style: TextStyle(
                        color: AppTheme.of(context).colors.textSubtlest),
                  )),
              SizedBox(
                height: AppTheme.of(context).spaces.space_900 * 1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    LoginConstants.forgot,
                    // style: TextStyle(color: AppTheme.of(context).colors.textSubtlest,)
                    style: AppTheme.of(context).typography.h200,
                  ),
                  SizedBox(
                    width: AppTheme.of(context).spaces.space_100,
                  ),
                  InkWell(
                      onTap: () {
                        // context.push(SignPage.routPath);
                        context.push(SignPage.routPath);
                      },
                      child: Text(
                        LoginConstants.signUp,
                        style: TextStyle(
                            color:
                                AppTheme.of(context).colors.backgroundDanger),
                      )),
                ],
              ),
              SizedBox(
                height: AppTheme.of(context).spaces.space_400,
              ),
              const GoogleButton(),
              SizedBox(height: AppTheme.of(context).spaces.space_150),
              const ContinuWithNumber()
            ],
          ),
        ),
      ),
    );

    // return Placeholder();
  }
}
