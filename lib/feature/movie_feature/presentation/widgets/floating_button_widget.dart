import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app_clean_architecture/core/theme/app_theme.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/presentation/pages/favourite_movies_page.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0,
      backgroundColor: Colors.black.withOpacity(.80),
      selectedItemColor: Colors.white,
      unselectedItemColor: AppTheme.of(context).colors.textSubtlest,
      iconSize: AppTheme.of(context).spaces.space_400,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
            icon: IconButton(
                onPressed: () {}, icon: const Icon(Icons.home_filled)),
            label: ''),
        BottomNavigationBarItem(
            icon: IconButton(
                onPressed: () {
                  context.push(FavouriteMovies.routPath);
                },
                icon: const Icon(Icons.favorite)),
            label: ''),
        BottomNavigationBarItem(
            icon: IconButton(
                onPressed: () {}, icon: const Icon(Icons.person_2_outlined)),
            label: ''),
      ],
    );
  }
}