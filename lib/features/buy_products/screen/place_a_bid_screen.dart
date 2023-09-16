import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hacktheway2023/common/common_appbar.dart';
import 'package:hacktheway2023/common/common_dialog.dart';
import 'package:hacktheway2023/common/common_text_field.dart';
import 'package:hacktheway2023/common/primary_button.dart';
import 'package:hacktheway2023/config/size_config.dart';
import 'package:hacktheway2023/constant/app_colors.dart';
import 'package:hacktheway2023/constant/app_text_style.dart';
import 'package:hacktheway2023/features/buy_products/cubit/buy_products_cubit.dart';
import 'package:hacktheway2023/features/buy_products/cubit/buy_producuts_state.dart';
import 'package:hacktheway2023/features/buy_products/widgets/bid_grid_list.dart';

class PlaceABidScreen extends StatefulWidget {
  const PlaceABidScreen({super.key});

  @override
  State<PlaceABidScreen> createState() => _PlaceABidScreenState();
}

class _PlaceABidScreenState extends State<PlaceABidScreen> {
  TextEditingController bidController = TextEditingController();
  BuyProductsCubit? buyProductsCubit;
  int amount = 0;

  @override
  void initState() {
    super.initState();
    buyProductsCubit = BlocProvider.of(context);
    bidController.addListener(() {
      buyProductsCubit?.setBid(int.parse(bidController.text.trim()));
    });
  }

  @override
  void dispose() {
    super.dispose();
    buyProductsCubit?.resetInitState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: 'Place Your Bid',
        appBarBgColor: AppColors.kPureBlack,
        parentContext: context,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16 * SizeConfig.widthMultiplier!,
          ),
          child: BlocListener<BuyProductsCubit, BuyProductsState>(
            listener: (context, state) {
              if (state is BidSet) {
                amount = state.amount;
              }
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30 * SizeConfig.heightMultiplier!),
                SizedBox(
                  height: 126 * SizeConfig.heightMultiplier!,
                  child: const BidGridList(),
                ),
                SizedBox(height: 16 * SizeConfig.heightMultiplier!),
                Text(
                  'Custom Bid',
                  style: AppTextStyle.f16W500Black0E,
                ),
                SizedBox(height: 8 * SizeConfig.heightMultiplier!),
                CommonTextField(
                  textEditingController: bidController,
                  hintText: 'Eg. 500',
                  textInputType: TextInputType.number,
                ),
                SizedBox(height: 8 * SizeConfig.heightMultiplier!),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16 * SizeConfig.widthMultiplier!,
          vertical: 16 * SizeConfig.heightMultiplier!,
        ),
        child: BlocBuilder<BuyProductsCubit, BuyProductsState>(
          builder: (context, state) {
            return PrimaryButton(
              fontSize: 18 * SizeConfig.textMultiplier!,
              onTap: () {
                if (state is BidSet) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return CommonDialog(
                        title: 'Place Bid',
                        content: 'Are you sure you want to place this bet?',
                        onTap: () {
                          buyProductsCubit?.placeBid(
                            amount: amount,
                            id: '',
                          );
                        },
                      );
                    },
                  );
                } else {
                  Fluttertoast.showToast(msg: 'Place a bid first!');
                }
              },
              buttonColor:
                  (state is BidSet) ? AppColors.kPureBlack : AppColors.greyF5,
              buttonText: 'Place your bid',
            );
          },
        ),
      ),
    );
  }
}
