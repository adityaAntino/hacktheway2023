import 'package:dio/dio.dart';
import 'package:hacktheway2023/config/dio_service.dart';
import 'package:hacktheway2023/features/sell_products/modal/auction_start_response_modal.dart';
import 'package:hacktheway2023/router/api_route.dart';

class SellProductRepository {
  final Dio? dioInstance = DioUtil().getInstance();

  Future<AuctionStartResponseModal> startAuctionRepo(
      {required String productName,
      required String basePrice,
      required String description,
      required String auctionEndTime}) async {
    try {
      final apiUrl = ApiRoute.startAuction;
      final response = await dioInstance?.post(apiUrl, data: {
        "itemName": productName,
        "initialPrice": basePrice,
        "itemInfo": description,
        "duration": auctionEndTime
      });
      if (response != null && response.statusCode == 201) {
        final Map<String, dynamic> jsonResponse =
            response.data as Map<String, dynamic>;
        return AuctionStartResponseModal.fromJson(jsonResponse);
      } else {
        return AuctionStartResponseModal(
            code: response?.statusCode,
            message: response?.statusMessage,
            status: 'error');
      }
    } catch (error) {
      return AuctionStartResponseModal(
          code: 500, message: error.toString(), status: 'error');
    }
  }
}
