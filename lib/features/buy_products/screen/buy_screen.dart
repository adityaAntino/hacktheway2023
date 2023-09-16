import 'package:flutter/material.dart';
import 'package:hacktheway2023/common/common_appbar.dart';
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
        leadingIcon: ImagePath.appLogoSvg,
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
                  isCategory: true,
                  categoryTitle: 'Categories',
                  categories: [
                    {
                      'title': 'Mobile Phones',
                      'image': ImagePath.mobileImage,
                    },
                    {
                      'title': 'Laptops',
                      'image': ImagePath.laptopImage,
                    },
                    {
                      'title': 'Headphones',
                      'image': ImagePath.headphoneImage,
                    },
                    {
                      'title': 'Properties',
                      'image': ImagePath.propertyImage,
                    },
                  ],
                  imageHeight: 100 * SizeConfig.heightMultiplier!,
                  imageWidth: 90 * SizeConfig.widthMultiplier!,
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
                  categoryTitle: 'Ending Soon',
                  categories: [
                    {
                      'title': 'One Plus Nord CE Lite 5G',
                      'image': ImagePath.mobileImage,
                      'endsIn': '11h: 35m: 47s',
                      'amount': '15,000',
                    },
                    {
                      'title': 'Laptops',
                      'image': ImagePath.laptopImage,
                      'endsIn': '11h: 35m: 47s',
                      'amount': '15,000',
                    },
                    {
                      'title': 'Headphones',
                      'image': ImagePath.headphoneImage,
                      'endsIn': '11h: 35m: 47s',
                      'amount': '15,000',
                    },
                    {
                      'title': 'Properties',
                      'image': ImagePath.propertyImage,
                      'endsIn': '11h: 35m: 47s',
                      'amount': '15,000',
                    },
                  ],
                  imageHeight: 160 * SizeConfig.heightMultiplier!,
                  imageWidth: 130 * SizeConfig.widthMultiplier!,
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
                  categoryTitle: 'Popular',
                  categories: [
                    {
                      'title': 'Mobile Phone',
                      'image': ImagePath.mobileImage,
                      'endsIn': '11h: 35m: 47s',
                      'amount': '15,000',
                    },
                    {
                      'title': 'Laptop',
                      'image': ImagePath.laptopImage,
                      'endsIn': '11h: 35m: 47s',
                      'amount': '15,000',
                    },
                    {
                      'title': 'Headphone',
                      'image': ImagePath.headphoneImage,
                      'endsIn': '11h: 35m: 47s',
                      'amount': '15,000',
                    },
                    {
                      'title': 'Property',
                      'image': ImagePath.propertyImage,
                      'endsIn': '11h: 35m: 47s',
                      'amount': '15,000',
                    },
                  ],
                  imageHeight: 170 * SizeConfig.heightMultiplier!,
                  imageWidth: 135 * SizeConfig.widthMultiplier!,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCategories({
    required String categoryTitle,
    required List<Map<String, String>> categories,
    required double imageHeight,
    required double imageWidth,
    String? endsIn,
    String? amount,
    bool isCategory = false
  }) {
    return SizedBox(
      height: (categoryTitle.toLowerCase() == 'categories')
          ? imageHeight + 30 * SizeConfig.heightMultiplier!
          : imageHeight + 84 * SizeConfig.heightMultiplier!,
      child: ListView.separated(
        separatorBuilder: (context, index) {
          return SizedBox(width: 8 * SizeConfig.widthMultiplier!);
        },
        shrinkWrap: true,
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              if (categoryTitle.toLowerCase() == 'categories') {
                BulandDarwaza.pushNamed(
                  context,
                  routeName: RouteName.categoryScreen,
                  arguments: {'title': categories[index]['title']},
                );
              }
            },
            child: CategoryWidget(
              isCategory: isCategory,
              title: categories[index]['title'] ?? '',
              image: categories[index]['image'] ??
                  ImagePath.placeHolderDisplayImage,
              imageHeight: imageHeight,
              imageWidth: imageWidth,
              endsIn: categories[index]['endsIn'] ?? '',
              amount: categories[index]['amount'] ?? '',
            ),
          );
        },
      ),
    );
  }
}
