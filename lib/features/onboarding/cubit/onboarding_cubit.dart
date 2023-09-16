import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacktheway2023/features/onboarding/cubit/onboarding_state.dart';
import 'package:hacktheway2023/features/onboarding/modal/update_user_details.dart';
import 'package:hacktheway2023/features/onboarding/repository/onboarding_repository.dart';

class OnboardingCubit extends Cubit<OnboardingState>{
  OnboardingCubit(super.initialState);

  final OnboardingRepository _onboardingRepository = OnboardingRepository();

  Future<void> updateUserDetail({required String name,required String email,required String gender}) async{
    emit(OnboardingLoading());
    final UpdateUserDetails updateUserDetails = await _onboardingRepository.updateUserDetailRepo(name: name, email: email, gender: gender);
    if(updateUserDetails.data == null){
      emit(OnboardingError());
    }else if(updateUserDetails.code == 200){
      emit(OnboardingSuccess());
    }else{
      emit(OnboardingError());
    }
  }

}