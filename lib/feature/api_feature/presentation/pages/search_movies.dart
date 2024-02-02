import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_app_clean_architecture/core/constants/home_page_constants/api_constants.dart';
import 'package:movie_app_clean_architecture/core/theme/app_theme.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/presentation/provider/api_movie_provider.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/presentation/widgets/gridview_widget.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/presentation/widgets/search_textfield_widget.dart';

class SearchPage extends HookConsumerWidget {
  static const routPath = '/search';
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchController = useTextEditingController();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppTheme.of(context).colors.textSubtle,
        title: Text(
          ApiConstants.searchAppBarTxt,
          style: TextStyle(color: AppTheme.of(context).colors.appbarTxtClr),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: AppTheme.of(context).spaces.space_150,
            ),
            SearchFieldWidget(controller: searchController),
            Builder(
              builder: (context) {
                return ref.watch(movieProvider).when(
                      data: (data) {
                        if (data.searchMovies == null) {
                          return Center(
                            child: TextButton(
                                onPressed: () {
                                  ref
                                      .read(movieProvider.notifier)
                                      .searchMovies(searchController.text);
                                },
                                child: const Text('no data available')),
                          );
                        } else {
                          return SizedBox(
                            height: MediaQuery.of(context).size.height,
                            child: GridViewWidget(
                                itemCount: data.searchMovies!.length,
                                list: data.searchMovies!),
                          );
                        }
                      },
                      error: (error, stackTrace) => Center(
                        child: Text(error.toString()),
                      ),
                      loading: () => Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
              },
            )
          ],
        ),
      ),
    );
  }
}
