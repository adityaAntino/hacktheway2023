import 'package:flutter/material.dart';
import 'package:hacktheway2023/common/common_appbar.dart';
import 'package:hacktheway2023/common/common_text_field.dart';
import 'package:hacktheway2023/config/size_config.dart';
import 'package:hacktheway2023/constant/app_colors.dart';
import 'package:hacktheway2023/constant/app_text_style.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final TextEditingController _nameCtrl = TextEditingController();
  final TextEditingController _emailCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ///To unFocus Keyboard when tapped inside the scaffold
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: CommonAppBar(
          isLead: false,
          title: 'Profile Details',
          appBarBgColor: AppColors.kPureBlack,
          parentContext: context,
        ),
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                ///NAME
                Text('Name', style: AppTextStyle.f16W600Black0E),
                SizedBox(height: 8 * SizeConfig.heightMultiplier!),
                CommonTextField(
                    textEditingController: _nameCtrl,
                    hintText: 'e.g Kshitij Bajpai'),
                SizedBox(height: 16 * SizeConfig.heightMultiplier!),


                ///EMAIL
                Text('Email', style: AppTextStyle.f16W600Black0E),
                SizedBox(height: 8 * SizeConfig.heightMultiplier!),
                CommonTextField(
                    textEditingController: _emailCtrl,
                    hintText: 'e.g something@gmail.com'),
                SizedBox(height: 16 * SizeConfig.heightMultiplier!),


                ///GENDER
                Text('Email', style: AppTextStyle.f16W600Black0E),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
