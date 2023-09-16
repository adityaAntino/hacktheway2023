// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hacktheway2023/config/size_config.dart';
import 'package:hacktheway2023/constant/app_colors.dart';
import 'package:hacktheway2023/constant/app_text_style.dart';

class BidGridWidget extends StatelessWidget {
  const BidGridWidget({
    Key? key,
    required this.prices,
    required this.onPriceSelect,
    required this.selectedPriceIndex,
  }) : super(key: key);
  final List<int> prices;
  final Function(int) onPriceSelect;
  final int selectedPriceIndex;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: prices.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 20 * SizeConfig.widthMultiplier!,
        mainAxisSpacing: 20 * SizeConfig.widthMultiplier!,
        childAspectRatio: 9 / 4,
      ),
      itemBuilder: (context, index) {
        final isCurrentItemSelected = selectedPriceIndex == index;
        return InkWell(
          onTap: () {
            onPriceSelect(index);
          },
          child: Container(
            decoration: BoxDecoration(
              color: isCurrentItemSelected
                  ? AppColors.baseRed.withOpacity(0.1)
                  : null,
              border: Border.all(
                width: 1,
                color: isCurrentItemSelected
                    ? AppColors.baseRed.withOpacity(0.8)
                    : AppColors.greyF5,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '₹${prices[index].toString()}',
                  style: isCurrentItemSelected
                      ? AppTextStyle.f16W500Black0E.copyWith(
                          color: AppColors.baseRed,
                        )
                      : AppTextStyle.f16W500Grey500.copyWith(
                          color: AppColors.kPureBlack,
                        ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
