import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_app_clean_architecture/core/theme/app_theme.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/domain/entity/api_movie_entity.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/domain/entity/firebase_comment_entity.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/presentation/provider/api_movie_provider.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/presentation/widgets/search_textfield_widget.dart';

class BottomSheetWidget extends HookConsumerWidget {
  final ApiEntity entity;
  const BottomSheetWidget({super.key, required this.entity});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final commentController = useTextEditingController();
    return InkWell(
        onTap: () => showModalBottomSheet(
              backgroundColor: Colors.grey,
              context: context,
              builder: (context) => Container(
                padding: EdgeInsets.all(AppTheme.of(context).spaces.space_100),
                height: AppTheme.of(context).spaces.space_800 * 10,
                decoration: BoxDecoration(
                    color: AppTheme.of(context).colors.whtClr,
                    borderRadius: BorderRadius.vertical(
                        top: Radius.circular(
                            AppTheme.of(context).spaces.space_300))),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: MediaQuery.sizeOf(context).width / 1.2,
                            child: SearchFieldWidget(
                              controller: commentController,
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                ref
                                    .read(movieProvider.notifier)
                                    .addComment(CommentEntity(
                                        // userName: 'ashiq',
                                        text: commentController.text,
                                        // time: DateTime.now(),
                                        id: '',
                                        movieId: entity.id.toString()));
                              },
                              icon: const Icon(Icons.send_outlined))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
              margin:
                  EdgeInsets.only(top: AppTheme.of(context).spaces.space_200),
              padding: EdgeInsets.all(AppTheme.of(context).spaces.space_150),
              width: MediaQuery.sizeOf(context).width,
              height: AppTheme.of(context).spaces.space_600 * 2,
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(
                      AppTheme.of(context).spaces.space_200)),
              child: const Text(
                'riview...',
                style: TextStyle(color: Colors.white),
              )),
        ));
  }
}
