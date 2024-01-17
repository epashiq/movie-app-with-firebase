import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_app_clean_architecture/feature/movie_feature/presentation/providers/auth_provider.dart';

class HomePage extends ConsumerWidget {
  static const routePath = '/';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
            onPressed: () async {
              await ref.read(authenticationProvider.notifier).logOut(context);
            },
            child: const Text('logout')),
      ),
    );
  }
}
