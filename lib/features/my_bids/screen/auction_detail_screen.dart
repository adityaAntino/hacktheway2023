import 'package:flutter/material.dart';
import 'package:hacktheway2023/common/common_appbar.dart';
import 'package:hacktheway2023/common/primary_button.dart';
import 'package:hacktheway2023/common/product_overview_card.dart';
import 'package:hacktheway2023/config/size_config.dart';
import 'package:hacktheway2023/constant/app_colors.dart';
import 'package:hacktheway2023/constant/app_text_style.dart';
import 'package:hacktheway2023/constant/image_path.dart';
import 'package:hacktheway2023/router/named_route.dart';
import 'package:hacktheway2023/router/navigation_handler.dart';

class AuctionDetailScreen extends StatefulWidget {
  final bool isMyBid;
  final bool? isWon;
  final Map<String, dynamic>? productDetails;
  const AuctionDetailScreen({
    this.isWon = false,
    required this.isMyBid,
    this.productDetails,
    super.key,
  });

  @override
  State<AuctionDetailScreen> createState() => _AuctionDetailScreenState();
}

class _AuctionDetailScreenState extends State<AuctionDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        parentContext: context,
        title: 'Auction Details',
        appBarBgColor: AppColors.kPureBlack,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 16.0 * SizeConfig.heightMultiplier!,
          horizontal: 24.0 * SizeConfig.widthMultiplier!,
        ),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ProductOverviewCard(
                onTap: () {},
                isDetailed: true,
                productDescription:
                    widget.productDetails?['productDescription'] ??
                        'Product XYZ',
                ownerName: widget.productDetails?['ownerName'] ?? 'Owner Name',
                imageUrl: ImagePath.productImagePng,
                productName:
                    widget.productDetails?['productName'] ?? 'Product XYZ',
                biddingPrice: widget.productDetails?['basePrice'] ?? '00',
                bidEndTime: widget.productDetails?['endTime'] ?? '00',
              ),
              SizedBox(height: 24 * SizeConfig.heightMultiplier!),
              (widget.isWon ?? false)
                  ? Text(
                      'You had the highest bid.',
                      style: AppTextStyle.f14W500darkGreen500,
                    )
                  : const SizedBox.shrink(),
              SizedBox(height: 4 * SizeConfig.heightMultiplier!),
              (widget.isWon ?? false)
                  ? Text(
                      'Please proceed to checkout to complete payment.',
                      style: AppTextStyle.f14W500darkGreen500,
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: (widget.isMyBid)
          ? (widget.isWon ?? false)
              ? Padding(
                  padding: const EdgeInsets.all(16),
                  child: PrimaryButton(
                    onTap: () {
                      BulandDarwaza.pushNamed(
                        context,
                        routeName: RouteName.paymentScreen,
                        arguments: {
                          'amount':
                              widget.productDetails?['winningAmount'] ?? '-',
                        },
                      );
                    },
                    buttonColor: AppColors.kPureBlack,
                    buttonText: 'Continue',
                  ),
                )
              : const SizedBox.shrink()
          : Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16 * SizeConfig.widthMultiplier!,
                vertical: 8 * SizeConfig.heightMultiplier!,
              ),
              child: PrimaryButton(
                onTap: () {
                  BulandDarwaza.pushNamed(
                    context,
                    routeName: RouteName.placeABidScreen,
                    arguments: {
                      'id': widget.productDetails?['id'] ?? '-',
                      'baseAmount': widget.productDetails?['basePrice'] ?? '00',
                    },
                  );
                },
                buttonColor: AppColors.kPureBlack,
                buttonText: 'Bid Now',
              ),
            ),
    );
  }
}
