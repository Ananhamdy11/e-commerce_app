// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:ecommerce_app/core/app_colors.dart';
import 'package:ecommerce_app/core/helper/widgets/custom_evb.dart';
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
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                Stack(
                  children: [
                    const ClipRRect(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(16),
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16),
                      ),
                      child: Image(
                        image: NetworkImage(
                            'https://img.freepik.com/premium-psd/isolated-smart-tv-monitor-home-office-entertainment_92267-199.jpg?w=996'),
                      ),
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
                        child: const Text(
                          "10% off",
                          style: TextStyle(
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
                   const Text(
                      'product name ',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon:const Icon(Icons.favorite),
                      color: AppColors.kGreyColor,
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                       children: [
                         Text(
                          '1000 LE ',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                          ),
                                             ),
                                             Text(
                          '1200 LE ',
                          style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                            fontWeight: FontWeight.bold,
                            color: AppColors.kGreyColor
                          ),
                                             ),

                       ],
                     ),
                     CustomEVB(
                      onTap: () {},
                       widget: const Text(
                        'Buy Now',
                        style: TextStyle(
                          color: AppColors.kWhiteColor
                        ),
                      ),)
                  ],
                ),

              ],
            ),
          ),
              ],
            ),
          ),
          

          
        ],
      ),
    );
  }
}
