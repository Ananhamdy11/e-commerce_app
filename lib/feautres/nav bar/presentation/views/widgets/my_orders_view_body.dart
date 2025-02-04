import 'package:ecommerce_app/core/helper/build_appbar.dart';
import 'package:ecommerce_app/core/helper/widgets/product_list.dart';
import 'package:flutter/material.dart';

class MyOrdersViewBody extends StatelessWidget {
  const MyOrdersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold
    (
      appBar: buildCustomAppBar(context, 'My Orders'),
      body:  const Padding(
        padding:  EdgeInsets.all(8.0),
        child: ProductList(shrinkWrap: false,physics: BouncingScrollPhysics(),),
      ),
    );
  }
}