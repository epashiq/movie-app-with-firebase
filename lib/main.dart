import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_clean_architecture/core/objectbox/movie_objectbox_store.dart';
import 'package:movie_app_clean_architecture/core/router/router.dart';
import 'package:movie_app_clean_architecture/core/theme/light_theme.dart';
import 'package:movie_app_clean_architecture/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await MovieObjectBox.create();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      routerConfig: ref.watch(routerProvider),
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ref.watch(lightThemeProvider),
      // home: const LoginPage(),
    );
  }
}
