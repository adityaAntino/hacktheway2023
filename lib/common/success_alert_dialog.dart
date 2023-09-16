import 'package:flutter/material.dart';
import 'package:hacktheway2023/config/size_config.dart';
import 'package:hacktheway2023/constant/app_colors.dart';
import 'package:hacktheway2023/constant/app_text_style.dart';
import 'package:hacktheway2023/constant/image_path.dart';
import 'package:lottie/lottie.dart';

class SuccessAlertDialog extends StatefulWidget {
  String title;
  String description;
  final Function() onTap;
  bool? isPending;

  SuccessAlertDialog(
      {super.key,
      required this.description,
      required this.title,
      required this.onTap,
      this.isPending});

  @override
  State<SuccessAlertDialog> createState() => _SuccessAlertDialogState();
}

class _SuccessAlertDialogState extends State<SuccessAlertDialog> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: AlertDialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12))),
        title: SizedBox(
            height: 180 * SizeConfig.heightMultiplier!,
            width: 200 * SizeConfig.widthMultiplier!,
            child: LottieBuilder.asset(ImagePath.successLottie)),
        // title: SvgPicture.asset(ImagePath.icRegisterLawyerSuccess),
        content: IntrinsicHeight(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: AppColors.kPureBlack,
                  ),
                ),
              ),
              SizedBox(height: 10 * SizeConfig.heightMultiplier!),
              Text(
                widget.description,
                style: AppTextStyle.f14W400Black,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        actionsPadding: EdgeInsets.only(
          bottom: 16 * SizeConfig.heightMultiplier!,
        ),
        actions: [
          Center(
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  AppColors.kPureBlack,
                ),
                padding: MaterialStateProperty.all(const EdgeInsets.all(13)),
                textStyle: MaterialStateProperty.all(
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),
              onPressed: widget.onTap,
              child: Text(
                'Continue',
                style: AppTextStyle.f14W400Black.copyWith(
                  color: AppColors.kPureWhite,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
