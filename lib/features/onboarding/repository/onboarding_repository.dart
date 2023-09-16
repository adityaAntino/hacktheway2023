import 'package:dio/dio.dart';
import 'package:hacktheway2023/config/dio_service.dart';
import 'package:hacktheway2023/features/onboarding/modal/update_user_details.dart';
import 'package:hacktheway2023/router/api_route.dart';

class OnboardingRepository {
  final Dio? dioInstance = DioUtil().getInstance();

  Future<UpdateUserDetails> updateUserDetailRepo({required String name,required String email,required String gender}) async {
    try {
      final apiUrl = ApiRoute.updateUserDetails;
      final response  = await dioInstance?.patch(apiUrl,data: {
        "name":name,
        "gender":gender,
        "email":email
      });
      if(response != null && response.statusCode == 200){
        final Map<String, dynamic> jsonResponse =
        response.data as Map<String, dynamic>;
        return UpdateUserDetails.fromJson(jsonResponse);
      }
      else{
        return UpdateUserDetails(
            code: response?.statusCode,
            message: response?.statusMessage,
            status: 'error');
      }
    } catch (error) {
      return UpdateUserDetails(
          code: 500, message: error.toString(), status: 'error');
    }
  }
}
