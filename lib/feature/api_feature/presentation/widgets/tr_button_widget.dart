import 'package:flutter/material.dart';
import 'package:movie_app_clean_architecture/core/constants/home_page_constants/api_constants.dart';
import 'package:movie_app_clean_architecture/core/theme/app_theme.dart';

class TrailerButton extends StatelessWidget {
  const TrailerButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        height: AppTheme.of(context).spaces.space_600,
        width: AppTheme.of(context).spaces.space_700 * 2.5,
        child: TextButton(
            style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(
                    AppTheme.of(context).colors.whtClr),
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)))),
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.play_arrow,
                  color: AppTheme.of(context).colors.blackClr,
                  size: AppTheme.of(context).spaces.space_300,
                ),
                Text(
                  ApiConstants.btTrlTxt,
                  style: AppTheme.of(context)
                      .typography
                      .h300
                      .copyWith(color: AppTheme.of(context).colors.blackClr),
                )
              ],
            )),
      ),
    );
  }
}
