import 'package:flutter/material.dart';
import 'package:hacktheway2023/common/primary_button.dart';
import 'package:hacktheway2023/config/size_config.dart';
import 'package:hacktheway2023/constant/app_colors.dart';
import 'package:hacktheway2023/constant/app_text_style.dart';
import 'package:hacktheway2023/router/navigation_handler.dart';

class CommonDialog extends StatelessWidget {
  final String title;
  final String content;
  const CommonDialog({required this.title, required this.content, super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Column(
        children: [
          Text(
            title,
            style: AppTextStyle.f20W700Grey500,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 4 * SizeConfig.heightMultiplier!),
          const Divider(
            color: AppColors.greyF5,
            thickness: 2,
          )
        ],
      ),
      content: Text(
        content,
        style: AppTextStyle.f16W500Grey500,
        textAlign: TextAlign.center,
      ),
      actionsPadding: EdgeInsets.only(
        bottom: 16 * SizeConfig.heightMultiplier!,
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Cancel btn
            PrimaryButton(
              onTap: () {
                BulandDarwaza.pop(context);
              },
              buttonColor: AppColors.kPureWhite,
              buttonText: 'Cancel',
              borderColor: AppColors.kPureBlack,
              textColor: AppColors.kPureBlack,
              borderRadius: 19,
              innerHorizontalPadding: 10 * SizeConfig.widthMultiplier!,
            ),
            SizedBox(width: 24 * SizeConfig.widthMultiplier!),
            // Confirm btn
            PrimaryButton(
              onTap: () {
                //TODO: show bid placed dialog dialog
              },
              buttonColor: AppColors.kPureBlack,
              buttonText: 'Confirm',
              borderColor: AppColors.kPureBlack,
              textColor: AppColors.kPureWhite,
              borderRadius: 19,
              innerHorizontalPadding: 10 * SizeConfig.widthMultiplier!,
            ),
          ],
        ),
      ],
    );
  }
}
