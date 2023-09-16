import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacktheway2023/features/authentication/cubit/authentication_state.dart';
import 'package:hacktheway2023/features/authentication/modal/send_otp_response_modal.dart';
import 'package:hacktheway2023/features/authentication/repository/authentication_repo.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit(super.initialState);

  final AuthenticationRepo _authenticationRepo = AuthenticationRepo();

  void resetState(){
    emit(AuthInitial());
  }

  Future<void> sendOtp({required String phoneNumber}) async {
    emit(AuthLoading());
    final SendOtpResponse sendOtpResponse =
        await _authenticationRepo.sendOtpRepo(phoneNumber: phoneNumber);
    if (sendOtpResponse.code == 200) {
      emit(AuthSuccess());
    } else {
      emit(AuthError());
    }
  }

  Future<void> verifyOtp({required String phoneNo, required String otp}) async {
    emit(AuthLoading());
    final response =
        await _authenticationRepo.verifyOtpRepo(phoneNo: phoneNo, otp: otp);
    if (true) {
      emit(OtpSuccess());
    } else {
      emit(OtpFailed());
    }
  }
}
