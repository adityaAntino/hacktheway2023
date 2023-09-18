import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hacktheway2023/common/common_appbar.dart';
import 'package:hacktheway2023/common/common_dialog.dart';
import 'package:hacktheway2023/common/custom_screen_loader.dart';
import 'package:hacktheway2023/common/helper_function.dart';
import 'package:hacktheway2023/common/primary_button.dart';
import 'package:hacktheway2023/common/product_overview_card.dart';
import 'package:hacktheway2023/common/success_alert_dialog.dart';
import 'package:hacktheway2023/config/size_config.dart';
import 'package:hacktheway2023/constant/app_colors.dart';
import 'package:hacktheway2023/constant/app_text_style.dart';
import 'package:hacktheway2023/constant/image_path.dart';
import 'package:hacktheway2023/features/sell_products/cubit/sell_products_cubit.dart';
import 'package:hacktheway2023/features/sell_products/cubit/sell_products_state.dart';
import 'package:hacktheway2023/features/sell_products/modal/get_auctions_modal.dart';
import 'package:hacktheway2023/router/named_route.dart';
import 'package:hacktheway2023/router/navigation_handler.dart';

class SellAuctionDetailScreen extends StatefulWidget {
  final Datum auctionDetail;
  const SellAuctionDetailScreen({super.key, required this.auctionDetail});

  @override
  State<SellAuctionDetailScreen> createState() =>
      _SellAuctionDetailScreenState();
}

class _SellAuctionDetailScreenState extends State<SellAuctionDetailScreen> {
  int bidCount = -1;
  @override
  void initState() {
    context
        .read<SellProductsCubit>()
        .getBidCount(auctionId: widget.auctionDetail.id ?? '');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        parentContext: context,
        title: 'Auction Detail',
        appBarBgColor: AppColors.kPureBlack,
      ),
      body: BlocConsumer<SellProductsCubit, SellProductsState>(
        listener: (context, state) {
          if (state is GetBidCountSuccess) {
            bidCount = state.getBidCountModal.data?.count ?? -1;
          }
        },
        builder: (context, state) {
          if(state is GetBidCountLoading){
            return const CustomScreenLoader();
          }
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                if (widget.auctionDetail.status == 'completed')
                  ((bidCount == 0 || bidCount == -1))
                      ? Text(
                          'No one has bid in this auction!',
                          style: AppTextStyle.f16W500Black0E,
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Highest Bidding Price: ',
                              style: AppTextStyle.f16W500Black0E,
                            ),
                            Text(
                              widget.auctionDetail.winningBid?.amount
                                      .toString() ??
                                  '',
                              style: AppTextStyle.f14W500darkGreen500.copyWith(
                                fontSize: 16,
                              ),
                            )
                          ],
                        ),
                SizedBox(
                  height: 16 * SizeConfig.heightMultiplier!,
                ),
                ProductOverviewCard(
                    highestBiddingPrice:
                        widget.auctionDetail.winningBid?.amount.toString() ??
                            '',
                    imageUrl: ImagePath.productImagePng,
                    isDetailed: true,
                    productDescription:
                        widget.auctionDetail.itemDescription?.itemInfo ?? '',
                    productName:
                        widget.auctionDetail.itemDescription?.itemName ?? '',
                    ownerName: widget.auctionDetail.auctioneer ?? '',
                    biddingPrice:
                        widget.auctionDetail.itemDescription?.initialPrice ??
                            '',
                    bidEndTime: HelperFunction().parseAndFormatDateTime(widget.auctionDetail.endTime ?? ''),
                    onTap: () {}),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: (widget.auctionDetail.status != 'completed')
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: BlocConsumer<SellProductsCubit, SellProductsState>(
                listener: (context, state) {},
                builder: (context, state) {
                  if (state is CloseAuctionLoading) {
                    return const CustomScreenLoader();
                  } else if (state is CloseAuctionSuccess) {
                    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return SuccessAlertDialog(
                                description: 'Your auction ended successfully.',
                                title: 'Auction Ended',
                                onTap: () {
                                  BulandDarwaza.pushReplacementNamed(context,
                                      routeName: RouteName.dashboardScreen);
                                  Fluttertoast.showToast(
                                      msg: 'Auction Closed Successfully');
                                  context
                                      .read<SellProductsCubit>()
                                      .resetState();
                                });
                          });
                    });
                    context.read<SellProductsCubit>().resetState();
                  }
                  return PrimaryButton(
                    onTap: () {
                      if (bidCount == 0) {
                        showDialog(
                            context: context,
                            builder: (BuildContext dialogContext) {
                              return CommonDialog(
                                  title: 'End Auction',
                                  content:
                                      'No one has bid yet. Do you still want to continue?',
                                  onTap: () {
                                    context
                                        .read<SellProductsCubit>()
                                        .closeAuction(
                                            auctionId:
                                                widget.auctionDetail.id ?? '');
                                    BulandDarwaza.pop(context);
                                  });
                            });
                      } else {
                        showDialog(
                            context: context,
                            builder: (BuildContext dialogContext) {
                              return CommonDialog(
                                  title: 'End Auction',
                                  content: 'Are you sure you end this auction.',
                                  onTap: () {
                                    context
                                        .read<SellProductsCubit>()
                                        .closeAuction(
                                            auctionId:
                                                widget.auctionDetail.id ?? '');
                                    BulandDarwaza.pop(context);
                                  });
                            });
                      }
                    },
                    buttonColor: AppColors.kPureBlack,
                    buttonText: 'End Auction',
                  );
                },
              ),
            )
          : const SizedBox.shrink(),
    );
  }
}
