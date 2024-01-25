import 'package:flutter/material.dart';
import 'package:movie_app_clean_architecture/core/constants/home_page_constants/api_constants.dart';
import 'package:movie_app_clean_architecture/core/theme/app_theme.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/domain/entity/api_movie_entity.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/presentation/widgets/container_widget.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/presentation/widgets/tr_button_widget.dart';

class OverViewPage extends StatelessWidget {
  static const routPath = '/overview';
  final ApiEntity entity;
  const OverViewPage({super.key, required this.entity});

  @override
  Widget build(BuildContext context) {
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
                '${entity.title} (${entity.releaseDate.year}/${entity.releaseDate.month}/${entity.releaseDate.day})',
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
            const TrailerButton(),
            SizedBox(
              height: AppTheme.of(context).spaces.space_100,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                entity.overview,
                style: AppTheme.of(context)
                    .typography
                    .h400
                    .copyWith(color: AppTheme.of(context).colors.whtClr),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
