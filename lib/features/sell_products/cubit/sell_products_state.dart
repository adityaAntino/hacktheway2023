import 'package:hacktheway2023/features/sell_products/modal/get_auctions_modal.dart';
import 'package:hacktheway2023/features/sell_products/modal/get_bid_count.dart';

abstract class SellProductsState {}

class StartAuctionInitial extends SellProductsState {}

///-----------GET ALL AUCTION
class GetAuctionLoading extends SellProductsState {}

class GetAuctionEmpty extends SellProductsState {}

class GetAuctionSuccess extends SellProductsState {
  GetAuctionsModal getAuctionsModal;
  GetAuctionSuccess({required this.getAuctionsModal});
}

class GetAuctionError extends SellProductsState {
  final String message;
  GetAuctionError({required this.message});
}

///-----------GET BID COUNT
class GetBidCountLoading extends SellProductsState {}

class GetBidCountSuccess extends SellProductsState {
  GetBidCountModal getBidCountModal;
  GetBidCountSuccess({required this.getBidCountModal});
}

class GetBidCountError extends SellProductsState {}

///-----------START AUCTION
class StartAuctionLoading extends SellProductsState {}

class StartAuctionSuccess extends SellProductsState {}

class StartAuctionError extends SellProductsState {
  final String message;
  StartAuctionError({required this.message});
}

///-----------CLOSE AUCTION
class CloseAuctionLoading extends SellProductsState {}

class CloseAuctionSuccess extends SellProductsState {}

class CloseAuctionError extends SellProductsState {
  final String message;
  CloseAuctionError({required this.message});
}
