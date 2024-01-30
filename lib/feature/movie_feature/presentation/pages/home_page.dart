import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_app_clean_architecture/core/constants/home_page_constants/api_constants.dart';
import 'package:movie_app_clean_architecture/core/theme/app_theme.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/presentation/pages/overview_pages.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/presentation/provider/api_movie_provider.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/presentation/widgets/carousel_widget.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/presentation/widgets/gridview_widget.dart';
import 'package:movie_app_clean_architecture/feature/movie_feature/presentation/providers/auth_provider.dart';
import 'package:movie_app_clean_architecture/feature/movie_feature/presentation/widgets/floating_button_widget.dart';

class HomePage extends ConsumerWidget {
  static const routePath = '/';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.of(context).colors.textSubtle,
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        title: Text(
          ApiConstants.appbarTitle,
          style: TextStyle(color: AppTheme.of(context).colors.appbarTxtClr),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
            color: AppTheme.of(context).colors.appbarTxtClr,
          ),
          IconButton(
            onPressed: () async {
              await ref.read(authenticationProvider.notifier).logOut(context);
            },
            icon: const Icon(Icons.person_pin),
            color: AppTheme.of(context).colors.appbarTxtClr,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: ref.watch(movieProvider).isRefreshing
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : switch (ref.watch(movieProvider)) {
                AsyncData(:final value) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              ApiConstants.popMovTxt,
                              style: AppTheme.of(context).typography.h600,
                            )),
                        SizedBox(
                          height: AppTheme.of(context).spaces.space_100,
                        ),
                        SizedBox(
                          height: 200,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: value.movies.length,
                            itemBuilder: (context, index) => ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: InkWell(
                                onTap: () => context.push(OverViewPage.routPath,
                                    extra: value.movies[index]),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  color: AppTheme.of(context).colors.primary,
                                  child: Image.network(
                                    ApiConstants.imagePath +
                                        value.popular[index].backdropPath,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            separatorBuilder: (context, index) => SizedBox(
                              width: AppTheme.of(context).spaces.space_100,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: AppTheme.of(context).spaces.space_125,
                        ),
                        CarouselWidget(
                            itemCount: value.movies.length, list: value.movies),
                        SizedBox(
                          height: AppTheme.of(context).spaces.space_125,
                        ),
                        Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              ApiConstants.disMovTxt,
                              style: AppTheme.of(context).typography.h600,
                            )),
                        SizedBox(
                          height: 350,
                          child: GridViewWidget(
                              itemCount: value.movies.length,
                              list: value.movies),
                        )
                      ],
                    ),
                  ),
                AsyncError(:final error) => Center(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(error.toString()),
                          TextButton(
                              onPressed: () {
                                ref.invalidate(movieProvider);
                              },
                              child: const Text('try')),
                        ],
                      ),
                    ),
                  ),
                _ => const Center(
                    child: CircularProgressIndicator(),
                  )
              },
      ),
      // body: Center(
      //   child: ElevatedButton(
      //       onPressed: () async {
      //         await ref.read(authenticationProvider.notifier).logOut(context);
      //       },
      //       child: const Text('logout')),
      // ),
      bottomNavigationBar: const BottomNavigationBarWidget(),
    );
  }
}
