import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hacktheway2023/config/get_it.dart';
import 'package:hacktheway2023/config/size_config.dart';
import 'package:hacktheway2023/constant/app_colors.dart';
import 'package:hacktheway2023/constant/app_text_style.dart';
import 'package:hacktheway2023/constant/image_path.dart';
import 'package:hacktheway2023/constant/string_constant.dart';
import 'package:hacktheway2023/router/named_route.dart';
import 'package:hacktheway2023/router/navigation_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SharedPreferences prefs = getIt<SharedPreferences>();

  @override
  void initState() {
    if ((prefs.getString(StringConstant.accessToken) == null) ||
        (prefs.getString(StringConstant.accessToken) == "")) {
      Timer(
          const Duration(seconds: 3),
          () => BulandDarwaza.pushReplacementNamed(context,
              routeName: RouteName.sendOtpScreen));
    } else {
      Timer(
          const Duration(seconds: 3),
          () => BulandDarwaza.pushReplacementNamed(context,
              routeName: RouteName.dashboardScreen));
    }
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.kPureBlack,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(ImagePath.appLogoSvg),
            SizedBox(height: 8 * SizeConfig.heightMultiplier!),
            const Text(
              'Auction Buddy',
              style: TextStyle(
                  color: AppColors.kPureWhite,
                  fontSize: 30,
                  fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}
