import 'package:flutter/material.dart';
import 'package:hacktheway2023/config/size_config.dart';
import 'package:hacktheway2023/constant/app_colors.dart';
import 'package:hacktheway2023/constant/app_text_style.dart';
import 'package:hacktheway2023/constant/image_path.dart';

class ProductOverviewCard extends StatelessWidget {
  final String imageUrl;
  final String productName;
  String? productDescription;
  String? ownerName;
  final String biddingPrice;
  final String bidEndTime;
  final Function() onTap;
  bool isDetailed;
  ProductOverviewCard({
    super.key,
    required this.imageUrl,
    required this.productName,
    required this.biddingPrice,
    required this.bidEndTime,
    required this.onTap,
    this.productDescription,
    this.ownerName,
    this.isDetailed = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
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
                  child: Image.asset(imageUrl)),
              SizedBox(height: 12 * SizeConfig.heightMultiplier!),

              ///PRODUCT NAME
              Text(
                productName,
                style: AppTextStyle.f16W500Black0E,
              ),
              SizedBox(height: 12 * SizeConfig.heightMultiplier!),

              ///PRODUCT DESCRIPTION - isDetailed(TRUE)
              (isDetailed)
                  ? Column(
                      children: [
                        Text(
                          productDescription ?? '-',
                          style: AppTextStyle.f14W400grey80,
                        ),
                        SizedBox(height: 25 * SizeConfig.heightMultiplier!),
                      ],
                    )
                  : const SizedBox.shrink(),

              ///OWNER NAME - isDetailed(TRUE)
              (isDetailed)
                  ? Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Owner',
                              style: AppTextStyle.f12W400grey80,
                            ),
                            Text(
                              ownerName ?? '-',
                              style: AppTextStyle.f14W500darkBlue1A,
                            ),
                          ],
                        ),
                        SizedBox(height: 25 * SizeConfig.heightMultiplier!),
                      ],
                    )
                  : const SizedBox.shrink(),

              ///AUCTION ENDS - isDetailed(TRUE)
              (isDetailed)
                  ? Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Auction Ends',
                              style: AppTextStyle.f12W400grey80,
                            ),
                            Text(
                              bidEndTime,
                              style: AppTextStyle.f14W500darkGreen500,
                            ),
                          ],
                        ),
                        SizedBox(height: 25 * SizeConfig.heightMultiplier!),
                      ],
                    )
                  : const SizedBox.shrink(),

              ///BIDING PRICE - isDetailed(TRUE)
              (isDetailed)
                  ? Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Biding price',
                              style: AppTextStyle.f12W400grey80,
                            ),
                            Text(
                              biddingPrice,
                              style: AppTextStyle.f16W700Black0E,
                            ),
                          ],
                        ),
                        SizedBox(height: 25 * SizeConfig.heightMultiplier!),
                      ],
                    )
                  : const SizedBox.shrink(),

              ///BIDDING PRICE - isDetailed(FALSE)
              (!isDetailed)
                  ? Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Bidding Price: ',
                              style: AppTextStyle.f14W400Grey80,
                            ),
                            Text(
                              biddingPrice,
                              style: AppTextStyle.f16W700Black0E,
                            )
                          ],
                        ),
                        SizedBox(height: 8 * SizeConfig.heightMultiplier!),
                      ],
                    )
                  : const SizedBox.shrink(),

              ///BID END TIME - isDetailed(FALSE)
              (!isDetailed)
                  ? Column(
                      children: [
                        Text(
                          bidEndTime,
                          style: AppTextStyle.f14W500darkGreen500,
                        ),
                      ],
                    )
                  : const SizedBox.shrink()
            ],
          ),
        ),
      ),
    );
  }
}
