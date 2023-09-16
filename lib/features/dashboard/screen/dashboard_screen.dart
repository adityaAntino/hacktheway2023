import 'package:flutter/material.dart';
import 'package:hacktheway2023/common/custom_bottom_navbar_item.dart';
import 'package:hacktheway2023/constant/app_colors.dart';
import 'package:hacktheway2023/constant/image_path.dart';
import 'package:hacktheway2023/features/buy_products/screen/buy_screen.dart';
import 'package:hacktheway2023/features/my_bids/screen/my_bids.dart';
import 'package:hacktheway2023/features/profile/screen/my_profile.dart';
import 'package:hacktheway2023/features/sell_products/screen/start_selling_screen.dart';

class DashboardScreeen extends StatefulWidget {
  const DashboardScreeen({super.key});

  @override
  State<DashboardScreeen> createState() => _DashboardScreeenState();
}

class _DashboardScreeenState extends State<DashboardScreeen> {
  int currentScreen = 0;
  PageController controller = PageController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  Map<String, String> bottomAppBarItems = {
    'Buy': ImagePath.icBuy,
    'Sell': ImagePath.icSell,
    'My Bids': ImagePath.icBids,
    'Profile': ImagePath.icProfile,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kPureWhite,
      key: _scaffoldKey,
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: controller,
              children: [
                BuyScreen(
                  pageController: controller,
                ),
                const StartSelling(
                  isBack: false,
                ),
                const MyBidsScreen(
                  isBack: false,
                ),
                const MyProfileScreen(isBack: false),
              ],
              onPageChanged: (value) {
                setState(() {
                  currentScreen = value;
                });
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              4,
              (index) => Localizations.override(
                context: context,
                // locale: context.locale,
                child: CustomBottomNavbarItem(
                  onTap: () {
                    setState(() {
                      currentScreen = index;
                      controller.jumpToPage(index);
                    });
                  },
                  itemColor: currentScreen == index
                      ? AppColors.baseRed
                      : AppColors.kPureBlack,
                  barColor: currentScreen == index
                      ? AppColors.baseRed
                      : AppColors.kPureWhite,
                  icon: bottomAppBarItems.values.elementAt(index),
                  title: bottomAppBarItems.keys.elementAt(index),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
