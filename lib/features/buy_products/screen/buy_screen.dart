import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hacktheway2023/common/common_appbar.dart';
import 'package:hacktheway2023/config/size_config.dart';
import 'package:hacktheway2023/constant/app_colors.dart';
import 'package:hacktheway2023/constant/app_text_style.dart';
import 'package:hacktheway2023/constant/image_path.dart';
import 'package:hacktheway2023/constant/string_constant.dart';
import 'package:hacktheway2023/features/buy_products/cubit/buy_products_cubit.dart';
import 'package:hacktheway2023/features/buy_products/cubit/buy_producuts_state.dart';
import 'package:hacktheway2023/features/buy_products/shimmer/product_shimmer.dart';
import 'package:hacktheway2023/features/buy_products/widgets/category_widget.dart';
import 'package:hacktheway2023/router/named_route.dart';
import 'package:hacktheway2023/router/navigation_handler.dart';
import 'package:hacktheway2023/features/buy_products/modals/get_all_auctions_modal.dart'
    as getAllAuctionsModal;

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
  List<getAllAuctionsModal.Datum> listOfAuction = [];
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    context.read<BuyProductsCubit>().getAllAuctions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: CommonAppBar(
        appBarBgColor: AppColors.kPureBlack,
        parentContext: context,
        title: 'Auction Buddy',
        leadingIcon: ImagePath.appLogoSvg,
        isLead: false,
        isCustomLead: true,
        onLeadingTap: () {
          _key.currentState?.openDrawer();
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
            child: BlocConsumer<BuyProductsCubit, BuyProductsState>(
              listener: (context, state) {
                if (state is BuyProductsSuccess) {
                  listOfAuction.addAll(state.auctionsList
                      as Iterable<getAllAuctionsModal.Datum>);
                }
              },
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 16 * SizeConfig.heightMultiplier!),
                    //Categories
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Categories',
                          style: AppTextStyle.f18W500Black.copyWith(
                            color: AppColors.kPureBlack,
                          ),
                        ),
                        SizedBox(height: 12 * SizeConfig.heightMultiplier!),
                        BlocBuilder<BuyProductsCubit, BuyProductsState>(
                          builder: (context, state) {
                            if (state is BuyProductsLoading) {
                              return ProductShimmer(
                                categoryTitle: '',
                                imageHeight: 100 * SizeConfig.heightMultiplier!,
                                imageWidth: 90 * SizeConfig.widthMultiplier!,
                              );
                            }
                            return buildCategories(
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
                            );
                          },
                        ),
                      ],
                    ),
                    // SizedBox(height: 12 * SizeConfig.heightMultiplier!),

                    // ENDING SOON
                    Text(
                      'Ending Soon',
                      style: AppTextStyle.f18W500Black.copyWith(
                        color: AppColors.kPureBlack,
                      ),
                    ),
                    SizedBox(height: 12 * SizeConfig.heightMultiplier!),
                    BlocBuilder<BuyProductsCubit, BuyProductsState>(
                      builder: (context, state) {
                        if (state is BuyProductsLoading) {
                          return ProductShimmer(
                            categoryTitle: '',
                            imageHeight: 160 * SizeConfig.heightMultiplier!,
                            imageWidth: 130 * SizeConfig.widthMultiplier!,
                          );
                        }
                        return buildProducts(
                          categoryTitle: 'Ending Soon',
                          productImage: StringConstant().productImage,
                          itemData: listOfAuction,
                          imageHeight: 160 * SizeConfig.heightMultiplier!,
                          imageWidth: 130 * SizeConfig.widthMultiplier!,
                        );
                      },
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
                    BlocBuilder<BuyProductsCubit, BuyProductsState>(
                      builder: (context, state) {
                        if (state is BuyProductsLoading) {
                          return ProductShimmer(
                            categoryTitle: '',
                            imageHeight: 170 * SizeConfig.heightMultiplier!,
                            imageWidth: 135 * SizeConfig.widthMultiplier!,
                          );
                        }
                        return buildProducts(
                          categoryTitle: 'Popular',
                          productImage: StringConstant().productImage,
                          itemData: listOfAuction,
                          imageHeight: 170 * SizeConfig.heightMultiplier!,
                          imageWidth: 135 * SizeConfig.widthMultiplier!,
                        );
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget customDrawer() {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      padding:
          EdgeInsets.symmetric(horizontal: 6 * SizeConfig.widthMultiplier!),
      color: AppColors.kPureWhite,
      child: Column(
        children: [
          SizedBox(height: 38 * SizeConfig.heightMultiplier!),

          ///PROFILE IMAGE
          Center(
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundColor: AppColors.transparent,
                  foregroundImage: AssetImage(ImagePath.userProfile),
                ),
                Container(
                    decoration: const BoxDecoration(
                        color: AppColors.blackDA,
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.camera_alt),
                    ))
              ],
            ),
          ),
          SizedBox(height: 16 * SizeConfig.heightMultiplier!),

          customDrawerTile(
              title: 'Personal Details',
              icon: Icons.houseboat_rounded,
              onTap: () {
                Fluttertoast.showToast(msg: 'Personal Details Coming Soon');
              }),
        ],
      ),
    );
  }

  Widget customDrawerTile(
      {required String title,
      required IconData icon,
      required VoidCallback onTap}) {
    return InkWell(
      splashColor: AppColors.red500,
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(icon),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: AppTextStyle.f14W400Black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildProducts(
      {required String categoryTitle,
      required double imageHeight,
      required double imageWidth,
      required List<String> productImage,
      List<getAllAuctionsModal.Datum>? itemData,
      String? endsIn,
      String? amount,
      bool isCategory = false}) {
    return SizedBox(
      height: imageHeight + 84 * SizeConfig.heightMultiplier!,
      child: ListView.separated(
        separatorBuilder: (context, index) {
          return SizedBox(width: 16 * SizeConfig.widthMultiplier!);
        },
        shrinkWrap: true,
        itemCount: itemData?.length ?? 0,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Map<String, dynamic> productDetails = {
                'productName':
                    itemData?[index].itemDescription?.itemName ?? 'Product XYZ',
                'basePrice':
                    itemData?[index].itemDescription?.initialPrice ?? '-',
                'productImage': productImage[index],
                'productDescription':
                    itemData?[index].itemDescription?.itemInfo ?? 'Product XYZ',
                'endTime': itemData?[index].endTime ?? '',
                'id': itemData?[index].id ?? '-',
                'ownerName': itemData?[index].auctioneer ?? '-',
              };
              BulandDarwaza.pushNamed(
                context,
                routeName: RouteName.auctionDetailsScreen,
                arguments: {
                  'isMyBid': false,
                  'productDetails': productDetails,
                  'isWon': false
                },
              );
            },
            child: CategoryWidget(
              isCategory: isCategory,
              title: itemData?[index].itemDescription?.itemName ?? '',
              image: productImage[index],
              imageHeight: imageHeight,
              imageWidth: imageWidth,
              endsIn: itemData?[index].endTime ?? '',
              amount: itemData?[index].itemDescription?.initialPrice ?? '',
            ),
          );
        },
      ),
    );
  }

  Widget buildCategories(
      {required String categoryTitle,
      required List<Map<String, String>> categories,
      required double imageHeight,
      required double imageWidth,
      String? endsIn,
      String? amount,
      bool isCategory = false}) {
    return SizedBox(
      height: imageHeight + 84 * SizeConfig.heightMultiplier!,
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
              BulandDarwaza.pushNamed(
                context,
                routeName: RouteName.categoryScreen,
                arguments: {'title': categories[index]['title']},
              );
            },
            child: CategoryWidget(
              isCategory: isCategory,
              title: categories[index]['title'] ?? '',
              image: categories[index]['image'] ??
                  ImagePath.placeHolderDisplayImage,
              imageHeight: imageHeight,
              imageWidth: imageWidth,
            ),
          );
        },
      ),
    );
  }
}
