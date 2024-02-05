import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app_clean_architecture/core/constants/home_page_constants/api_constants.dart';
import 'package:movie_app_clean_architecture/core/theme/app_theme.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/domain/entity/api_movie_entity.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/presentation/pages/overview_pages.dart';

class CarouselWidget extends StatelessWidget {
  final int itemCount;
  final List<ApiEntity> list;
  const CarouselWidget(
      {super.key, required this.itemCount, required this.list});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: CarouselSlider.builder(
          itemCount: itemCount,
          itemBuilder: (context, index, realIndex) {
            final posterPathFile = File(list[index].posterPath);
            late final ImageProvider image;
            if(posterPathFile.existsSync()){
              image = FileImage(posterPathFile);
            }else{
              image =NetworkImage(ApiConstants.imagePath + list[index].posterPath);
            }
          return InkWell(
                onTap: () =>
                    context.push(OverViewPage.routPath, extra: list[index]),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    height: 350,
                    width: 250,
                    color: AppTheme.of(context).colors.textSubtle,
                    child: Image.network(
                      ApiConstants.imagePath + list[index].posterPath,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );},
          options: CarouselOptions(
            height: 350,
            aspectRatio: 16 / 9,
            viewportFraction: 0.60,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.easeInOutCubicEmphasized,
            enlargeCenterPage: true,
            enlargeFactor: 0.3,
            scrollDirection: Axis.horizontal,
          )),
    );
  }
}
