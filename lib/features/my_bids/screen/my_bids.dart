import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacktheway2023/common/common_appbar.dart';
import 'package:hacktheway2023/common/custom_empty_screen.dart';
import 'package:hacktheway2023/common/custom_screen_loader.dart';
import 'package:hacktheway2023/common/helper_function.dart';
import 'package:hacktheway2023/common/product_overview_card.dart';
import 'package:hacktheway2023/config/size_config.dart';
import 'package:hacktheway2023/constant/app_colors.dart';
import 'package:hacktheway2023/constant/app_text_style.dart';
import 'package:hacktheway2023/constant/image_path.dart';
import 'package:hacktheway2023/features/my_bids/cubit/my_bids_cubit.dart';
import 'package:hacktheway2023/features/my_bids/cubit/my_bids_state.dart';
import 'package:hacktheway2023/features/my_bids/modals/my_bids_modal.dart'
    as MyBidsModal;
import 'package:hacktheway2023/router/named_route.dart';
import 'package:hacktheway2023/router/navigation_handler.dart';

class MyBidsScreen extends StatefulWidget {
  final bool isBack;
  const MyBidsScreen({
    Key? key,
    this.isBack = true,
  }) : super(key: key);

  @override
  State<MyBidsScreen> createState() => _MyBidsScreenState();
}

class _MyBidsScreenState extends State<MyBidsScreen> {
  MyBidsCubit? myBidsCubit;
  List<MyBidsModal.Datum> myBids = [];
  @override
  void initState() {
    super.initState();
    myBidsCubit = BlocProvider.of(context);
    myBidsCubit?.getMyBids();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        parentContext: context,
        isLead: false,
        title: 'My Bids',
        appBarBgColor: AppColors.kPureBlack,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: 16.0 * SizeConfig.heightMultiplier!,
            horizontal: 24.0 * SizeConfig.widthMultiplier!),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: BlocConsumer<MyBidsCubit, MyBidsState>(
            listener: (context, state) {
              if (state is MyBidsSuccess) {
                myBids = state.myBids ?? [];
              }
            },
            builder: (context, state) {
              if (state is MyBidsLoading) {
                return const CustomScreenLoader();
              }
              if (state is MyBidsEmpty) {
                return CustomEmptyScreen(
                  message:
                      'Failed to get you bids at the moment, try again later!',
                );
              }
              if (state is MyBidsFailed) {
                return CustomEmptyScreen(
                  message:
                      'You have not bid yet! No bids available',
                );
              }
              return ListView.separated(
                  shrinkWrap: true,
                  itemCount: myBids.length,
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 8 * SizeConfig.heightMultiplier!);
                  },
                  itemBuilder: (context, index) {
                    return ProductOverviewCard(
                      onTap: () {
                        BulandDarwaza.pushNamed(
                          context,
                          routeName: RouteName.auctionDetailsScreen,
                          arguments: {
                            'isMyBid': true,
                            'isWon': (myBids[index].won ?? false),
                            'productDetails': {
                              'productName':
                                  myBids[index].itemDescription?.itemName ??
                                      '-',
                              'productDescription':
                                  myBids[index].itemDescription?.itemInfo ??
                                      'Product info',
                              'basePrice':
                                  myBids[index].itemDescription?.initialPrice ??
                                      '00',
                              'endTime': myBids[index].endTime ?? 'End time',
                              'id': myBids[index].id ?? '-',
                              'ownerName':
                                  myBids[index].auctioneer ?? 'Owner Name',
                              'winningAmount':
                                  (myBids[index].winningBid?.amount ?? 0)
                                      .toString()
                            },
                          },
                        );
                      },
                      imageUrl: ImagePath.productImagePng,
                      productName:
                          myBids[index].itemDescription?.itemName ?? '-',
                      biddingPrice:
                          myBids[index].itemDescription?.initialPrice ?? '0',
                      bidEndTime: HelperFunction()
                          .parseAndFormatDateTime(myBids[index].endTime ?? '-'),
                    );
                  });
            },
          ),
        ),
      ),
    );
  }
}
