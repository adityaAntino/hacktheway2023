abstract class CommonWidgetState {}


class CommonWidgetInitial extends CommonWidgetState {}

class ProductTimerLoading extends CommonWidgetState {}

class ProductTimerSuccess extends CommonWidgetState {
  String remainingTime;
  ProductTimerSuccess({required this.remainingTime});
}
