import 'package:ecommerce_app/core/helper/widgets/product_list.dart';
import 'package:ecommerce_app/feautres/nav%20bar/presentation/views/widgets/custom_search_field.dart';
import 'package:flutter/material.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
     return Padding(
      padding:const EdgeInsets.all(10.0),
      child: ListView(
        children:const [
           Center(
             child: Text('Your Favorite Products ',
                       style:TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold
                       
                       ) ,
                       ),
           ),
           SizedBox(height:20 ,),
          CustomSearchField(),
           SizedBox(height:20 ,),
           ProductList()

        ],
      ),
      );
 
  }
}