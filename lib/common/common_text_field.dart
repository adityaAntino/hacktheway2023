import 'package:flutter/material.dart';
import 'package:hacktheway2023/constant/app_colors.dart';

class CommonTextField extends StatelessWidget {
  final TextEditingController? textEditingController;
  final String hintText;
  int? maxLines;
  final TextInputType? textInputType;

  CommonTextField(
      {super.key,
      required this.textEditingController,
      required this.hintText,
      this.maxLines = 1,
      this.textInputType
      });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      controller: textEditingController,
      keyboardType: textInputType ?? TextInputType.text,
      decoration: InputDecoration(
        hintText: hintText,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(2),
          borderSide: const BorderSide(width: 1, color: AppColors.grey3),
        ),
        disabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 3),
            borderRadius: BorderRadius.circular(2)),
        border: OutlineInputBorder(
            borderSide: const BorderSide(width: 3, color: AppColors.grey3),
            borderRadius: BorderRadius.circular(2)),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: AppColors.grey3),
            borderRadius: BorderRadius.circular(2)),
        errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: AppColors.baseRed),
            borderRadius: BorderRadius.circular(2)),
      ),
    );
  }
}
