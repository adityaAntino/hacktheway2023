import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hacktheway2023/common/primary_button.dart';
import 'package:hacktheway2023/constant/app_colors.dart';
import 'package:hacktheway2023/features/buy_products/cubit/buy_products_cubit.dart';
import 'package:hacktheway2023/features/buy_products/widgets/bid_grid_widget.dart';

class BidGridList extends StatefulWidget {
  final int basePrice;
  const BidGridList({
    required this.basePrice,
    super.key,
  });

  @override
  State<BidGridList> createState() => _BidGridListState();
}

class _BidGridListState extends State<BidGridList> {
  // TODO : change prices to dynamic from the api
  final List<int> prices = [
    50,
    100,
    500,
    1000,
    2000,
    3000,
  ];
  int selectedPriceIndex = -1;
  @override
  void initState() {
    super.initState();
    for (var element in prices) {
      element + widget.basePrice;
    }
    print('prices- $prices');
  }

  @override
  Widget build(BuildContext context) {
    return BidGridWidget(
      prices: prices,
      onPriceSelect: (selectedAmount) {
        setState(() {
          if (selectedPriceIndex == selectedAmount) {
            selectedPriceIndex = -1;
            context.read<BuyProductsCubit>().setBid(0);
          } else {
            selectedPriceIndex = selectedAmount;
            context.read<BuyProductsCubit>().setBid(prices[selectedPriceIndex]);
          }
        });
      },
      selectedPriceIndex: selectedPriceIndex,
    );
  }
}
