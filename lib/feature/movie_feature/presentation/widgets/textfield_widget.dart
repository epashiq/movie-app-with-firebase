import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_app_clean_architecture/core/theme/app_theme.dart';

class TextFieldWidget extends HookConsumerWidget {
  final String? labelText;
  final Icon? textfieldIcon;
  final TextEditingController? controller;

  const TextFieldWidget(
      {super.key,
      required this.labelText,
      required this.textfieldIcon,
      required this.controller});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return SizedBox(
      height: AppTheme.of(context).spaces.space_800,
      width: AppTheme.of(context).spaces.space_900 * 5.2,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide.none),
          labelText: labelText,
          suffixIcon: textfieldIcon,
        ),
      ),
    );
  }
}
