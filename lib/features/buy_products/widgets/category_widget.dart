import 'package:flutter/material.dart';
import 'package:hacktheway2023/common/custom_cached_network_image.dart';
import 'package:hacktheway2023/config/size_config.dart';
import 'package:hacktheway2023/constant/app_text_style.dart';

class CategoryWidget extends StatelessWidget {
  final String title;
  final String image;
  final double? imageHeight;
  final double? imageWidth;
  const CategoryWidget({
    required this.image,
    required this.title,
    this.imageHeight,
    this.imageWidth,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(10), // Clip rounded corners
          child: CustomCachedNetworkImage(
            imageUrl: image,
            height: 100 * SizeConfig.heightMultiplier!,
            width: 100 * SizeConfig.widthMultiplier!,
            boxShape: BoxShape.rectangle,
          ),
        ),
        SizedBox(
          height: 12 * SizeConfig.heightMultiplier!,
        ),
        Text(
          title,
          style: AppTextStyle.f14W400Black,
        ),
      ],
    );
  }
}
