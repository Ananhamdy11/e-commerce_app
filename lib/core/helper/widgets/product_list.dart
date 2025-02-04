import 'package:ecommerce_app/core/helper/widgets/navigate_to.dart';
import 'package:ecommerce_app/feautres/nav%20bar/presentation/views/widgets/product_card.dart';
import 'package:ecommerce_app/feautres/product_details/presentation/views/product_details_view.dart';
import 'package:flutter/material.dart';

class ProductList extends StatelessWidget {
  const ProductList({
    super.key,  this.shrinkWrap, this.physics,
  });
final bool? shrinkWrap;
final ScrollPhysics? physics;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: shrinkWrap?? true,
      physics: physics?? const NeverScrollableScrollPhysics(),
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return  CardProuduct(onTap:() {
          navigatorTo(context, const ProductDetailsView());
        },);
      },
    );
  }
}