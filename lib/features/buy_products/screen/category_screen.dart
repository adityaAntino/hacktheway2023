import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacktheway2023/common/common_appbar.dart';
import 'package:hacktheway2023/common/custom_empty_screen.dart';
import 'package:hacktheway2023/common/custom_screen_loader.dart';
import 'package:hacktheway2023/common/helper_function.dart';
import 'package:hacktheway2023/common/product_overview_card.dart';
import 'package:hacktheway2023/config/size_config.dart';
import 'package:hacktheway2023/constant/app_colors.dart';
import 'package:hacktheway2023/constant/image_path.dart';
import 'package:hacktheway2023/features/buy_products/cubit/buy_products_cubit.dart';
import 'package:hacktheway2023/features/buy_products/cubit/buy_producuts_state.dart';
import 'package:hacktheway2023/features/buy_products/modals/get_all_auctions_modal.dart'
    as GetAllAuctionsModal;
import 'package:hacktheway2023/router/named_route.dart';
import 'package:hacktheway2023/router/navigation_handler.dart';

class CategoryScreen extends StatefulWidget {
  final String title;
  const CategoryScreen({required this.title, super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<GetAllAuctionsModal.Datum> auctionList = [];
  BuyProductsCubit? buyProductsCubit;

  void initState() {
    buyProductsCubit = BlocProvider.of(context);
    buyProductsCubit?.getAllAuctions();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

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
          color: AppColors.black7A,
          onRefresh: () async {
            buyProductsCubit?.getAllAuctions();
          },
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16 * SizeConfig.widthMultiplier!,
              vertical: 8 * SizeConfig.heightMultiplier!,
            ),
            child: BlocConsumer<BuyProductsCubit, BuyProductsState>(
              listener: (context, state) {
                if (state is BuyProductsSuccess) {
                  auctionList = state.auctionsList ?? [];
                }
              },
              builder: (context, state) {
                if (state is BuyProductsLoading) {
                  return const CustomScreenLoader(size: 50);
                }
                if (state is BuyProductsEmpty) {
                  return CustomEmptyScreen(
                    message:
                        'No Auctions Available at the time, try again later!',
                  );
                }
                if (state is BuyProductsFailed) {
                  return CustomEmptyScreen(
                    message:
                        'Failed to load Auctions at the moment, try again later!',
                  );
                }
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: auctionList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 10 * SizeConfig.heightMultiplier!,
                      ),
                      child: ProductOverviewCard(
                        imageUrl: ImagePath.placeHolderDisplayImage,
                        productName:
                            auctionList[index].itemDescription?.itemName ??
                                'Product XYZ',
                        isBasePrice: true,
                        biddingPrice:
                            auctionList[index].itemDescription?.initialPrice ??
                                '-',
                        bidEndTime: HelperFunction().parseAndFormatDateTime(
                          auctionList[index].endTime ?? '',
                        ),
                        onTap: () {
                          Map<String, dynamic> productDetails = {
                            'productName':
                                auctionList[index].itemDescription?.itemName ??
                                    'Product XYZ',
                            'basePrice': auctionList[index]
                                    .itemDescription
                                    ?.initialPrice ??
                                '-',
                            'productDescription':
                                auctionList[index].itemDescription?.itemInfo ??
                                    'Product XYZ',
                            'endTime': HelperFunction().parseAndFormatDateTime(
                              auctionList[index].endTime ?? '',
                            ),
                            'id': auctionList[index].id ?? '-',
                            'ownerName': auctionList[index].auctioneer ?? '-',
                          };
                          BulandDarwaza.pushNamed(
                            context,
                            routeName: RouteName.auctionDetailsScreen,
                            arguments: {
                              'isMyBid': false,
                              'productDetails': productDetails,
                              'isWon':false
                            },
                          );
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
