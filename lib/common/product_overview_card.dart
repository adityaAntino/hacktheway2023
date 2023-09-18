import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacktheway2023/common/cubit/common_widget_cubit.dart';
import 'package:hacktheway2023/common/cubit/common_widget_state.dart';
import 'package:hacktheway2023/common/primary_button.dart';
import 'package:hacktheway2023/config/size_config.dart';
import 'package:hacktheway2023/constant/app_colors.dart';
import 'package:hacktheway2023/constant/app_text_style.dart';

class ProductOverviewCard extends StatefulWidget {
  final String imageUrl;
  final String productName;
  String? productDescription;
  String? ownerName;
  final String biddingPrice;
  final String bidEndTime;
  final Function() onTap;
  String? status;
  String highestBiddingPrice;
  Function()? statusButtonOnTap;
  String? statusButtonText;
  Color? statusButtonColor;
  Color? statusButtonTextColor;
  bool isDetailed;
  bool isBasePrice;
  ProductOverviewCard({
    super.key,
    required this.imageUrl,
    required this.productName,
    required this.biddingPrice,
    required this.bidEndTime,
    required this.onTap,
    this.statusButtonOnTap,
    this.status = '',
    this.highestBiddingPrice = '',
    this.statusButtonText,
    this.statusButtonColor = AppColors.kPureBlack,
    this.statusButtonTextColor = AppColors.kPureWhite,
    this.productDescription,
    this.ownerName,
    this.isDetailed = false,
    this.isBasePrice = false,
  });

  @override
  State<ProductOverviewCard> createState() => _ProductOverviewCardState();
}

class _ProductOverviewCardState extends State<ProductOverviewCard> {
  // Timer? countdownTimer;
  String remainingTime = 'Calculating...';
  // String targetDateString = '';
  @override
  void initState() {
    context
        .read<CommonWidgetCubit>()
        .calculateAuctionEndTime(widget.bidEndTime);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CommonWidgetCubit, CommonWidgetState>(
      listener: (context, state) {
        if (state is ProductTimerSuccess) {
          remainingTime = state.remainingTime;
        }
      },
      builder: (context, state) {
        return InkWell(
            onTap: widget.onTap,
            child: Container(
                decoration: const BoxDecoration(
                    color: AppColors.greyF5,
                    borderRadius: BorderRadius.all(Radius.circular(8.0))),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(widget.imageUrl)),
                      SizedBox(height: 12 * SizeConfig.heightMultiplier!),

                      ///PRODUCT NAME
                      Text(
                        widget.productName,
                        style: AppTextStyle.f16W500Black0E,
                      ),
                      SizedBox(height: 12 * SizeConfig.heightMultiplier!),

                      ///PRODUCT DESCRIPTION - isDetailed(TRUE)
                      (widget.isDetailed)
                          ? Column(
                              children: [
                                Text(
                                  widget.productDescription ?? '-',
                                  style: AppTextStyle.f14W400grey80,
                                ),
                                SizedBox(
                                    height: 25 * SizeConfig.heightMultiplier!),
                              ],
                            )
                          : const SizedBox.shrink(),

                      ///OWNER NAME - isDetailed(TRUE)
                      (widget.isDetailed)
                          ? Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Owner',
                                      style: AppTextStyle.f12W400grey80,
                                    ),
                                    Text(
                                      widget.ownerName ?? '-',
                                      style: AppTextStyle.f14W500darkBlue1A,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                    height: 25 * SizeConfig.heightMultiplier!),
                              ],
                            )
                          : const SizedBox.shrink(),

                      ///AUCTION ENDS - isDetailed(TRUE)
                      (widget.isDetailed)
                          ? Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Auction Ends in: ',
                                      style: AppTextStyle.f12W400grey80,
                                    ),
                                    (state is ProductTimerLoading)
                                        ? const CupertinoActivityIndicator()
                                        : Text(
                                            remainingTime,
                                            style: AppTextStyle
                                                .f14W500darkGreen500,
                                          ),
                                  ],
                                ),
                                SizedBox(
                                    height: 25 * SizeConfig.heightMultiplier!),
                              ],
                            )
                          : const SizedBox.shrink(),

                      ///BIDDING PRICE - isDetailed(FALSE)
                      (!widget.isDetailed)
                          ? Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Base Price: ',
                                      style: AppTextStyle.f14W400Grey80,
                                    ),
                                    SizedBox(
                                        height:
                                            25 * SizeConfig.heightMultiplier!),
                                  ],
                                )
                              ],
                            )
                          : const SizedBox.shrink(),

                      ///BID END TIME - isDetailed(FALSE)
                      (!widget.isDetailed)
                          ? Column(
                              children: [
                                SizedBox(
                                    height: 8 * SizeConfig.heightMultiplier!),
                                ((widget.status ?? 'pending').toLowerCase() ==
                                        'completed')
                                    ? PrimaryButton(
                                        onTap: widget.statusButtonOnTap,
                                        buttonColor: widget.statusButtonColor ??
                                            AppColors.kPureWhite,
                                        buttonText:
                                            widget.statusButtonText ?? '-',
                                      )
                                    : Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Ends at: ',
                                            style: AppTextStyle.f14W400Grey80,
                                          ),
                                          Text(
                                            widget.bidEndTime,
                                            style: AppTextStyle
                                                .f14W500darkGreen500,
                                          ),
                                          const Spacer(),
                                          widget.isBasePrice
                                              ? PrimaryButton(
                                                  onTap:
                                                      widget.statusButtonOnTap,
                                                  textColor: widget
                                                          .statusButtonTextColor ??
                                                      AppColors.kPureWhite,
                                                  buttonColor: widget
                                                          .statusButtonColor ??
                                                      AppColors.kPureBlack,
                                                  buttonText:
                                                      widget.statusButtonText ??
                                                          'Bid Now',
                                                  borderRadius: 19,
                                                  outerVerticalPadding: 10 *
                                                      SizeConfig
                                                          .heightMultiplier!,
                                                  outerHorizontalPadding: 24 *
                                                      SizeConfig
                                                          .widthMultiplier!,
                                                )
                                              : const SizedBox.shrink(),
                                        ],
                                      ),
                              ],
                            )
                          : const SizedBox.shrink()
                    ],
                  ),
                )));
      },
    );
  }
}
