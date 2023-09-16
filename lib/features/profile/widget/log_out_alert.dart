import 'package:flutter/material.dart';
import 'package:hacktheway2023/config/get_it.dart';
import 'package:hacktheway2023/config/size_config.dart';
import 'package:hacktheway2023/constant/app_colors.dart';
import 'package:hacktheway2023/constant/app_text_style.dart';
import 'package:hacktheway2023/constant/string_constant.dart';
import 'package:hacktheway2023/router/named_route.dart';
import 'package:hacktheway2023/router/navigation_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogoutAlert extends StatelessWidget {
  const LogoutAlert({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: IntrinsicHeight(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Are you sure you want to Logout?',
              style: AppTextStyle.f20W700Grey500,
            ),
          ],
        ),
      ),
      actionsPadding: EdgeInsets.symmetric(
        vertical: 20 * SizeConfig.heightMultiplier!,
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 100 * SizeConfig.widthMultiplier!,
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all(AppColors.kPureWhite),
                    padding:
                    MaterialStateProperty.all(const EdgeInsets.all(13)),
                    textStyle: MaterialStateProperty.all(const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold))),
                child: Text(
                  'No',
                  style: AppTextStyle.f16W500Grey500.copyWith(
                    color: AppColors.baseRed
                  ),
                ),
                onPressed: () {
                  BulandDarwaza.pop(context);
                },
              ),
            ),
            SizedBox(
              width: 100 * SizeConfig.widthMultiplier!,
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all(AppColors.baseRed),
                    padding:
                    MaterialStateProperty.all(const EdgeInsets.all(13)),
                    textStyle: MaterialStateProperty.all(const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold))),
                child: Text('Yes', style: AppTextStyle.f16W500Grey500.copyWith(color: AppColors.kPureWhite)),
                onPressed: () {
                  final SharedPreferences prefs = getIt<SharedPreferences>();
                  prefs.remove(StringConstant.accessToken);
                  BulandDarwaza.pushNamedAndRemoveUntil(context,
                      routeName: RouteName.sendOtpScreen,
                      predicate: (route) => false);
                },
              ),
            ),
          ],
        )
      ],
    );
  }
}
