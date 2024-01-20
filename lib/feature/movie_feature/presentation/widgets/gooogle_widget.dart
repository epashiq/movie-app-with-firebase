import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_clean_architecture/core/constants/login_constants/login_constants.dart';
import 'package:movie_app_clean_architecture/core/theme/app_theme.dart';
import 'package:movie_app_clean_architecture/feature/movie_feature/presentation/providers/auth_provider.dart';

class GoogleButton extends ConsumerWidget {
  const GoogleButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: AppTheme.of(context).spaces.space_700,
      width: AppTheme.of(context).spaces.space_900 * 5.2,
      child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(
                  AppTheme.of(context).colors.textSubtlest)),
          onPressed: () {
            ref.read(authenticationProvider.notifier).signInWithGoogle(context);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(LoginConstants.googletxt,style: (AppTheme.of(context).typography.h400),),
              Image.network(
                'https://static.secure.website/wscfus/1137012/5526261/google-logo-icon-png-transparent-background-w1000-o.png',
                height: AppTheme.of(context).spaces.space_300,
                width: AppTheme.of(context).spaces.space_300,
              )
            ],
          )),
    );
  }
}
