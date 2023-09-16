import 'package:flutter/material.dart';
import 'package:hacktheway2023/common/commo_appbar.dart';
import 'package:hacktheway2023/config/size_config.dart';
import 'package:hacktheway2023/constant/app_colors.dart';
import 'package:hacktheway2023/constant/image_path.dart';
import 'package:hacktheway2023/features/home_screen/widgets/category_widget.dart';
import 'package:hacktheway2023/router/named_route.dart';
import 'package:hacktheway2023/router/navigation_handler.dart';

// ignore: must_be_immutable
class BuyScreen extends StatefulWidget {
  PageController? pageController = PageController();
  BuyScreen({
    super.key,
    this.pageController,
  });

  @override
  State<BuyScreen> createState() => _BuyScreenState();
}

class _BuyScreenState extends State<BuyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        appBarBgColor: AppColors.kPureBlack,
        parentContext: context,
        title: 'Auction Buddy',
        actions: [
          IconButton(
            onPressed: () {
              //TODO: navigate to notification screen
            },
            icon: const Icon(
              Icons.notifications_outlined,
              color: AppColors.kPureWhite,
              size: 28,
            ),
          ),
        ],
        //TODO: change this profile icon with actual profile photo
        leadingIcon: ImagePath.icProfile,
        isLead: false,
        isCustomLead: true,
        onLeadingTap: () {
          BulandDarwaza.pushNamed(
            context,
            routeName: RouteName.myProfileScreen,
          );
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16 * SizeConfig.widthMultiplier!,
          ),
          child: Column(
            children: [
              SizedBox(height: 8 * SizeConfig.heightMultiplier!),

              // Categories
              // buildCategories(),
            ],
          ),
        ),
      ),
    );
  }

  // Widget buildCategories(List<Map<String, String>> categories) {
  //   return ListView.builder(
  //     itemCount: categories.length,
  //     itemBuilder: (context, index) {
  //       return CategoryWidget(
  //         title: categories[index]['title'],
  //         image: categories['image'],
  //       );
  //     },
  //   );
  // }
}
