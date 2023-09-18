import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacktheway2023/common/cubit/common_widget_state.dart';
import 'package:intl/intl.dart';

class CommonWidgetCubit extends Cubit<CommonWidgetState> {
  CommonWidgetCubit(super.initialState);

  Timer? countdownTimer;
  String remainingTime = 'Calculating...';

  void calculateAuctionEndTime(String targetDateString) {
    emit(ProductTimerLoading());

    final targetDate = DateFormat('dd/MM/yy HH:mm:ss').parse(targetDateString);

    countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final currentTime = DateTime.now();
      final remaining = targetDate.isAfter(currentTime)
          ? targetDate.difference(currentTime)
          : Duration.zero;

      if (remaining == Duration.zero) {
        timer.cancel();
        remainingTime = 'Countdown reached zero!';
      } else {
        final hours = remaining.inHours;
        final minutes = remaining.inMinutes.remainder(60);
        final seconds = remaining.inSeconds.remainder(60);
        remainingTime =
            '${hours.toString().padLeft(2, '0')} hour ${minutes.toString().padLeft(2, '0')} minute ${seconds.toString().padLeft(2, '0')} second';
      }
      print(remainingTime);
      emit(ProductTimerSuccess(remainingTime: remainingTime));
    });
  }
}
