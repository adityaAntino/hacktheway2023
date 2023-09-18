import 'package:hacktheway2023/features/onboarding/modal/get_user_modal.dart';

abstract class ProfileState{}

class ProfileInitial extends ProfileState{}


///==============GET USER DETAILS==============///

class GetUserDetailsLoading extends ProfileState{}

class GetUserDetailsSuccess extends ProfileState{
  GetUserDetails getUserDetails;
  GetUserDetailsSuccess({required this.getUserDetails});
}

class GetUserDetailsError extends ProfileState{}
