import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:hacktheway2023/config/dio_service.dart';
import 'package:hacktheway2023/features/authentication/modal/send_otp_response_modal.dart';
import 'package:hacktheway2023/router/api_route.dart';

class AuthenticationRepo {
  final Dio? dioInstance = DioUtil().getInstance();

  Future<SendOtpResponse> sendOtpRepo({required String phoneNumber}) async {
    try {
      final String apiUrl = ApiRoute.sendOtp;
      final response =
          await dioInstance?.post(apiUrl, data: {"mobileNo": phoneNumber});
      if (response?.statusCode == 200 && response != null) {
        final Map<String, dynamic> jsonResponse =
            response.data as Map<String, dynamic>;
        return SendOtpResponse.fromJson(jsonResponse);
      } else {
        return SendOtpResponse(
            code: response?.statusCode,
            message: response?.statusMessage,
            status: 'error');
      }
    } catch (error) {
      return SendOtpResponse(
          code: 500, message: error.toString(), status: 'error');
    }
  }
}
