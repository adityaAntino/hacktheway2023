import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacktheway2023/common/custom_cached_network_image.dart';
import 'package:hacktheway2023/common/helper_function.dart';
import 'package:hacktheway2023/common/primary_button.dart';
import 'package:hacktheway2023/config/size_config.dart';
import 'package:hacktheway2023/constant/app_colors.dart';
import 'package:hacktheway2023/constant/app_text_style.dart';
import 'package:hacktheway2023/constant/image_path.dart';
import 'package:intl/intl.dart';

class CategoryWidget extends StatefulWidget {
  final String title;
  final String image;
  final double imageHeight;
  final double imageWidth;
  final String? endsIn;
  final String? amount;
  bool isCategory;
  CategoryWidget({
    required this.image,
    required this.title,
    required this.imageHeight,
    required this.imageWidth,
    this.endsIn,
    this.amount,
    this.isCategory = false,
    super.key,
  });

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ((widget.amount ?? '').isNotEmpty)
          ? widget.imageWidth + 16 * SizeConfig.widthMultiplier!
          : widget.imageWidth,
      child: Column(
        crossAxisAlignment: (widget.isCategory)
            ? CrossAxisAlignment.center
            : CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(10), // Clip rounded corners
            child: Image.asset(
              widget.image,
              height: widget.imageHeight,
              width: widget.imageWidth,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            height: 12 * SizeConfig.heightMultiplier!,
          ),
          Text(
            widget.title,
            style: AppTextStyle.f14W400Black,
            overflow: TextOverflow.ellipsis,
          ),
          (widget.endsIn ?? '').isNotEmpty
              ? Padding(
                  padding: EdgeInsets.only(
                    top: 6 * SizeConfig.heightMultiplier!,
                    bottom: 3 * SizeConfig.heightMultiplier!,
                  ),
                  child: Text(
                    HelperFunction().parseAndFormatDateTime(widget.endsIn ?? '')
                    ,
                    style: AppTextStyle.f14W400Black.copyWith(
                      color: AppColors.darkGreen05,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )
              : const SizedBox.shrink(),
          (widget.amount ?? '').isNotEmpty
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '₹${widget.amount ?? '-'}',
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
