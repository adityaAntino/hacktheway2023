import 'package:flutter/material.dart';
import 'package:hacktheway2023/common/common_appbar.dart';
import 'package:hacktheway2023/common/common_dialog.dart';
import 'package:hacktheway2023/common/primary_button.dart';
import 'package:hacktheway2023/constant/app_colors.dart';

class PlaceABidScreen extends StatefulWidget {
  const PlaceABidScreen({super.key});

  @override
  State<PlaceABidScreen> createState() => _PlaceABidScreenState();
}

class _PlaceABidScreenState extends State<PlaceABidScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: 'Place Your Bid',
        appBarBgColor: AppColors.kPureBlack,
        parentContext: context,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [],
        ),
      ),
      bottomNavigationBar: PrimaryButton(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) {
              return CommonDialog(
                title: 'Place Bid',
                content: 'Are you sure you want to place this bet?',
                onTap: () {},
              );
            },
          );
        },
        buttonColor: AppColors.kPureBlack,
        buttonText: 'Place your bid',
      ),
    );
  }
}
