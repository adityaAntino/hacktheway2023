import 'package:flutter/material.dart';
import 'package:hacktheway2023/common/common_appbar.dart';
import 'package:hacktheway2023/common/product_overview_card.dart';
import 'package:hacktheway2023/config/size_config.dart';
import 'package:hacktheway2023/constant/app_colors.dart';
import 'package:hacktheway2023/constant/app_text_style.dart';
import 'package:hacktheway2023/constant/image_path.dart';
import 'package:hacktheway2023/router/named_route.dart';
import 'package:hacktheway2023/router/navigation_handler.dart';

class MyBidsScreen extends StatefulWidget {
  final bool isBack;
  const MyBidsScreen({
    Key? key,
    this.isBack = true,
  }) : super(key: key);

  @override
  State<MyBidsScreen> createState() => _MyBidsScreenState();
}

class _MyBidsScreenState extends State<MyBidsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        parentContext: context,
        isLead: false,
        title: 'My Bids',
        appBarBgColor: AppColors.kPureBlack,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: 16.0 * SizeConfig.heightMultiplier!,
            horizontal: 24.0 * SizeConfig.widthMultiplier!),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ///Product Overview Card
              ProductOverviewCard(
                onTap: () {
                  BulandDarwaza.pushNamed(
                    context,
                    routeName: RouteName.auctionDetailsScreen,
                    arguments: {
                      'isMyBid': true,
                    },
                  );
                },
                imageUrl: ImagePath.productImagePng,
                productName: 'OnePlus Nord CE 2 Lite 5G',
                biddingPrice: '₹15,000',
                bidEndTime: '11h : 35m : 47s ',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
