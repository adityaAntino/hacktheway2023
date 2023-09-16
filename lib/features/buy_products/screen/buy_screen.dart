import 'package:flutter/material.dart';
import 'package:hacktheway2023/common/commo_appbar.dart';
import 'package:hacktheway2023/config/size_config.dart';
import 'package:hacktheway2023/constant/app_colors.dart';
import 'package:hacktheway2023/constant/app_text_style.dart';
import 'package:hacktheway2023/constant/image_path.dart';
import 'package:hacktheway2023/features/buy_products/widgets/category_widget.dart';
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16 * SizeConfig.heightMultiplier!),

              // Categories
              Text(
                'Categories',
                style: AppTextStyle.f18W500Black.copyWith(
                  color: AppColors.kPureBlack,
                ),
              ),
              SizedBox(height: 12 * SizeConfig.heightMultiplier!),
              buildCategories(
                [
                  {
                    'title': 'Mobile Phones',
                    'image': ImagePath.placeHolderDisplayImage,
                  },
                  {
                    'title': 'Laptops',
                    'image': ImagePath.placeHolderDisplayImage,
                  },
                  {
                    'title': 'Headphones',
                    'image': ImagePath.placeHolderDisplayImage,
                  },
                  {
                    'title': 'Properties',
                    'image': ImagePath.placeHolderDisplayImage,
                  },
                  {
                    'title': 'Computer Accessories',
                    'image': ImagePath.placeHolderDisplayImage,
                  },
                ],
              ),
              SizedBox(height: 30 * SizeConfig.heightMultiplier!),

              // ENDING SOON
              Text(
                'Ending Soon',
                style: AppTextStyle.f18W500Black.copyWith(
                  color: AppColors.kPureBlack,
                ),
              ),
              SizedBox(height: 12 * SizeConfig.heightMultiplier!),
              buildCategories(
                [
                  {
                    'title': 'Mobile Phones',
                    'image': ImagePath.placeHolderDisplayImage,
                  },
                  {
                    'title': 'Laptops',
                    'image': ImagePath.placeHolderDisplayImage,
                  },
                  {
                    'title': 'Headphones',
                    'image': ImagePath.placeHolderDisplayImage,
                  },
                  {
                    'title': 'Properties',
                    'image': ImagePath.placeHolderDisplayImage,
                  },
                  {
                    'title': 'Computer Accessories',
                    'image': ImagePath.placeHolderDisplayImage,
                  },
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCategories(
    List<Map<String, String>> categories, {
    double? imageHeight,
    double? imageWidth,
  }) {
    return SizedBox(
      height: 136 * SizeConfig.heightMultiplier!,
      child: ListView.separated(
        separatorBuilder: (context, index) {
          return SizedBox(width: 12 * SizeConfig.widthMultiplier!);
        },
        shrinkWrap: true,
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return CategoryWidget(
            title: categories[index]['title'] ?? '',
            image:
                categories[index]['image'] ?? ImagePath.placeHolderDisplayImage,
          );
        },
      ),
    );
  }
}
