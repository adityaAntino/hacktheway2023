import 'package:hacktheway2023/features/authentication/modal/verify_otp_response_modal.dart';

abstract class AuthenticationState{}

class AuthInitial extends AuthenticationState{}


///-----LOGIN
class AuthLoading extends AuthenticationState{}

class AuthSuccess extends AuthenticationState{
}

class AuthError extends AuthenticationState{}

////----------OTP

class OtpSuccess extends AuthenticationState{
  VerifyOtpResponse verifyOtpResponse;
  OtpSuccess({required this.verifyOtpResponse});
}

class OtpFailed extends AuthenticationState{}