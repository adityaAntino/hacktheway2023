import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacktheway2023/features/authentication/repository/authentication_repo.dart';
import 'package:hacktheway2023/features/onboarding/modal/get_user_modal.dart';
import 'package:hacktheway2023/features/profile/cubit/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState>{
  ProfileCubit(super.initialState);

  final AuthenticationRepo _authenticationRepo = AuthenticationRepo();

  Future<void> getUserDetails() async {
    emit(GetUserDetailsLoading());
    final GetUserDetails getUserDetails =
    await _authenticationRepo.getUserDetailRepo();
    if (getUserDetails.code == 200) {
      emit(GetUserDetailsSuccess(getUserDetails: getUserDetails));
    } else {
      emit(GetUserDetailsError());
    }
  }

}