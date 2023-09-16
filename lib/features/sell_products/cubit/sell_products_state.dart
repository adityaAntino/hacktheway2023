abstract class SellProductsState{}

class StartAuctionInitial extends SellProductsState{}


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



