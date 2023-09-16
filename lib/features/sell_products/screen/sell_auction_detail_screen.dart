import 'package:flutter/material.dart';
import 'package:hacktheway2023/common/common_appbar.dart';
import 'package:hacktheway2023/common/common_dialog.dart';
import 'package:hacktheway2023/common/primary_button.dart';
import 'package:hacktheway2023/common/product_overview_card.dart';
import 'package:hacktheway2023/constant/app_colors.dart';
import 'package:hacktheway2023/constant/image_path.dart';
import 'package:hacktheway2023/router/navigation_handler.dart';

class SellAuctionDetailScreen extends StatefulWidget {
  const SellAuctionDetailScreen({super.key});

  @override
  State<SellAuctionDetailScreen> createState() =>
      _SellAuctionDetailScreenState();
}

class _SellAuctionDetailScreenState extends State<SellAuctionDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        parentContext: context,
        title: 'Auction Detail',
        appBarBgColor: AppColors.kPureBlack,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ProductOverviewCard(
                imageUrl: ImagePath.productImagePng,
                isDetailed: true,
                productDescription:
                    'Morbi sit amet risus ornare, venenatis est con dimentum, elementum urna In dictum.',
                productName: 'OnePlus Nord CE 2 Lite 5G',
                ownerName: 'Sourabh Singh',
                biddingPrice: '₹15,000',
                bidEndTime: '09:00 PM ,23 Sep, 2023  ',
                onTap: () {})
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: PrimaryButton(
          onTap: () {
            showDialog(
                context: context,
                builder: (context) {
                  return CommonDialog(
                      title: 'End Auction',
                      content: 'Are you sure you end this auction.',
                      onTap: () {
                        BulandDarwaza.pop(context);

                      });
                });
          },
          buttonColor: AppColors.kPureBlack,
          buttonText: 'End Auction',
        ),
      ),
    );
  }
}
