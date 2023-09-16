import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacktheway2023/common/custom_cached_network_image.dart';
import 'package:hacktheway2023/common/primary_button.dart';
import 'package:hacktheway2023/config/size_config.dart';
import 'package:hacktheway2023/constant/app_colors.dart';
import 'package:hacktheway2023/constant/app_text_style.dart';
import 'package:hacktheway2023/constant/image_path.dart';

class CategoryWidget extends StatelessWidget {
  final String title;
  final String image;
  final double imageHeight;
  final double imageWidth;
  final String? endsIn;
  final String? amount;
  const CategoryWidget({
    required this.image,
    required this.title,
    required this.imageHeight,
    required this.imageWidth,
    this.endsIn,
    this.amount,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ((amount ?? '').isNotEmpty)
          ? imageWidth + 16 * SizeConfig.widthMultiplier!
          : imageWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(10), // Clip rounded corners
            // child: CustomCachedNetworkImage(
            //   imageUrl: image,
            //   height: imageHeight,
            //   width: imageWidth,
            //   boxShape: BoxShape.rectangle,
            // ),
            child: Image.asset(
              ImagePath.placeHolderDisplayImage,
              height: imageHeight,
              width: imageWidth,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            height: 12 * SizeConfig.heightMultiplier!,
          ),
          Text(
            title,
            style: AppTextStyle.f14W400Black,
            overflow: TextOverflow.ellipsis,
          ),
          (endsIn ?? '').isNotEmpty
              ? Padding(
                  padding: EdgeInsets.only(
                    top: 6 * SizeConfig.heightMultiplier!,
                    bottom: 3 * SizeConfig.heightMultiplier!,
                  ),
                  child: Text(
                    endsIn ?? '-',
                    style: AppTextStyle.f14W400Black.copyWith(
                      color: AppColors.darkGreen05,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )
              : const SizedBox.shrink(),
          (amount ?? '').isNotEmpty
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '₹${amount ?? '-'}',
                      style: AppTextStyle.f14W400Black.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    PrimaryButton(
                      onTap: () {},
                      buttonColor: AppColors.kPureBlack,
                      buttonText: 'Bid Now',
                      innerHorizontalPadding: 8 * SizeConfig.widthMultiplier!,
                      outerHorizontalPadding: 0,
                      outerVerticalPadding: 0,
                      innerVerticalPadding: 6 * SizeConfig.heightMultiplier!,
                      borderRadius: 16,
                      fontSize: 12 * SizeConfig.textMultiplier!,
                    )
                  ],
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
