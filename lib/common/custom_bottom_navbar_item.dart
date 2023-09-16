// ignore_for_file: always_specify_types

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hacktheway2023/config/size_config.dart';

class CustomBottomNavbarItem extends StatefulWidget {
  const CustomBottomNavbarItem(
      {super.key,
      required this.onTap,
      required this.itemColor,
      required this.barColor,
      required this.icon,
      required this.title});
  final VoidCallback onTap;
  final Color itemColor;
  final Color barColor;
  final String icon;
  final String title;

  @override
  State<CustomBottomNavbarItem> createState() => _CustomBottomNavbarItemState();
}

class _CustomBottomNavbarItemState extends State<CustomBottomNavbarItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: widget.onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              width: 70,
              height: 7 * SizeConfig.heightMultiplier!,
              decoration: BoxDecoration(
                  color: widget.barColor,
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(2),
                      bottomRight: Radius.circular(2))),
            ),
            const SizedBox(
              height: 10,
            ),
            SvgPicture.asset(
              widget.icon,
              color: widget.itemColor,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              widget.title,
              style: TextStyle(color: widget.itemColor),
            )
          ],
        ),
      ),
    );
  }
}
