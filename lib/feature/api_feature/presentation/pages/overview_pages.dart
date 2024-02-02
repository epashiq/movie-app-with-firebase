import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_clean_architecture/core/constants/home_page_constants/api_constants.dart';
import 'package:movie_app_clean_architecture/core/theme/app_theme.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/domain/entity/api_movie_entity.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/presentation/provider/api_movie_provider.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/presentation/widgets/bottom_sheet_widget.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/presentation/widgets/container_widget.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/presentation/widgets/tr_button_widget.dart';

class OverViewPage extends ConsumerWidget {
  static const routPath = '/overview';
  final ApiEntity entity;

  const OverViewPage({super.key, required this.entity});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isExpanded = ref.watch(readmoreProvider);
    return Scaffold(
      backgroundColor: AppTheme.of(context).colors.blackClr,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.all(10)),
            SizedBox(
              height: AppTheme.of(context).spaces.space_250,
            ),
            SizedBox(
              width: AppTheme.of(context).spaces.space_700 * 4,
              height: AppTheme.of(context).spaces.space_700 * 6,
              child: Image.network(
                ApiConstants.imagePath + entity.posterPath,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '${entity.title} (${entity.releaseDate.year})',
                style: AppTheme.of(context).typography.h600.copyWith(
                    color: AppTheme.of(context).colors.backgroundDanger),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: AppTheme.of(context).spaces.space_150,
            ),
            ContainerWidget(entity: entity),
            SizedBox(
              height: AppTheme.of(context).spaces.space_150,
            ),
            SizedBox(
              height: AppTheme.of(context).spaces.space_100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const TrailerButton(),
                StreamBuilder(
                    stream: ref.watch(movieProvider).value!.favMovieStream,
                    builder: (context, snapshot) {
                      final isFavmov = ref
                          .read(movieProvider.notifier)
                          .isFavourite(entity.id);
                      return IconButton(
                          onPressed: () {
                            if (isFavmov) {
                              ref
                                  .read(movieProvider.notifier)
                                  .deleteFromFirestore(entity.id);
                            } else {
                              ref
                                  .read(movieProvider.notifier)
                                  .addToFireStore(entity);
                            }
                          },
                          icon: Icon(
                            isFavmov
                                ? Icons.bookmark
                                : Icons.bookmark_border_rounded,
                            size: AppTheme.of(context).spaces.space_500,
                            color: AppTheme.of(context).colors.whtClr,
                          ));
                    })
              ],
            ),
            SizedBox(
              height: AppTheme.of(context).spaces.space_100,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: RichText(
                  text: TextSpan(
                text: entity.overview.isEmpty
                    ? null
                    : isExpanded
                        ? entity.overview
                        : entity.overview
                            .substring(0, entity.overview.length ~/ 2),
                style: const TextStyle(color: Colors.white54),
                children: [
                  TextSpan(
                      text: entity.overview.isEmpty
                          ? null
                          : isExpanded
                              ? 'Read less...'
                              : 'Read more...',
                      style: const TextStyle(color: Colors.white),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          ref.read(readmoreProvider.notifier).state =
                              !isExpanded;
                        })
                ],
              )),
            ),
            SizedBox(
              height: AppTheme.of(context).spaces.space_150,
            ),
            BottomSheetWidget(
              entity: entity,
            ),
            StreamBuilder(
              stream: ref
                  .watch(movieProvider.notifier)
                  .getComment(entity.id.toString()),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return SizedBox(
                    height: 300,
                    child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) => ListTile(
                        title: Text(
                          snapshot.data![index].text,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  );
                } else if (snapshot.hasError) {
                  return const Text('error');
                } else {
                  return const CircularProgressIndicator();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
