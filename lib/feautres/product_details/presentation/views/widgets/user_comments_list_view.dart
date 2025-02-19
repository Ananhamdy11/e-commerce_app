import 'dart:developer';

import 'package:ecommerce_app/core/helper/product_model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserCommentsListView extends StatelessWidget {
  const UserCommentsListView({
    super.key,required this.productModel,
  });
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Supabase.instance.client.from("comments_table").stream(primaryKey: ["id"]).eq("for_product",productModel.productId!).order("created_at") ,
      builder:(context,snapshot){
        List<Map<String,dynamic>> ? data = snapshot.data;
        if (snapshot.connectionState == ConnectionState.waiting) {
          log(snapshot.connectionState.toString());
          return const Center(
            child: CircularProgressIndicator(),
          );
        }else if (!snapshot.hasData){
          log(snapshot.error.toString());
          return const Center(
            child: Text( "No Comments Yet",style: TextStyle(
              color: Colors.black
            ),),
          );

        }else if(snapshot.hasData){
          log(snapshot.connectionState.toString());
                      return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: data?.length??0,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            key: ValueKey(index),
            title:  Text(
             data?[index]["user_name"]??"User Name"
              ),
            subtitle:  Text(
              data?[index]["comment"]?? "Comment"
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider();
        },
      );
   
        }else{
          return const Center(
            child: Text("Error"),
          );
        }
      }

    );
  }
}
