import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:hacktheway2023/config/dio_service.dart';
import 'package:hacktheway2023/features/buy_products/modals/get_all_auctions_modal.dart';
import 'package:hacktheway2023/router/api_route.dart';

class BuyProductsRepository {
  final Dio? dioInstance = DioUtil().getInstance();

  Future<GetAllAuctionsModal?> fetchAuctions() async {
    try {
      final apiUrl = ApiRoute.getAuctions;
      final response = await dioInstance?.get(apiUrl);
      final Map<String, dynamic> jsonResponse =
          await response?.data as Map<String, dynamic>;
      log('buy_products Response -  ${jsonResponse.toString()}');

      if (response == null) {
        return null;
      } else if (response.statusCode == 200) {
        return GetAllAuctionsModal.fromJson(jsonResponse);
      } else {
        return null;
      }
    } catch (error) {
      log('Get All Auctions Repo Error- ${error.toString()}');
      return null;
    }
  }

  Future<void> placeBid({required int amount, required String id}) async {
    final apiUrl = ApiRoute.placeBid;
    try {
      final response = await dioInstance?.post('$apiUrl/id');
      print('place bid respone- ${response.toString()}');
    } catch (e) {
      log('Place Bid Error- ${e.toString()}');
    }
  }
}
