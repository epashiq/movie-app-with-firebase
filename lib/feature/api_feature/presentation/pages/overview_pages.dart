import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_clean_architecture/core/constants/home_page_constants/api_constants.dart';
import 'package:movie_app_clean_architecture/core/theme/app_theme.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/domain/entity/api_movie_entity.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/presentation/widgets/container_widget.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/presentation/widgets/tr_button_widget.dart';

class OverViewPage extends StatefulWidget {
  static const routPath = '/overview';
  final ApiEntity entity;
  const OverViewPage({super.key, required this.entity});

  @override
  State<OverViewPage> createState() => _OverViewPageState();
}

class _OverViewPageState extends State<OverViewPage> {
  bool isExpanded = false;
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
                ApiConstants.imagePath + widget.entity.posterPath,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '${widget.entity.title} (${widget.entity.releaseDate.year})',
                style: AppTheme.of(context).typography.h600.copyWith(
                    color: AppTheme.of(context).colors.backgroundDanger),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: AppTheme.of(context).spaces.space_150,
            ),
            ContainerWidget(entity: widget.entity),
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
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.bookmark_border_rounded,
                      size: AppTheme.of(context).spaces.space_500,
                      color: AppTheme.of(context).colors.whtClr,
                    ))
              ],
            ),
            SizedBox(
              height: AppTheme.of(context).spaces.space_100,
            ),
            RichText(
                text: TextSpan(
              text: widget.entity.overview.isEmpty
                  ? null
                  : isExpanded
                      ? widget.entity.overview
                      : widget.entity.overview
                          .substring(0, widget.entity.overview.length ~/ 2),
              style: const TextStyle(color: Colors.white54),
              children: [
                TextSpan(
                    text: widget.entity.overview.isEmpty
                        ? 'Read less...'
                        : 'Read more...',
                    style: const TextStyle(color: Colors.white),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        setState(() {
                          isExpanded = !isExpanded;
                        });
                      })
              ],
            ))
          ],
        ),
      ),
    );
  }
}
