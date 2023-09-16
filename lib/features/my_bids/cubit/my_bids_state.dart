import 'package:hacktheway2023/features/my_bids/modals/my_bids_modal.dart'
    as MyBidsModal;

abstract class MyBidsState {}

class MyBidsInitial extends MyBidsState {}

class MyBidsLoading extends MyBidsState {}

class MyBidsEmpty extends MyBidsState {}

class MyBidsFailed extends MyBidsState {}

class MyBidsSuccess extends MyBidsState {
  List<MyBidsModal.Datum>? myBids;
  MyBidsSuccess(this.myBids);
}
