import 'dart:developer';

import 'package:ecommerce_app/core/helper/api_services.dart';
import 'package:ecommerce_app/core/helper/product_model/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'nav_bar_state.dart';

class NavBarCubit extends Cubit<NavBarState> {
  NavBarCubit() : super(NavBarInitial());

  int currentIndex = 0;
  void changeIndex(int index) {
    currentIndex = index;
    emit(IndexChange());
  }

  ApiServices apiServices = ApiServices();
  List<ProductModel> products = [];
  List<ProductModel> searchResults=[];
  List<ProductModel> categoryProducts=[];
  final String userId = Supabase.instance.client.auth.currentUser!.id;

  Future<void> getproducts({ String? query, String? category }) async {
    emit(GetDataLoading());
    try {
      var response = await apiServices.getData(
          'product_table?select=*,favorite_products(*),purchase_table(*)');
      log("API Response: ${response.data}"); // Log the response data
      for (var product in response.data) {
        products.add(ProductModel.fromJson(product));
      }
      search(query);
      getProductsByCategory(category);
      log(response.toString());
      emit(GetDataSuccess());
    } catch (e) {
      log(e.toString());
      emit(GetDataError());
    }
  }

  void search( String? query ){
    if (query != null) {
      for (var product in products) {
        if (product.productName!.toLowerCase().contains(query.toLowerCase())) {
          searchResults.add(product);
        }
        
      }
    }


  }

  void getProductsByCategory( String? category ){
    if (category != null) {
      for (var product in products) {
        if (product.category!.trim().toLowerCase()== category.trim().toLowerCase()) {
          categoryProducts.add(product);
        }
        
      }
    }


  }

  Future <void> addToFavorite( String productId )async{
    emit(GetFavoriteLoading());
    try {
     await apiServices.postData("favorite_products", {
      "is_favorite": false,
      "for_user": userId,
      "for_product": productId
      });
      emit(GetFavoriteSuccess());
    } catch (e) {
      log(e.toString());
      emit(GetFavoriteError());
    }

  }




}
