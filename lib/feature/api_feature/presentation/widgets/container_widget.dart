import 'package:flutter/material.dart';
import 'package:movie_app_clean_architecture/core/theme/app_theme.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/domain/entity/api_movie_entity.dart';

class ContainerWidget extends StatelessWidget {
  final ApiEntity entity;

  const ContainerWidget({super.key, required this.entity});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          height: AppTheme.of(context).spaces.space_700 * 1.3,
          width: AppTheme.of(context).spaces.space_700 * 1.3,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(1),
              border: Border.all(
                  color: AppTheme.of(context).colors.whtClr,
                  width: AppTheme.of(context).spaces.space_25)),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Rating',
                  style: TextStyle(color: AppTheme.of(context).colors.whtClr),
                ),
                Text(
                  entity.voteAverage.toString(),
                  style: AppTheme.of(context)
                      .typography
                      .h700
                      .copyWith(color: AppTheme.of(context).colors.whtClr),
                )
              ]),
        ),

        Container(
          height: AppTheme.of(context).spaces.space_700 * 1.3,
          width: AppTheme.of(context).spaces.space_700 * 1.3,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(1),
              border: Border.all(
                  color: AppTheme.of(context).colors.whtClr,
                  width: AppTheme.of(context).spaces.space_25)),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'vote',
                  style: TextStyle(color: AppTheme.of(context).colors.whtClr),
                ),
                Text(
                  entity.voteCount.toString(),
                  style: AppTheme.of(context)
                      .typography
                      .h700
                      .copyWith(color: AppTheme.of(context).colors.whtClr),
                )
              ]),
        ),

        //  Container(
        //   height: AppTheme.of(context).spaces.space_700 * 1.3,
        //   width: AppTheme.of(context).spaces.space_700 * 1.3,
        //   decoration: BoxDecoration(
        //       borderRadius: BorderRadius.circular(1),
        //       border: Border.all(
        //           color: AppTheme.of(context).colors.whtClr,
        //           width: AppTheme.of(context).spaces.space_25)),
        //   child: Column(
        //     children: [
        //       Text('Reviews'),
        //       Text(entity.voteAverage.toString())
        //     ]
        //   ),
        // ),
      ],
    );
  }
}
