import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:hacktheway2023/config/size_config.dart';
import 'package:hacktheway2023/constant/image_path.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  final String imageUrl;
  final String? placeHolderErrorImage;
  final double height;
  final double width;
  final BoxShape boxShape;
  final Color? color;
  const CustomCachedNetworkImage(
      {Key? key,
      required this.imageUrl,
      this.placeHolderErrorImage,
      required this.height,
      this.boxShape = BoxShape.rectangle,
      this.color,
      required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      placeholder: (context, url) =>
          const Center(child: CupertinoActivityIndicator()),
      errorWidget: (context, url, error) => Image.network(
        placeHolderErrorImage ?? ImagePath.placeHolderDisplayImage,
      ),
      imageBuilder: (BuildContext context, imageProvider) {
        return Container(
          height: height * SizeConfig.heightMultiplier!,
          width: width * SizeConfig.widthMultiplier!,
          decoration: BoxDecoration(
            shape: boxShape,
            color: color,
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.fitHeight,
            ),
          ),
        );
      },
    );
  }
}
