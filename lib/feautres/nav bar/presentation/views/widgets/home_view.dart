import 'package:ecommerce_app/core/helper/widgets/navigate_to.dart';
import 'package:ecommerce_app/core/helper/widgets/product_list.dart';
import 'package:ecommerce_app/feautres/nav%20bar/presentation/views/search_view.dart';
import 'package:ecommerce_app/feautres/nav%20bar/presentation/views/widgets/categories_list_view.dart';
import 'package:ecommerce_app/feautres/nav%20bar/presentation/views/widgets/custom_search_field.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView(
        children: [
          const SizedBox(height: 20),
            CustomSearchField(
              searchController: searchController,
            onPressed: (){
              if (searchController.text.isNotEmpty) {
                 navigatorTo
                 (context, 
                  SearchView(
              query:searchController.text ,
            )) ;
            searchController.clear();
                
              }
            }
           ),
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
          const SizedBox(height: 15),
          const ProductList(),
        ],
      ),
    );
  }
  @override
  void dispose(){
    searchController.dispose();
    super.dispose();
  }
}
