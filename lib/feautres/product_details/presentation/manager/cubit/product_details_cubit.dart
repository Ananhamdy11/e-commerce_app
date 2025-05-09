import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/helper/api_services.dart';
import 'package:ecommerce_app/feautres/product_details/data/rate_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit() : super(ProductDetailsInitial());

final ApiServices _apiServices =ApiServices();
String userId = Supabase.instance.client.auth.currentUser!.id;

List<RateModel> rates =[];
int averageRate=0;
int userRate=5;
final supabase = Supabase.instance.client;

Future<void> getRates({required String productId})async{
  emit(GetRateLoading());
  try {
    Response response =await _apiServices.getData("rates_table?select=*&for_product=eq.$productId");
    for (var rate in response.data) {
      rates.add(RateModel.fromJson(rate)); 
    }
    _getAverageRate();
    _getUserRate();
        // log(rates.length.toString());
    emit(GetRateSuccess());
  } catch (e) {
    log(e.toString());
    emit(GetRateErorr());
    
  }
}

void _getUserRate() {
   List<RateModel> userRates = rates.where((rate){
     return rate.forUser == userId;
   } ).toList();
  if (userRates.isNotEmpty) {
    userRate= userRates[0].rate!;
  }
  log("userRate $userRate");
}

void _getAverageRate() {
   for (var userRate in rates) {
    // ignore: unrelated_type_equality_checks
  averageRate += userRate.rate!;
  }
      if (rates.isNotEmpty) {
  averageRate = (averageRate/rates.length).toInt();
}
 }
 bool _isUserRateExist({ required String productId }){
  for (var userrate in rates) {
    if (userrate.forUser==userId && userrate.forProduct==productId) {
      return true;
    }
    
  }
  return false;
 }

 Future<void> addOrUpdateUserRate ({required String productId, required Map<String,dynamic> data })async{
  String path="rates_table?select=*&for_user=eq.$userId&for_product=eq.$productId";
  emit(AddOrUpdateRateLoading());
  try {
  if (_isUserRateExist( productId: productId)){
   await _apiServices.patchData(
    path,
    data);
  }else{
    _apiServices.postData(path, data);
  
  }
  emit(AddOrUpdateRateSuccess());
}  catch (e) {
  log(e.toString());
  emit(AddOrUpdateRateFailure());
}
 }
Future<void> addComments({required Map<String,dynamic> data })async{
  emit(AddCommentsLoading());
  try {
    await _apiServices.postData("comments_table", data);
    emit(AddCommentsSuccess());
  } catch (e) {
    log(e.toString());
    emit(AddCommentsFailure());
    
  }

}

}




