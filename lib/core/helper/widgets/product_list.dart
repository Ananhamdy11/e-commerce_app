import 'package:ecommerce_app/core/helper/product_model/product_model.dart';
import 'package:ecommerce_app/feautres/nav%20bar/presentation/manager/cubit/nav_bar_cubit.dart';
import 'package:ecommerce_app/feautres/nav%20bar/presentation/views/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductList extends StatelessWidget {
  const ProductList({
    super.key,
    this.shrinkWrap,
    this.physics, this.query, this.category,
  });
  final String? query;
  final String? category;
  final bool? shrinkWrap;
  final ScrollPhysics? physics;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavBarCubit()..getproducts(query: query,category: category),
      child: BlocConsumer<NavBarCubit, NavBarState>(
          listener: (context, state) {},
          builder: (context, state) {
            NavBarCubit cubit = context.read<NavBarCubit>();
            List<ProductModel> products = query !=null ?
            cubit.searchResults :
            category != null ? cubit.categoryProducts:
             cubit.products;

            return state is GetDataLoading
                ? const CircularProgressIndicator()
                : ListView.builder(
                    shrinkWrap: shrinkWrap ?? true,
                    physics: physics ?? const NeverScrollableScrollPhysics(),
                    itemCount: products.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CardProuduct(
                        product: products[index],
                        onTap: (){
                          bool isFavorite = cubit.checkIsFavorite(products[index].productId!);
                          isFavorite? cubit.removeFavorite(products[index].productId!): cubit.addToFavorite(products[index].productId!);
                        }, isFavorite: cubit.checkIsFavorite(products[index].productId!),
                      );
                    },
                  );
          }),
    );
  }
}
