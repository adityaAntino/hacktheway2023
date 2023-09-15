import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hacktheway2023/config/size_config.dart';
import 'package:hacktheway2023/constant/app_colors.dart';
import 'package:hacktheway2023/constant/app_text_style.dart';
import 'package:hacktheway2023/constant/image_path.dart';
import 'package:lottie/lottie.dart';


class MaintenanceScreen extends StatelessWidget {
  const MaintenanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 20 * SizeConfig.widthMultiplier!,
        ),
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 340 * SizeConfig.heightMultiplier!,
                child: Lottie.asset(ImagePath.maintenanceLottie),
              ),
              SizedBox(
                height: 36 * SizeConfig.heightMultiplier!,
              ),
              Text(
                'Work in Progress',
                style: AppTextStyle.f24W700Grey500.copyWith(
                  color: AppColors.grey300,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 14 * SizeConfig.heightMultiplier!,
              ),
              Text(
                'Apologies for the inconvenience. We are currently performing maintenance to enhance your app experience. ',
                textAlign: TextAlign.center,
                style: AppTextStyle.f16W500Grey500.copyWith(
                  color: AppColors.grey300,
                ),
              ),
              SizedBox(
                height: 18 * SizeConfig.heightMultiplier!,
              ),
              Text(
                'Thank you for your patience!',
                style: AppTextStyle.f16W500Grey500.copyWith(
                  color: AppColors.grey300,
                ),
              ),
              SizedBox(height: 48 * SizeConfig.heightMultiplier!),
            ],
          ),
        ),
      ),
    );
  }
}
