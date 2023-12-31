import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacktheway2023/features/buy_products/modals/get_all_auctions_modal.dart';
import 'package:hacktheway2023/features/sell_products/cubit/sell_products_state.dart';
import 'package:hacktheway2023/features/sell_products/modal/auction_start_response_modal.dart';
import 'package:hacktheway2023/features/sell_products/modal/close_auction_modal.dart';
import 'package:hacktheway2023/features/sell_products/modal/get_auctions_modal.dart';
import 'package:hacktheway2023/features/sell_products/modal/get_bid_count.dart';
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
    if (getAuctionsModal.data?.isEmpty ??
        false || getAuctionsModal.data == null) {
      emit(GetAuctionEmpty());
    } else if (getAuctionsModal.code == 200) {
      emit(GetAuctionSuccess(getAuctionsModal: getAuctionsModal));
    } else {
      emit(GetAuctionError(
          message: getAuctionsModal.message ?? 'Please try again login'));
    }
  }

  Future<void> getBidCount({required String auctionId}) async {
    emit(GetBidCountLoading());
    final GetBidCountModal getBidCountModal =
        await _sellProductRepository.getBidCountRepo(auctionId: auctionId);
    if (getBidCountModal.code == 200) {
      emit(GetBidCountSuccess(getBidCountModal: getBidCountModal));
    } else {
      emit(GetBidCountError());
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

  Future<void> closeAuction({required String auctionId}) async {
    emit(CloseAuctionLoading());
    final CloseAuctionModal closeAuctionModal = await _sellProductRepository.closeAuctionRepo( auctionId: auctionId);
    if (closeAuctionModal.code == 200) {
      emit(CloseAuctionSuccess());
    } else {
      emit(CloseAuctionError(message: ''));
    }
  }
}
