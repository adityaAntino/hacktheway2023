import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacktheway2023/features/buy_products/cubit/buy_producuts_state.dart';
import 'package:hacktheway2023/features/buy_products/modals/get_all_auctions_modal.dart';
import 'package:hacktheway2023/features/buy_products/repository/buy_products_repo.dart';

class BuyProductsCubit extends Cubit<BuyProductsState> {
  BuyProductsCubit(super.initialState);

  final _buyProductsRepo = BuyProductsRepository();

  void resetInitState() {
    emit(BuyProductsInitial());
  }

  Future<void> getAllAuctions() async {
    emit(BuyPrioductsLoading());
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
