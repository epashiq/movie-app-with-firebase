import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_app_clean_architecture/core/constants/home_page_constants/api_constants.dart';
import 'package:movie_app_clean_architecture/core/theme/app_theme.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/presentation/provider/api_movie_provider.dart';

class SearchFieldWidget extends HookConsumerWidget {
  final TextEditingController controller;
  const SearchFieldWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: AppTheme.of(context).spaces.space_800,
        width: MediaQuery.of(context).size.width,
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: Colors.black),
              ),
              hintText: ApiConstants.searchHintTxt,
              suffixIcon: IconButton(
                  onPressed: () {
                    ref
                        .read(movieProvider.notifier)
                        .searchMovies(controller.text);
                  },
                  icon: const Icon(Icons.search))),
        ),
      ),
    );
  }
}
