import 'package:flutter/material.dart';
import 'package:hacktheway2023/config/size_config.dart';
import 'package:hacktheway2023/constant/app_colors.dart';

class ProductShimmer extends StatelessWidget {
  final String categoryTitle;
  final double imageHeight;
  final double imageWidth;
  const ProductShimmer(
      {super.key,
      required this.categoryTitle,
      required this.imageHeight,
      required this.imageWidth});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: imageHeight + 34 * SizeConfig.heightMultiplier!,
      // width: imageWidth + 0 * SizeConfig.widthMultiplier!,
      child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => Container(
                height: imageHeight,
                width: imageWidth ,
                decoration: const BoxDecoration(
                    color: AppColors.greyEE,
                    borderRadius: BorderRadius.all(Radius.circular(8.0))),
              ),
          separatorBuilder: (context, index) => SizedBox(
                width: 8 * SizeConfig.widthMultiplier!,
              ),
          itemCount: 5),
    );
  }
}
