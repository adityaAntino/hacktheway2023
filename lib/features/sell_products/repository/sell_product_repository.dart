import 'package:dio/dio.dart';
import 'package:hacktheway2023/config/dio_service.dart';
import 'package:hacktheway2023/features/buy_products/modals/get_all_auctions_modal.dart';
import 'package:hacktheway2023/features/sell_products/modal/auction_start_response_modal.dart';
import 'package:hacktheway2023/features/sell_products/modal/close_auction_modal.dart';
import 'package:hacktheway2023/features/sell_products/modal/get_auctions_modal.dart';
import 'package:hacktheway2023/features/sell_products/modal/get_bid_count.dart';
import 'package:hacktheway2023/router/api_route.dart';

class SellProductRepository {
  final Dio? dioInstance = DioUtil().getInstance();

  Future<GetAuctionsModal> getAuctionsRepo() async {
    try {
      final apiUrl = ApiRoute.getCreatedAuction;
      final response = await dioInstance?.get(apiUrl);
      if (response != null && response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse =
            response.data as Map<String, dynamic>;
        return GetAuctionsModal.fromJson(jsonResponse);
      } else {
        return GetAuctionsModal(
            code: response?.statusCode,
            message: response?.statusMessage,
            status: 'error');
      }
    } catch (error) {
      return GetAuctionsModal(
          code: 500, message: error.toString(), status: 'error');
    }
  }

  Future<GetBidCountModal> getBidCountRepo({required String auctionId}) async {
    try {
      final apiUrl = ApiRoute.getBidCount;
      final response = await dioInstance?.get('$apiUrl/$auctionId/bid-count');
      if (response != null && response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse =
            response.data as Map<String, dynamic>;
        return GetBidCountModal.fromJson(jsonResponse);
      } else {
        return GetBidCountModal(
            code: response?.statusCode,
            message: response?.statusMessage,
            status: 'error');
      }
    } catch (error) {
      return GetBidCountModal(
          code: 500, message: error.toString(), status: 'error');
    }
  }

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

  Future<CloseAuctionModal> closeAuctionRepo({required String auctionId}) async {
    try {
      final apiUrl = ApiRoute.closeAuction;
      final response =
          await dioInstance?.post('$apiUrl/$auctionId/close');
      if (response != null && response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse =
            response.data as Map<String, dynamic>;
        return CloseAuctionModal.fromJson(jsonResponse);
      }else{
        return CloseAuctionModal(
            code: response?.statusCode,
            message: response?.statusMessage,
            status: 'error');
      }

    } catch (error) {
      return CloseAuctionModal(
          code: 500, message: error.toString(), status: 'error');
    }
  }
}
