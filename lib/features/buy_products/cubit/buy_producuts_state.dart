import 'package:hacktheway2023/features/buy_products/modals/get_all_auctions_modal.dart'
    as getAllAuctionsModal;

abstract class BuyProductsState {}

class BuyProductsInitial extends BuyProductsState {}

class BuyPrioductsLoading extends BuyProductsState {}

class BuyProductsEmpty extends BuyProductsState {}

class BuyProductsFailed extends BuyProductsState {}

class BuyProductsSuccess extends BuyProductsState {
  List<getAllAuctionsModal.Datum>? auctionsList;
  BuyProductsSuccess(this.auctionsList);
}
