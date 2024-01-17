import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_app_clean_architecture/core/constants/login_constants/login_constants.dart';
import 'package:movie_app_clean_architecture/core/theme/app_theme.dart';
import 'package:movie_app_clean_architecture/feature/movie_feature/presentation/pages/sign_page.dart';
import 'package:movie_app_clean_architecture/feature/movie_feature/presentation/providers/auth_provider.dart';
import 'package:movie_app_clean_architecture/feature/movie_feature/presentation/widgets/gooogle_widget.dart';
import 'package:movie_app_clean_architecture/feature/movie_feature/presentation/widgets/login_button.dart';
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
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: AppTheme.of(context).spaces.space_900 * 2.5,
            ),
            Center(
              child: Text(loginConstants.loginTitle,
                  style: AppTheme.of(context)
                      .typography
                      .h1000
                      .copyWith(color: AppTheme.of(context).colors.textSubtle)),
            ),
            SizedBox(
              height: AppTheme.of(context).spaces.space_900,
            ),
            TextFieldWidget(
              controller: emailController,
              labelText: loginConstants.userTxt,
              textfieldIcon: const Icon(Icons.mail),
            ),
            SizedBox(
              height: AppTheme.of(context).spaces.space_250,
            ),
            TextFieldWidget(
              controller: passwordController,
              labelText: loginConstants.passTxt,
              textfieldIcon: const Icon(Icons.remove_red_eye_outlined),
            ),
            SizedBox(
              height: AppTheme.of(context).spaces.space_250,
            ),
            LoginButton(
              emailController: emailController,
              passwordController: passwordController,
              btText: loginConstants.buttonText,
              onTap: () => ref.read(authenticationProvider.notifier).loginAuth(
                  emailController.text, passwordController.text, context),
            ),
            SizedBox(
              height: AppTheme.of(context).spaces.space_900 * 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  loginConstants.forgot,
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
                      loginConstants.signUp,
                      style: TextStyle(
                          color: AppTheme.of(context).colors.backgroundDanger),
                    )),
              ],
            ),
            SizedBox(
              height: AppTheme.of(context).spaces.space_400,
            ),
            GoogleButton(
              
            )
          ],
        ),
      ),
    );

    // return Placeholder();
  }
}
