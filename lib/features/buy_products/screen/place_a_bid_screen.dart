import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hacktheway2023/common/common_appbar.dart';
import 'package:hacktheway2023/common/common_dialog.dart';
import 'package:hacktheway2023/common/common_text_field.dart';
import 'package:hacktheway2023/common/custom_screen_loader.dart';
import 'package:hacktheway2023/common/primary_button.dart';
import 'package:hacktheway2023/common/success_alert_dialog.dart';
import 'package:hacktheway2023/config/size_config.dart';
import 'package:hacktheway2023/constant/app_colors.dart';
import 'package:hacktheway2023/constant/app_text_style.dart';
import 'package:hacktheway2023/features/buy_products/cubit/buy_products_cubit.dart';
import 'package:hacktheway2023/features/buy_products/cubit/buy_producuts_state.dart';
import 'package:hacktheway2023/features/buy_products/widgets/bid_grid_list.dart';
import 'package:hacktheway2023/router/named_route.dart';
import 'package:hacktheway2023/router/navigation_handler.dart';

class PlaceABidScreen extends StatefulWidget {
  final String id;
  final String baseAmount;
  const PlaceABidScreen({
    required this.id,
    required this.baseAmount,
    super.key,
  });

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
    bidController.dispose();
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
                if (amount > int.parse(bidController.text.trim())) {
                  bidController.clear();
                }
              }
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30 * SizeConfig.heightMultiplier!),
                SizedBox(
                  height: 126 * SizeConfig.heightMultiplier!,
                  child: BidGridList(
                    basePrice: int.parse(widget.baseAmount),
                  ),
                ),
                SizedBox(height: 34 * SizeConfig.heightMultiplier!),
                Text(
                  'Custom Bid',
                  style: AppTextStyle.f16W500Black0E,
                ),
                SizedBox(height: 8 * SizeConfig.heightMultiplier!),
                CommonTextField(
                  textEditingController: bidController,
                  hintText: 'Eg. ₹${(widget.baseAmount)}',
                  textInputType: TextInputType.number,
                  onChanged: (value) {},
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  interactiveSelection: false,
                ),
                SizedBox(height: 8 * SizeConfig.heightMultiplier!),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BlocBuilder<BuyProductsCubit, BuyProductsState>(
        builder: (context, state) {
          if (state is PlaceBidLoading) {
            return const CustomScreenLoader();
          }
          if (state is PlaceBidCustomError) {
            Fluttertoast.showToast(
                msg: 'You cannot place bid in your own auction');
          }
          if (state is PlaceBidSuccess) {
            WidgetsBinding.instance.addPostFrameCallback(
              (timeStamp) {
                showDialog(
                  context: context,
                  builder: (context) {
                    return SuccessAlertDialog(
                      description: 'Your Bid has been successfully placed!',
                      title: 'Bid Placed',
                      onTap: () {
                        BulandDarwaza.pushReplacementNamed(
                          context,
                          routeName: RouteName.dashboardScreen,
                        );
                        buyProductsCubit?.emitState(PlaceBidInitial());
                      },
                    );
                  },
                );
              },
            );
          }
          if (state is PlaceBidFailed) {
            Fluttertoast.showToast(
              msg:
                  'Failed to place the bid at the moment, please try again later!',
            );
          }
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16 * SizeConfig.widthMultiplier!,
              vertical: 16 * SizeConfig.heightMultiplier!,
            ),
            child: PrimaryButton(
              fontSize: 18 * SizeConfig.textMultiplier!,
              onTap: () {
                if (amount < int.parse(widget.baseAmount)) {
                  Fluttertoast.showToast(
                    msg:
                        'Your bid must be greater than ₹${int.parse(widget.baseAmount)}',
                  );
                } else if (state is BidSet) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return CommonDialog(
                        title: 'Place Bid',
                        content: 'Are you sure you want to place this bet?',
                        onTap: () {
                          buyProductsCubit?.placeBid(
                            amount: amount,
                            id: widget.id,
                          );
                          BulandDarwaza.pop(context);
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
            ),
          );
        },
      ),
    );
  }
}
