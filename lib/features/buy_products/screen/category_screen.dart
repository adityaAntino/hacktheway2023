import 'package:flutter/material.dart';
import 'package:hacktheway2023/common/common_appbar.dart';
import 'package:hacktheway2023/common/product_overview_card.dart';
import 'package:hacktheway2023/config/size_config.dart';
import 'package:hacktheway2023/constant/app_colors.dart';
import 'package:hacktheway2023/constant/image_path.dart';
import 'package:hacktheway2023/router/named_route.dart';
import 'package:hacktheway2023/router/navigation_handler.dart';

class CategoryScreen extends StatefulWidget {
  final String title;
  const CategoryScreen({required this.title, super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        parentContext: context,
        appBarBgColor: AppColors.kPureBlack,
        title: widget.title,
      ),
      body: ScrollConfiguration(
        behavior: const ScrollBehavior().copyWith(overscroll: false),
        child: RefreshIndicator(
          onRefresh: () async {
            //TODO: make api call for pull down to refresh
          },
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16 * SizeConfig.widthMultiplier!,
              vertical: 8 * SizeConfig.heightMultiplier!,
            ),
            child: ListView.builder(
                shrinkWrap: true,
                // TODO: change the length of list
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 10 * SizeConfig.heightMultiplier!,
                    ),
                    child: ProductOverviewCard(
                      imageUrl: ImagePath.placeHolderDisplayImage,
                      productName: 'OnePlus Nord CE 2 Lite 5G',
                      isBasePrice: true,
                      biddingPrice: '₹15,000',
                      bidEndTime: '11h: 35m: 47s',
                      onTap: () {
                        BulandDarwaza.pushNamed(
                          context,
                          routeName: RouteName.auctionDetailsScreen,
                          arguments: {'isMyBid': false},
                        );
                      },
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }
}
