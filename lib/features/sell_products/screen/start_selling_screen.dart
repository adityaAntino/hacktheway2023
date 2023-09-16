import 'package:flutter/material.dart';
import 'package:hacktheway2023/common/common_appbar.dart';
import 'package:hacktheway2023/common/primary_button.dart';
import 'package:hacktheway2023/common/product_overview_card.dart';
import 'package:hacktheway2023/config/size_config.dart';
import 'package:hacktheway2023/constant/app_colors.dart';
import 'package:hacktheway2023/constant/image_path.dart';
import 'package:hacktheway2023/router/named_route.dart';
import 'package:hacktheway2023/router/navigation_handler.dart';
import 'package:lottie/lottie.dart';

class StartSelling extends StatefulWidget {
  final bool isBack;
  const StartSelling({
    Key? key,
    this.isBack = true,
  }) : super(key: key);

  @override
  State<StartSelling> createState() => _StartSellingState();
}

class _StartSellingState extends State<StartSelling> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: 'Sell',
        isLead: false,
        parentContext: context,
        appBarBgColor: AppColors.kPureBlack,
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: 16.0 * SizeConfig.heightMultiplier!,
              horizontal: 24.0 * SizeConfig.widthMultiplier!),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ProductOverviewCard(
                onTap: () {
                  BulandDarwaza.pushNamed(context,
                      routeName: RouteName.sellAuctionDetailScreen);
                },
                productName: 'OnePlus Nord CE 2 Lite 5G',
                biddingPrice: ' ₹15,000',
                imageUrl: ImagePath.productImagePng,
                bidEndTime: '09:00 PM ,23 Sep, 2023 ',
              ),

              ///TODO: ADD LOTTIE WHEN API INTEGRATED
              // SizedBox(
              //     height: 300,
              //     child: LottieBuilder.asset(ImagePath.pushUpGuyLottie)),
              SizedBox(height: 16 * SizeConfig.heightMultiplier!),
              SizedBox(
                width: MediaQuery.of(context).size.width * .5,
                child: PrimaryButton(
                  onTap: () {
                    BulandDarwaza.pushNamed(context,
                        routeName: RouteName.sellProductScreen);
                  },
                  buttonColor: AppColors.kPureBlack,
                  buttonText: 'Start Selling +',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
