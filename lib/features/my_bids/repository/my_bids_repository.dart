import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:hacktheway2023/config/dio_service.dart';
import 'package:hacktheway2023/features/my_bids/modals/my_bids_modal.dart';
import 'package:hacktheway2023/router/api_route.dart';

class MyBidsRepository {
  final Dio? dioInstance = DioUtil().getInstance();

  Future<MyBidsModal?> fetchMyBids() async {
    try {
      final apiUrl = ApiRoute.userBids;
      final response = await dioInstance?.get(apiUrl);
      final Map<String, dynamic> jsonResponse =
          await response?.data as Map<String, dynamic>;
      log('buy_products Response -  ${jsonResponse.toString()}');

      if (response == null) {
        return null;
      } else if (response.statusCode == 200) {
        return MyBidsModal.fromJson(jsonResponse);
      } else {
        return null;
      }
    } catch (error) {
      log('Get All Auctions Repo Error- ${error.toString()}');
      return null;
    }
  }
}
