import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/presentation/provider/api_movie_provider.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/presentation/widgets/gridview_widget.dart';

class FavouriteMovies extends ConsumerWidget {
  static const routPath = '/favourite_movies';
  const FavouriteMovies({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
      ),
      body: StreamBuilder(
        stream: ref.read(movieProvider.notifier).getAllMovies(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridViewWidget(
              
                itemCount: snapshot.data!.length, list: snapshot.data!);
          } else if (snapshot.hasError) {
            return TextButton(onPressed: () {

            }, child: const Text('retry'));
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
