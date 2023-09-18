import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacktheway2023/features/my_bids/cubit/my_bids_state.dart';
import 'package:hacktheway2023/features/my_bids/modals/my_bids_modal.dart';
import 'package:hacktheway2023/features/my_bids/repository/my_bids_repository.dart';

class MyBidsCubit extends Cubit<MyBidsState> {
  MyBidsCubit(super.initialState);

  final _myBidsRepository = MyBidsRepository();

  void resetState() {
    emit(MyBidsInitial());
  }

  Future<void> getMyBids() async {
    emit(MyBidsLoading());
    final MyBidsModal? response = await _myBidsRepository.fetchMyBids();
    if (response == null) {
      emit(MyBidsFailed());
    } else if ((response.data ?? []).isEmpty) {
      emit(MyBidsEmpty());
    } else if (response.status == 'success') {
      emit(MyBidsSuccess(response.data));
    } else {
      emit(MyBidsFailed());
    }
  }
}
