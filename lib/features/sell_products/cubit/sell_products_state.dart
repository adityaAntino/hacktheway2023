
import 'package:hacktheway2023/features/sell_products/modal/get_auctions_modal.dart';

abstract class SellProductsState{}

class StartAuctionInitial extends SellProductsState{}


///-----------GET ALL AUCTION

class GetAuctionLoading extends SellProductsState{}

class GetAuctionEmpty extends SellProductsState{}

class GetAuctionSuccess extends SellProductsState{
  GetAuctionsModal getAuctionsModal;
  GetAuctionSuccess({required this.getAuctionsModal});
}

class GetAuctionError extends SellProductsState{
  final String message;
  GetAuctionError({required this.message});
}


///-----------START AUCTION
class StartAuctionLoading extends SellProductsState{}

class StartAuctionSuccess extends SellProductsState{}

class StartAuctionError extends SellProductsState{
  final String message;
  StartAuctionError({required this.message});
}

///-----------CLOSE AUCTION

class CloseAuctionLoading extends SellProductsState{}

class CloseAuctionSuccess extends SellProductsState{}

class CloseAuctionError extends SellProductsState{
  final String message;
  CloseAuctionError({required this.message});
}




