import 'package:hacktheway2023/features/buy_products/modals/get_all_auctions_modal.dart'
    as getAllAuctionsModal;

abstract class BuyProductsState {}

class BidSet extends BuyProductsState {
  int amount;
  BidSet(this.amount);
}

class RemoveSuggestedBid extends BuyProductsState {}

class RemoveCustomBid extends BuyProductsState {}

class BidNotSet extends BuyProductsState {}

class BuyProductsInitial extends BuyProductsState {}

class PlaceBidInitial extends BuyProductsState {}

class PlaceBidLoading extends BuyProductsState {}

class BuyProductsLoading extends BuyProductsState {}

class BuyProductsEmpty extends BuyProductsState {}

class BuyProductsFailed extends BuyProductsState {}

class PlaceBidFailed extends BuyProductsState {}

class PlaceBidSuccess extends BuyProductsState {}

class BuyProductsSuccess extends BuyProductsState {
  List<getAllAuctionsModal.Datum>? auctionsList;
  BuyProductsSuccess(this.auctionsList);
}
