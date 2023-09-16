import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hacktheway2023/config/size_config.dart';
import 'package:hacktheway2023/constant/app_colors.dart';
import 'package:hacktheway2023/constant/app_text_style.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.onTap,
    required this.buttonColor,
    required this.buttonText,
    this.borderColor = AppColors.transparent,
    this.textColor = AppColors.kPureWhite,
    this.outerHorizontalPadding = 16,
    this.innerHorizontalPadding = 0,
    this.innerVerticalPadding = 0,
    this.outerVerticalPadding = 16,
    this.borderRadius = 24,
    this.fontSize,
    this.prefixSvgIcon,
  });

  final Color buttonColor;
  final String buttonText;
  final Function()? onTap;
  final Color borderColor;
  final Color? textColor;
  final double outerHorizontalPadding;
  final double innerHorizontalPadding;
  final double outerVerticalPadding;
  final double innerVerticalPadding;
  final double borderRadius;
  final double? fontSize;
  final String? prefixSvgIcon;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: buttonColor,
            border: Border.all(color: borderColor),
            borderRadius: BorderRadius.all(
              Radius.circular(borderRadius),
            ),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: outerHorizontalPadding * SizeConfig.widthMultiplier!,
            vertical: outerVerticalPadding * SizeConfig.heightMultiplier!,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: innerHorizontalPadding * SizeConfig.widthMultiplier!,
              vertical: innerVerticalPadding * SizeConfig.heightMultiplier!,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Visibility(
                    visible: (prefixSvgIcon != null && prefixSvgIcon != ""),
                    child: SvgPicture.asset(prefixSvgIcon ?? "")),
                Visibility(
                    visible: (prefixSvgIcon != null && prefixSvgIcon != ""),
                    child: SizedBox(width: 8 * SizeConfig.widthMultiplier!)),
                Text(
                  buttonText,
                  style: AppTextStyle.f16W500Grey500.copyWith(
                    color: textColor,
                    fontSize: fontSize ?? 14 * SizeConfig.textMultiplier!,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
