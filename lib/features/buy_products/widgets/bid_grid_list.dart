import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hacktheway2023/common/primary_button.dart';
import 'package:hacktheway2023/constant/app_colors.dart';
import 'package:hacktheway2023/features/buy_products/widgets/bid_grid_widget.dart';

class CoinsGridList extends StatefulWidget {
  const CoinsGridList({
    super.key,
  });

  @override
  State<CoinsGridList> createState() => _CoinsGridListState();
}

class _CoinsGridListState extends State<CoinsGridList> {
  // TODO : change prices to dynamic from the api
  final List<int> prices = [
    50,
    100,
    500,
    1000,
    2000,
    3000,
    4000,
    5000,
    10000,
  ];
  int selectedPriceIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          BidGridWidget(
              prices: prices,
              onPriceSelect: (selectedCoin) {
                setState(() {
                  if (selectedPriceIndex == selectedCoin) {
                    selectedPriceIndex = -1;
                  } else {
                    selectedPriceIndex = selectedCoin;
                  }
                });
              },
              selectedPriceIndex: selectedPriceIndex),
          if (selectedPriceIndex != -1)
            PrimaryButton(
              onTap: () {
                // AnywhereDoor.pushNamed(
                //   context,
                //   routeName: RouteName.walletCheckout,
                //   arguments: BalanceModal(
                //     amount: prices[selectedPriceIndex],
                //     isAddCoin: true,
                //     isGst: true,
                //   ),
                // );
              },
              buttonColor: AppColors.kPureBlack,
              buttonText: 'Proceed',
            ),
        ],
      ),
    );
  }
}
