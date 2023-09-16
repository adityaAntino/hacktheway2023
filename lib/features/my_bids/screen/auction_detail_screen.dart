import 'package:flutter/material.dart';
import 'package:hacktheway2023/common/commo_appbar.dart';
import 'package:hacktheway2023/common/common_dialog.dart';
import 'package:hacktheway2023/common/primary_button.dart';
import 'package:hacktheway2023/common/product_overview_card.dart';
import 'package:hacktheway2023/config/size_config.dart';
import 'package:hacktheway2023/constant/app_colors.dart';
import 'package:hacktheway2023/constant/image_path.dart';

class AuctionDetailScreen extends StatefulWidget {
  final bool isMyBid;
  const AuctionDetailScreen({required this.isMyBid, super.key});

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
                    'Morbi sit amet risus ornare, venenatis est con dimentum, elementum urna In dictum.',
                ownerName: 'Sourabh Singh',
                imageUrl: ImagePath.productImagePng,
                productName: 'OnePlus Nord CE 2 Lite 5G',
                biddingPrice: '₹15,000',
                bidEndTime: '07h 25min',
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16 * SizeConfig.widthMultiplier!,
          vertical: 8 * SizeConfig.heightMultiplier!,
        ),
        child: PrimaryButton(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return CommonDialog(
                  title: widget.isMyBid ? 'End Auction' : 'Place Bid',
                  content: widget.isMyBid
                      ? 'Are you sure you want to end this auction?'
                      : 'Are you sure you want to place this bet?',
                );
              },
            );
          },
          buttonColor: AppColors.kPureBlack,
          buttonText: widget.isMyBid ? 'End Auction' : 'Place Bid',
        ),
      ),
    );
  }
}
