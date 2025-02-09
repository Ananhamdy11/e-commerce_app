import 'dart:math';

import 'package:ecommerce_app/core/app_colors.dart';
import 'package:ecommerce_app/core/helper/widgets/cached_image.dart';
import 'package:ecommerce_app/feautres/auth/presentation/views/widgets/custom_text_field.dart';
import 'package:ecommerce_app/feautres/product_details/presentation/views/widgets/user_comments_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const CachednetworkImage(
            url:
                'https://img.freepik.com/premium-psd/isolated-smart-tv-monitor-home-office-entertainment_92267-199.jpg?w=996'),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text('books'), Text('200\$')],
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text('3 '),
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                      )
                    ],
                  ),
                  Icon(
                    Icons.favorite,
                    color: AppColors.kGreyColor,
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              const Text('Product description'),
              const SizedBox(
                height: 20,
              ),
              RatingBar.builder(
                initialRating: 3,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: false,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  log(rating);
                },
              ),
              const SizedBox(
                height: 20,
              ),
               CustomTextField(
                label: 'Type Your Feedback ',
                keyboardType: TextInputType.multiline,
                suffixIcon: IconButton(onPressed: (){}, icon: const Icon(Icons.send),),
              ),
              const SizedBox(height: 15,),
               const Row(
                children: [
                    Text(
                    'Comments',
                    style: TextStyle(
                      fontSize: 18
                    ),
                    
                  
                  ),
                ],
              ),
                 const UserCommentsListView(),

            ],
          ),
        )
      ],
    );
  }
}


