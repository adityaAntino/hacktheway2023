import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hacktheway2023/config/size_config.dart';
import 'package:hacktheway2023/constant/app_colors.dart';
import 'package:hacktheway2023/router/navigation_handler.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// you can add more fields that meet your needs
  const CommonAppBar({
    required this.title,
    this.key,
    required this.appBarBgColor,
    required this.parentContext,
    this.actions,
    this.leadingIcon,
    this.onLeadingTap,
    this.isLead = true,
    this.isCustomLead = false,
  }) : super(key: key);

  final String title;
  final List<Widget>? actions;
  final Key? key;
  final Color appBarBgColor;
  final String? leadingIcon;
  final BuildContext parentContext;
  final VoidCallback? onLeadingTap;
  final bool isLead;
  final bool isCustomLead;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      title: Text(
        title,
        textAlign: TextAlign.start,
        overflow: TextOverflow.fade,
        style: TextStyle(
          fontFamily: 'Mulish',
          fontSize: 20 * SizeConfig.textMultiplier!,
          fontWeight: FontWeight.w500,
          color: appBarBgColor == AppColors.kPureBlack
              ? AppColors.kPureWhite
              : AppColors.kPureBlack,
        ),
      ),
      backgroundColor: appBarBgColor,
      actions: actions,
      leading: isLead
          ? GestureDetector(
              onTap: onLeadingTap ?? () => BulandDarwaza.pop(parentContext),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Icon(
                  Icons.arrow_back_ios_new,
                  size: 22,
                  color: appBarBgColor == AppColors.kPureBlack
                      ? AppColors.kPureWhite
                      : AppColors.kPureBlack,
                ),
              ),
            )
          : isCustomLead
              ? GestureDetector(
                  onTap: onLeadingTap ?? () => BulandDarwaza.pop(parentContext),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      leadingIcon ?? '',
                    ),
                  ),
                )
              : null,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
