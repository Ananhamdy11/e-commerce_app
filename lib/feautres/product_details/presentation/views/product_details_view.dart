import 'package:ecommerce_app/core/helper/build_appbar.dart';
import 'package:ecommerce_app/feautres/product_details/presentation/views/widgets/product_details_view_body.dart';
import 'package:flutter/material.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(context, 'product Name'),
      body: const ProductDetailsViewBody(),
    );
  }
}
