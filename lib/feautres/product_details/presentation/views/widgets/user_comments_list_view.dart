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
          return const Center(
            child: CircularProgressIndicator(),
          );
        }else if (!snapshot.hasData){
          return const Center(
            child: Text("No Comments Yet"),
          );

        }else if(snapshot.hasData){
                      return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            key: ValueKey(index),
            title: const Text('User Name'),
            subtitle: const Text('Comment'),
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
