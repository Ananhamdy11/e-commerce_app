import 'package:ecommerce_app/feautres/nav%20bar/presentation/views/widgets/product_card.dart';
import 'package:flutter/material.dart';

class ProductList extends StatelessWidget {
  const ProductList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return const CardProuduct();
      },
    );
  }
}