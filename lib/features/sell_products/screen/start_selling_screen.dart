import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacktheway2023/common/common_appbar.dart';
import 'package:hacktheway2023/common/custom_empty_screen.dart';
import 'package:hacktheway2023/common/custom_screen_loader.dart';
import 'package:hacktheway2023/common/helper_function.dart';
import 'package:hacktheway2023/common/primary_button.dart';
import 'package:hacktheway2023/common/product_overview_card.dart';
import 'package:hacktheway2023/config/size_config.dart';
import 'package:hacktheway2023/constant/app_colors.dart';
import 'package:hacktheway2023/constant/app_text_style.dart';
import 'package:hacktheway2023/constant/image_path.dart';
import 'package:hacktheway2023/features/sell_products/cubit/sell_products_cubit.dart';
import 'package:hacktheway2023/features/sell_products/cubit/sell_products_state.dart';
import 'package:hacktheway2023/features/sell_products/modal/get_auctions_modal.dart';
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
  GetAuctionsModal _getAuctionsModal = GetAuctionsModal();

  @override
  void initState() {
    // TODO: implement initState
    context.read<SellProductsCubit>().getAuction();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: 'Auction',
        isLead: false,
        parentContext: context,
        appBarBgColor: AppColors.kPureBlack,
      ),
      body: BlocConsumer<SellProductsCubit, SellProductsState>(
        listener: (context, state) {
          if (state is GetAuctionSuccess) {
            _getAuctionsModal = state.getAuctionsModal;
          }
        },
        builder: (context, state) {
          if (state is GetAuctionLoading) {
            return const CustomScreenLoader();
          }
          if (state is GetAuctionEmpty) {
            return CustomEmptyScreen(message: 'No Auctions available now');
          }
          return RefreshIndicator(
            color: AppColors.kPureBlack,
            onRefresh: () async {
              context.read<SellProductsCubit>().getAuction();
            },
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 16.0 * SizeConfig.heightMultiplier!,
                      horizontal: 24.0 * SizeConfig.widthMultiplier!),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      (_getAuctionsModal.data?.isNotEmpty ?? false)
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                    height: 8 * SizeConfig.heightMultiplier!),
                                Text(
                                  'Your Auctions',
                                  style: AppTextStyle.f16W500Black0E,
                                ),
                                SizedBox(
                                    height: 16 * SizeConfig.heightMultiplier!),
                              ],
                            )
                          : const SizedBox.shrink(),

                      ///IF AUCTIONS ARE CREATED ALREADY
                      (_getAuctionsModal.data?.isNotEmpty ?? false)
                          ? ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: _getAuctionsModal.data?.length ?? 0,
                              separatorBuilder: (context, index) => SizedBox(
                                  height: 8 * SizeConfig.heightMultiplier!),
                              itemBuilder: (context, index) =>
                                  ProductOverviewCard(
                                isBasePrice: true,
                                statusButtonOnTap: () {},
                                statusButtonColor: colorForStatus(_getAuctionsModal.data?[index].status),
                                statusButtonTextColor: AppColors.kPureWhite,
                                statusButtonText: _getAuctionsModal
                                    .data?[index].status
                                    ?.toUpperCase(),
                                onTap: () {
                                  BulandDarwaza.pushNamed(context,
                                      routeName:
                                          RouteName.sellAuctionDetailScreen,
                                      arguments: {
                                        "auctionDetail":
                                            _getAuctionsModal.data?[index]
                                      });
                                },
                                productName: _getAuctionsModal.data?[index]
                                        .itemDescription?.itemName ??
                                    '-',
                                biddingPrice: _getAuctionsModal.data?[index]
                                        .itemDescription?.initialPrice ??
                                    '-',
                                imageUrl: ImagePath.productImagePng,
                                bidEndTime: HelperFunction()
                                    .parseAndFormatDateTime(_getAuctionsModal
                                            .data?[index].endTime ??
                                        ''),
                              ),
                            )
                          : const SizedBox.shrink(),

                      ///IF AUCTIONS ARE NOT CREATED YET
                      (_getAuctionsModal.data?.isEmpty ?? false)
                          ? SizedBox(
                              height: 300,
                              child: LottieBuilder.asset(
                                  ImagePath.pushUpGuyLottie))
                          : const SizedBox.shrink(),
                      SizedBox(height: 16 * SizeConfig.heightMultiplier!),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),

      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * .35,
          child: PrimaryButton(
            onTap: () {
              BulandDarwaza.pushNamed(context,
                  routeName: RouteName.sellProductScreen);
            },
            buttonColor: AppColors.kPureBlack,
            buttonText: 'Start Selling +',
          ),
        ),
      ),
    );
  }

  Color colorForStatus(final status) {
    switch (status) {
      case "completed":
        return AppColors.darkGreen05;
      case "initialized":
        return AppColors.yellowRipe;
      case "ongoing":
        return AppColors.blue6c;
      default:
        return AppColors.kPureBlack;
    }
  }
}
