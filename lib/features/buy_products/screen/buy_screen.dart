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
      body: ScrollConfiguration(
        behavior: const ScrollBehavior().copyWith(overscroll: false),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              top: 8 * SizeConfig.heightMultiplier!,
              left: 16 * SizeConfig.widthMultiplier!,
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
                  categoryTile: 'Categories',
                  categories: [
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
                  imageHeight: 74 * SizeConfig.heightMultiplier!,
                  imageWidth: 74 * SizeConfig.widthMultiplier!,
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
                  categoryTile: 'Ending Soon',
                  categories: [
                    {
                      'title': 'One Plus Nord CE Lite 5G',
                      'image': ImagePath.placeHolderDisplayImage,
                      'endsIn': '11h: 35m: 47s',
                      'amount': '15,000',
                    },
                    {
                      'title': 'Laptops',
                      'image': ImagePath.placeHolderDisplayImage,
                      'endsIn': '11h: 35m: 47s',
                      'amount': '15,000',
                    },
                    {
                      'title': 'Headphones',
                      'image': ImagePath.placeHolderDisplayImage,
                      'endsIn': '11h: 35m: 47s',
                      'amount': '15,000',
                    },
                    {
                      'title': 'Properties',
                      'image': ImagePath.placeHolderDisplayImage,
                      'endsIn': '11h: 35m: 47s',
                      'amount': '15,000',
                    },
                    {
                      'title': 'Computer Accessories',
                      'image': ImagePath.placeHolderDisplayImage,
                      'endsIn': '11h: 35m: 47s',
                      'amount': '15,000',
                    },
                  ],
                  imageHeight: 128 * SizeConfig.heightMultiplier!,
                  imageWidth: 114 * SizeConfig.widthMultiplier!,
                ),
                SizedBox(height: 30 * SizeConfig.heightMultiplier!),

                // POPULAR
                Text(
                  'Popular',
                  style: AppTextStyle.f18W500Black.copyWith(
                    color: AppColors.kPureBlack,
                  ),
                ),
                SizedBox(height: 12 * SizeConfig.heightMultiplier!),
                buildCategories(
                  categoryTile: 'Popular',
                  categories: [
                    {
                      'title': 'Mobile Phones',
                      'image': ImagePath.placeHolderDisplayImage,
                      'endsIn': '11h: 35m: 47s',
                      'amount': '15,000',
                    },
                    {
                      'title': 'Laptops',
                      'image': ImagePath.placeHolderDisplayImage,
                      'endsIn': '11h: 35m: 47s',
                      'amount': '15,000',
                    },
                    {
                      'title': 'Headphones',
                      'image': ImagePath.placeHolderDisplayImage,
                      'endsIn': '11h: 35m: 47s',
                      'amount': '15,000',
                    },
                    {
                      'title': 'Properties',
                      'image': ImagePath.placeHolderDisplayImage,
                      'endsIn': '11h: 35m: 47s',
                      'amount': '15,000',
                    },
                    {
                      'title': 'Computer Accessories',
                      'image': ImagePath.placeHolderDisplayImage,
                      'endsIn': '11h: 35m: 47s',
                      'amount': '15,000',
                    },
                  ],
                  imageHeight: 128 * SizeConfig.heightMultiplier!,
                  imageWidth: 112 * SizeConfig.widthMultiplier!,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCategories({
    required String categoryTile,
    required List<Map<String, String>> categories,
    required double imageHeight,
    required double imageWidth,
    String? endsIn,
    String? amount,
  }) {
    return SizedBox(
      height: (categoryTile.toLowerCase() == 'categories')
          ? imageHeight + 30 * SizeConfig.heightMultiplier!
          : imageHeight + 80 * SizeConfig.heightMultiplier!,
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
            imageHeight: imageHeight,
            imageWidth: imageWidth,
            endsIn: categories[index]['endsIn'] ?? '',
            amount: categories[index]['amount'] ?? '',
          );
        },
      ),
    );
  }
}
