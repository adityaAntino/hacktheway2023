import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacktheway2023/features/buy_products/modals/get_all_auctions_modal.dart';
import 'package:hacktheway2023/features/sell_products/cubit/sell_products_state.dart';
import 'package:hacktheway2023/features/sell_products/modal/auction_start_response_modal.dart';
import 'package:hacktheway2023/features/sell_products/modal/get_auctions_modal.dart';
import 'package:hacktheway2023/features/sell_products/repository/sell_product_repository.dart';

class SellProductsCubit extends Cubit<SellProductsState> {
  SellProductsCubit(super.initialState);

  final SellProductRepository _sellProductRepository = SellProductRepository();

  void resetState() {
    emit(StartAuctionInitial());
  }

  Future<void> getAuction() async {
    emit(GetAuctionLoading());
    final GetAuctionsModal getAuctionsModal =
        await _sellProductRepository.getAuctionsRepo();
    if (getAuctionsModal.data == null) {
      emit(GetAuctionError(
          message: getAuctionsModal.message ?? 'Please try again login'));
    } else if (getAuctionsModal.data?.isEmpty ?? false) {
      emit(GetAuctionEmpty());
    } else if (getAuctionsModal.code == 200) {
      emit(GetAuctionSuccess(getAuctionsModal: getAuctionsModal));
    } else {
      emit(GetAuctionError(
          message: getAuctionsModal.message ?? 'Please try again login'));
    }
  }

  Future<void> startAuction(
      {required String productName,
      required String basePrice,
      required String description,
      required String auctionEndTime}) async {
    emit(StartAuctionLoading());
    final AuctionStartResponseModal auctionStartResponseModal =
        await _sellProductRepository.startAuctionRepo(
            productName: productName,
            basePrice: basePrice,
            description: description,
            auctionEndTime: auctionEndTime);
    if (auctionStartResponseModal.code == 201) {
      emit(StartAuctionSuccess());
    } else {
      emit(StartAuctionError(
          message:
              auctionStartResponseModal.message ?? 'Please try again later'));
    }
  }

  Future<void> closeAuction() async {
    emit(CloseAuctionLoading());
    final response = await _sellProductRepository.closeAuctionRepo();
    if (true) {
      emit(CloseAuctionSuccess());
    } else {
      emit(CloseAuctionError(message: ''));
    }
  }
}
