import 'package:flutter/material.dart';
import 'package:hacktheway2023/common/commo_appbar.dart';
import 'package:hacktheway2023/config/size_config.dart';
import 'package:hacktheway2023/constant/app_colors.dart';
import 'package:hacktheway2023/constant/app_text_style.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String mobileNumber = "";
  final GlobalKey<FormFieldState> mobileNoFormFieldKey =
  GlobalKey<FormFieldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        isLead: false,
        title: '',
        appBarBgColor: AppColors.kPureWhite,
        parentContext: context,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Enter mobile number to get an OTP'),
          SizedBox(height: 10 * SizeConfig.heightMultiplier!),
          Container(
            height: 45 * SizeConfig.heightMultiplier!,
            decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.grey80
                ),
                borderRadius: BorderRadius.circular(
                    8 * SizeConfig.heightMultiplier!)),
            child: Row(
              children: [
                Container(
            color: AppColors.grey80,
                  padding:
                  EdgeInsets.all(12 * SizeConfig.heightMultiplier!),
                  child: const Text(
                    '+91',
                    style: TextStyle(
                        fontFamily: 'Mulish',
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                  ),
                ),
                Container(
                    color: AppColors.grey80),
                Expanded(
                  child: TextFormField(
                    maxLength: 10,
                    key: mobileNoFormFieldKey,
                    onChanged: (String? newValue) {
                      setState(() {
                        mobileNumber = newValue ?? '';
                      });
                    },
                    validator: (String? value) {
                      return (value ?? '').isNotEmpty
                          ? null
                          : 'Enter Valid Phone Number';
                    },
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                        errorStyle: const TextStyle(
                            color: AppColors.kPureWhite),
                        counterText: '',
                        border: InputBorder.none,
                        hintStyle: AppTextStyle.f14W400Grey80,
                        hintText: 'Enter 10 digit mobile number',
                        contentPadding: EdgeInsets.symmetric(
                            horizontal:
                            12 * SizeConfig.widthMultiplier!)),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
