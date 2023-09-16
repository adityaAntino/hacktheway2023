abstract class AuthenticationState{}

class AuthInitial extends AuthenticationState{}


///-----LOGIN
class AuthLoading extends AuthenticationState{}

class AuthSuccess extends AuthenticationState{}

class AuthError extends AuthenticationState{}

////----------OTP

class OtpSuccess extends AuthenticationState{}

class OtpFailed extends AuthenticationState{}