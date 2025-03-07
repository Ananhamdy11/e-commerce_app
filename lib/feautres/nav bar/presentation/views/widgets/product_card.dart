import 'dart:developer';

import 'package:ecommerce_app/core/app_colors.dart';
import 'package:ecommerce_app/core/helper/product_model/product_model.dart';
import 'package:ecommerce_app/core/helper/widgets/cached_image.dart';
import 'package:ecommerce_app/core/helper/widgets/custom_evb.dart';
import 'package:ecommerce_app/feautres/product_details/presentation/views/product_details_view.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/core/helper/widgets/navigate_to.dart';
import 'package:pay_with_paymob/pay_with_paymob.dart';

class CardProuduct extends StatelessWidget {
  const CardProuduct({
    super.key,
    required this.product,
    this.onTap, 
    required this.isFavorite, required this.onpaymentSuccess,
  });
  final ProductModel product;
  final Function()? onTap;
  final VoidCallback onpaymentSuccess;
  final bool isFavorite;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigatorTo(
            context,
            ProductDetailsView(
              productModel: product,
            ));
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(16),
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                  child: CachednetworkImage(
                    url: product.imageUrl ??
                        'https://img.freepik.com/premium-psd/isolated-smart-tv-monitor-home-office-entertainment_92267-199.jpg?w=996',
                  ),
                  // Image(
                  //   image: NetworkImage(
                  //       'https://img.freepik.com/premium-psd/isolated-smart-tv-monitor-home-office-entertainment_92267-199.jpg?w=996'),
                  // ),
                ),
                Positioned(
                  child: Container(
                    alignment: Alignment.center,
                    width: 70,
                    height: 35,
                    decoration: const BoxDecoration(
                        color: AppColors.kPrimaryColor,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(16),
                          bottomRight: Radius.circular(16),
                        )),
                    child: Text(
                      "${product.sale}off",
                      style: const TextStyle(
                        color: AppColors.kWhiteColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        product.productName ?? 'product name ',
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        onPressed:onTap,
                        icon:  const Icon(Icons.favorite),
                        color: isFavorite? Colors.red : AppColors.kGreyColor,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            "${product.price}LE",
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "${product.oldPrice}LE",
                            style: const TextStyle(
                                decoration: TextDecoration.lineThrough,
                                fontWeight: FontWeight.bold,
                                color: AppColors.kGreyColor),
                          ),
                        ],
                      ),
                      CustomEVB(
                        onTap: () {
                          Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => PaymentView(
      onPaymentSuccess: onpaymentSuccess,
      onPaymentError: () {
         log("payment failure");
        // Handle payment failure
      },
      price: double.parse(product.price!) // Required: Total price (e.g., 100 for 100 EGP)
    ),
  ),
);
                        },
                        widget: const Text(
                          'Buy Now',
                          style: TextStyle(color: AppColors.kWhiteColor),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
