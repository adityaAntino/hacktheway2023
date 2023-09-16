import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacktheway2023/features/sell_products/cubit/sell_products_state.dart';
import 'package:hacktheway2023/features/sell_products/modal/auction_start_response_modal.dart';
import 'package:hacktheway2023/features/sell_products/repository/sell_product_repository.dart';

class SellProductsCubit extends Cubit<SellProductsState>{
  SellProductsCubit(super.initialState);

  final SellProductRepository sellProductRepository = SellProductRepository();

  Future<void> startAuction({required String productName,
    required String basePrice,
    required String description,
    required String auctionEndTime}) async{
    emit(StartAuctionLoading());
    final AuctionStartResponseModal auctionStartResponseModal = await sellProductRepository.startAuctionRepo(productName: productName, basePrice: basePrice, description: description, auctionEndTime: auctionEndTime);
    if(auctionStartResponseModal.code == 201){
      emit(StartAuctionSuccess());
    }else{
      emit(StartAuctionError());
    }
  }
}