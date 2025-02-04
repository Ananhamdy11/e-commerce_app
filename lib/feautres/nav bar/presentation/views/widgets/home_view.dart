
import 'package:ecommerce_app/core/helper/widgets/product_list.dart';
import 'package:ecommerce_app/feautres/nav%20bar/presentation/views/widgets/categories_list_view.dart';
import 'package:ecommerce_app/feautres/nav%20bar/presentation/views/widgets/custom_search_field.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView(
        children: [
          const CustomSearchField(),
          const SizedBox(
            height: 15,
          ),
          Image.asset('assets/images/buy.jpg'),
          const SizedBox(
            height: 15,
          ),
          const Text(
            'Popular Categories',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const CategoriesList(),
          const SizedBox(
            height: 15,
          ),
         const Text(
            'Recently Products ',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 15
          ),
         const ProductList(),
        ],
      ),
    );
  }
}



