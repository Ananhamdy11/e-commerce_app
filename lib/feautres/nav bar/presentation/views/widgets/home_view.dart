import 'package:ecommerce_app/core/app_colors.dart';
import 'package:ecommerce_app/feautres/nav%20bar/presentation/views/widgets/custom_search_field.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(10.0),
      child:  ListView(
        children:[
         const CustomSearchField(),
          const SizedBox(height: 20,),
           Image.asset('assets/images/buy.jpg'),
           
        ],
      ),
    );
  }
}
