import 'package:ecommerce_app/core/helper/build_appbar.dart';
import 'package:ecommerce_app/core/helper/widgets/product_list.dart';
import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(
        context,
         "Search Results "
         ),
         body: ListView(
          children:const [
             SizedBox(height: 20),
            ProductList()
          ],
         ),
    );
  }
}