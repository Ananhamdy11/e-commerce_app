import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/helper/api_services.dart';
import 'package:ecommerce_app/feautres/product_details/data/rate_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit() : super(ProductDetailsInitial());

final ApiServices _apiServices =ApiServices();

List<RateModel> rates =[];
int averageRate=0;

Future<void> getRates({required String productId})async{
  emit(GetRateLoading());
  try {
    Response response =await _apiServices.getData("rates_table?select=*&for_product=eq.$productId");
    for (var rate in response.data) {
      rates.add(RateModel.fromJson(rate));
      
    }
    emit(GetRateSuccess());
  } catch (e) {
    log(e.toString());
    emit(GetRateErorr());
    
  }
}


}




