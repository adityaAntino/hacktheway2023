import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hacktheway2023/constant/app_text_style.dart';
import 'package:hacktheway2023/constant/image_path.dart';
import 'package:lottie/lottie.dart';

class CustomEmptyScreen extends StatelessWidget {
  String message;
  CustomEmptyScreen({required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              width: 200.w, child: Lottie.asset(ImagePath.emptyStringLottie)),
          SizedBox(
            height: 30.h,
          ),
          Text(
            message,
            style: AppTextStyle.f12W400grey80,
          ),
          SizedBox(
            height: 30.h,
          ),
        ],
      ),
    );
  }
}
