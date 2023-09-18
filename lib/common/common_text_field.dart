import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hacktheway2023/constant/app_colors.dart';
import 'package:hacktheway2023/constant/app_text_style.dart';

class CommonTextField extends StatelessWidget {
  final TextEditingController? textEditingController;
  final String hintText;
  int? maxLines;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? inputFormatters;
  final bool? interactiveSelection;
  final Function(String)? onChanged;

  CommonTextField({
    super.key,
    required this.textEditingController,
    required this.hintText,
    this.maxLines = 1,
    this.inputFormatters,
    this.textInputType,
    this.interactiveSelection,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      controller: textEditingController,
      keyboardType: textInputType ?? TextInputType.text,
      inputFormatters: inputFormatters,
      enableInteractiveSelection: interactiveSelection,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: AppTextStyle.f14W600Black9A,
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
