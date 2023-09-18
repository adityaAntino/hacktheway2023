import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
import 'package:hacktheway2023/constant/image_path.dart';
import 'package:hacktheway2023/features/sell_products/cubit/sell_products_cubit.dart';
import 'package:hacktheway2023/features/sell_products/cubit/sell_products_state.dart';
import 'package:hacktheway2023/router/named_route.dart';
import 'package:hacktheway2023/router/navigation_handler.dart';

class SellProductScreen extends StatefulWidget {
  const SellProductScreen({super.key});

  @override
  State<SellProductScreen> createState() => _SellProductScreenState();
}

class _SellProductScreenState extends State<SellProductScreen> {
  final TextEditingController _productNameCtrl = TextEditingController();
  final TextEditingController _basePriceCtrl = TextEditingController();
  final TextEditingController _descriptionCtrl = TextEditingController();
  Map<String, int> auctionEndTime = {
    "8 hours": 8,
    "18 hours": 18,
    "36 hours": 36,
    "48 hours": 48,
    "100 hours": 100,
    "200 hours" : 200
  };
  String selectedEndDuration = '8 hours'; // O
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ///To unFocus Keyboard when tapped inside the scaffold
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: CommonAppBar(
          title: 'Sell Product',
          isLead: true,
          parentContext: context,
          appBarBgColor: AppColors.kPureBlack,
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Product Details',
                    style: AppTextStyle.f16W500Grey500,
                  ),
                  SizedBox(height: 16 * SizeConfig.heightMultiplier!),

                  ///PRODUCT NAME
                  Text(
                    'Product Name',
                    style: AppTextStyle.f14W400Black7A,
                  ),
                  SizedBox(height: 4 * SizeConfig.heightMultiplier!),
                  CommonTextField(
                    textEditingController: _productNameCtrl,
                    hintText: 'e.g. Oneplus',
                  ),

                  ///BASE PRICE
                  SizedBox(height: 16 * SizeConfig.heightMultiplier!),
                  Text(
                    'Base Price',
                    style: AppTextStyle.f14W400Black7A,
                  ),
                  SizedBox(height: 4 * SizeConfig.heightMultiplier!),
                  CommonTextField(
                    textEditingController: _basePriceCtrl,
                    hintText: 'e.g. ₹ 15,000 ',
                    textInputType: TextInputType.number,
                  ),

                  ///AUCTION DURATION
                  SizedBox(height: 16 * SizeConfig.heightMultiplier!),
                  Text(
                    'Auction End Time (in hours)',
                    style: AppTextStyle.f14W400Black7A,
                  ),
                  SizedBox(height: 4 * SizeConfig.heightMultiplier!),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButtonFormField<String>(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: AppColors.grey3)),
                        ),
                        hint: Text(selectedEndDuration),
                        isExpanded: true,
                        items: auctionEndTime.keys.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (val) {
                          setState(() {
                            selectedEndDuration = val!;
                          });
                        },
                      ),
                    ),
                  ),

                  ///UPLOAD PHOTO
                  SizedBox(height: 16 * SizeConfig.heightMultiplier!),
                  Text(
                    'Upload Photo',
                    style: AppTextStyle.f14W400Black7A,
                  ),
                  SizedBox(height: 4 * SizeConfig.heightMultiplier!),
                  Container(
                    height: 160 * SizeConfig.heightMultiplier!,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors.grey05)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 25.0),
                      child: SvgPicture.asset(ImagePath.uploadIconSvg),
                    ),
                  ),

                  ///PRODUCT DESCRIPTION
                  SizedBox(height: 16 * SizeConfig.heightMultiplier!),
                  Text(
                    'Description',
                    style: AppTextStyle.f14W400Black7A,
                  ),
                  SizedBox(height: 4 * SizeConfig.heightMultiplier!),
                  CommonTextField(
                    textEditingController: _descriptionCtrl,
                    hintText: 'Write description here.... ',
                    maxLines: 5,
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<SellProductsCubit, SellProductsState>(
            builder: (context, state) {
              if (state is StartAuctionLoading) {
                return const CustomScreenLoader();
              } else if (state is StartAuctionSuccess) {
                WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return SuccessAlertDialog(
                            description:
                                'Your auction will start at the scheduled time.',
                            title: 'Auction Placed',
                            onTap: () {
                              BulandDarwaza.pushReplacementNamed(context,
                                  routeName: RouteName.dashboardScreen);
                              context.read<SellProductsCubit>().resetState();
                              Fluttertoast.showToast(
                                  msg: 'Auction Placed Successfully');
                            });
                      });
                });
              }
              if (state is StartAuctionError) {
                Fluttertoast.showToast(msg: state.message);
                context.read<SellProductsCubit>().resetState();
              }
              return PrimaryButton(
                onTap: () {
                  if (_productNameCtrl.text.isEmpty) {
                    Fluttertoast.showToast(msg: 'Enter Product Name');
                  } else if (_basePriceCtrl.text.isEmpty) {
                    Fluttertoast.showToast(msg: 'Enter Base Price');
                  } else if (int.tryParse(_basePriceCtrl.text)! <= 0) {
                    Fluttertoast.showToast(
                        msg: 'Base Price should be greater than 0');
                  } else if (_descriptionCtrl.text.isEmpty) {
                    Fluttertoast.showToast(msg: 'Enter Description of Product');
                  } else {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return CommonDialog(
                            title: 'Confirm Auction',
                            content: 'Are you sure you start this auction.',
                            onTap: () {
                              BulandDarwaza.pop(context);
                              context.read<SellProductsCubit>().startAuction(
                                  productName: _productNameCtrl.text,
                                  basePrice: _basePriceCtrl.text,
                                  description: _descriptionCtrl.text,
                                  auctionEndTime:
                                      auctionEndTime[selectedEndDuration]
                                          .toString());
                            },
                          );
                        });
                  }
                },
                buttonColor: AppColors.kPureBlack,
                buttonText: 'Start Auction',
              );
            },
          ),
        ),
      ),
    );
  }
}
