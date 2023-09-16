import 'package:flutter/material.dart';
import 'package:hacktheway2023/common/common_appbar.dart';
import 'package:hacktheway2023/common/helper_function.dart';
import 'package:hacktheway2023/common/primary_button.dart';
import 'package:hacktheway2023/common/success_alert_dialog.dart';
import 'package:hacktheway2023/config/size_config.dart';
import 'package:hacktheway2023/constant/app_colors.dart';
import 'package:hacktheway2023/constant/app_text_style.dart';
import 'package:hacktheway2023/router/named_route.dart';
import 'package:hacktheway2023/router/navigation_handler.dart';

class PaymentScreen extends StatelessWidget {
  final String amount;
  const PaymentScreen({required this.amount, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: 'Auction Detail',
        appBarBgColor: AppColors.kPureBlack,
        parentContext: context,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20 * SizeConfig.widthMultiplier!,
          vertical: 20 * SizeConfig.heightMultiplier!,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Amount',
                  style: AppTextStyle.f14W400Grey80,
                ),
                Text(
                  '₹$amount',
                  style: AppTextStyle.f14W600Black9A,
                ),
              ],
            ),
            SizedBox(height: 16 * SizeConfig.heightMultiplier!),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'GST',
                  style: AppTextStyle.f14W400Grey80,
                ),
                Text(
                  '₹${HelperFunction.calculateGST(amount: amount, tax: 18)}',
                  style: AppTextStyle.f14W600Black9A,
                ),
              ],
            ),
            SizedBox(height: 20 * SizeConfig.heightMultiplier!),
            const Divider(
              color: AppColors.grey3,
              thickness: 2,
            ),
            SizedBox(height: 4 * SizeConfig.heightMultiplier!),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: AppTextStyle.f14W400Grey80,
                ),
                Text(
                  '₹${(int.parse((HelperFunction.calculateGST(amount: amount, tax: 18))) + int.parse(amount)).toString()}',
                  style: AppTextStyle.f14W600Black9A,
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: PrimaryButton(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return SuccessAlertDialog(
                  description: 'Payment has been successful',
                  title: 'Payment Successfull',
                  onTap: () {
                    BulandDarwaza.pushReplacementNamed(
                      context,
                      routeName: RouteName.dashboardScreen,
                    );
                  },
                );
              },
            );
          },
          buttonColor: AppColors.kPureBlack,
          buttonText: 'Pay',
        ),
      ),
    );
  }
}
