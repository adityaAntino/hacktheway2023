import 'package:flutter/material.dart';
import 'package:hacktheway2023/config/size_config.dart';
import 'package:hacktheway2023/constant/app_colors.dart';

class AppTextStyle {
  static TextStyle f24W700Grey500 = TextStyle(
    color: AppColors.grey500,
    fontSize: 24 * SizeConfig.textMultiplier!,
    fontWeight: FontWeight.w700,
  );

  static TextStyle f16W500Grey500 = TextStyle(
    fontSize: 16 * SizeConfig.textMultiplier!,
    fontWeight: FontWeight.w500,
    color: AppColors.kPureBlack,
  );

  static TextStyle f14W400Black = TextStyle(
    fontSize: 16 * SizeConfig.textMultiplier!,
    fontWeight: FontWeight.w400,
    color: AppColors.kPureBlack,
  );

  static TextStyle f18W500Black = TextStyle(
    fontSize: 18 * SizeConfig.textMultiplier!,
    fontWeight: FontWeight.w500,
    color: AppColors.kPureBlack,
  );
}
