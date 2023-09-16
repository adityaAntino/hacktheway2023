import 'package:hacktheway2023/features/authentication/modal/verify_otp_response_modal.dart';
import 'package:hacktheway2023/features/onboarding/modal/get_user_modal.dart';

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

////----------USER DETAILS
class GetUserDetailLoading extends AuthenticationState{}

class GetUserDetailSuccess extends AuthenticationState{
  GetUserDetails getUserDetails;
  GetUserDetailSuccess({required this.getUserDetails});
}

class GetUserDetailError extends AuthenticationState{}
