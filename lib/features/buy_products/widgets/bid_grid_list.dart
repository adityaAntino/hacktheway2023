import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacktheway2023/features/buy_products/cubit/buy_products_cubit.dart';
import 'package:hacktheway2023/features/buy_products/cubit/buy_producuts_state.dart';
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
  List<int> prices = [];
  int selectedPriceIndex = -1;

  @override
  void initState() {
    super.initState();
    prices = [
      50 + ((widget.basePrice ~/ 10) * 10),
      100 + ((widget.basePrice ~/ 10) * 10),
      500 + ((widget.basePrice ~/ 10) * 10),
      1000 + ((widget.basePrice ~/ 10) * 10),
      2000 + ((widget.basePrice ~/ 10) * 10),
      3000 + ((widget.basePrice ~/ 10) * 10),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BuyProductsCubit, BuyProductsState>(
      listener: (context, state) {
        if (state is RemoveSuggestedBid) {
          selectedPriceIndex = -1;
        }
      },
      builder: (context, state) {
        return BidGridWidget(
          prices: prices,
          onPriceSelect: (selectedAmount) {
            setState(() {
              if (selectedPriceIndex == selectedAmount) {
                selectedPriceIndex = -1;
                context.read<BuyProductsCubit>().setBid(0);
              } else {
                selectedPriceIndex = selectedAmount;
                context
                    .read<BuyProductsCubit>()
                    .setBid(prices[selectedPriceIndex]);
                context.read<BuyProductsCubit>().emitState(RemoveCustomBid());
              }
            });
          },
          selectedPriceIndex: selectedPriceIndex,
        );
      },
    );
  }
}
