import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacktheway2023/features/buy_products/cubit/buy_producuts_state.dart';
import 'package:hacktheway2023/features/buy_products/modals/get_all_auctions_modal.dart';
import 'package:hacktheway2023/features/buy_products/repository/buy_products_repo.dart';

class BuyProductsCubit extends Cubit<BuyProductsState> {
  BuyProductsCubit(super.initialState);

  final _buyProductsRepo = BuyProductsRepository();

  int bidAmount = 0;

  void resetInitState() {
    emit(BuyProductsInitial());
  }

  void setBid(int amount) {
    if (amount > 0) {
      emit(BidSet(amount));
      bidAmount = amount;
    } else {
      emit(BidNotSet());
    }
  }

  void emitState(state) {
    emit(state);
  }

  Future<void> placeBid({required int amount, required String id}) async {
    emit(PlaceBidLoading());
    final result = await _buyProductsRepo.placeBid(amount: amount, id: id);
    if (result.toLowerCase() == 'success') {
      emit(PlaceBidSuccess());
    } else {
      emit(PlaceBidFailed());
    }
  }

  Future<void> getAllAuctions() async {
    emit(BuyProductsLoading());
    final GetAllAuctionsModal? response =
        await _buyProductsRepo.fetchAuctions();

    if (response == null) {
      emit(BuyProductsFailed());
    } else if ((response.data ?? []).isEmpty) {
      emit(BuyProductsEmpty());
    } else if (response.status == 'success') {
      emit(BuyProductsSuccess(response.data));
    } else {
      emit(BuyProductsFailed());
    }
  }
}
