import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hacktheway2023/constant/app_colors.dart';

class CustomScreenLoader extends StatelessWidget {
  final double size;
  const CustomScreenLoader({this.size = 40, super.key});

  @override
  Widget build(BuildContext context) {
    return SpinKitFadingCircle(
      color: AppColors.kPureBlack,
      size: size,
    );
  }
}
