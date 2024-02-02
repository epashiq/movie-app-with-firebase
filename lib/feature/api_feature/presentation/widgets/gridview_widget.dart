import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app_clean_architecture/core/constants/home_page_constants/api_constants.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/domain/entity/api_movie_entity.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/presentation/pages/overview_pages.dart';

class GridViewWidget extends StatelessWidget {
  final int itemCount;
  final List<ApiEntity> list;
  const GridViewWidget(
      {super.key, required this.itemCount, required this.list});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        itemCount: itemCount,
        itemBuilder: (context, index) => InkWell(
          onTap: () => context.push(OverViewPage.routPath, extra: list[index]),
          child: Image.network(
            ApiConstants.imagePath + list[index].posterPath,
            fit: BoxFit.cover,
          ),
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
          mainAxisExtent: 240,
        ),
      ),
    );
  }
}
