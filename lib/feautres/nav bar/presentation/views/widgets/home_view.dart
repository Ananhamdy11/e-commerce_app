import 'package:ecommerce_app/core/app_colors.dart';
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
              borderRadius: BorderRadius.circular(10),
            ),
            child:  Column(
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
                         width:70,
                        height: 35,
                        decoration: const BoxDecoration(
                          color: AppColors.kPrimaryColor,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(16),
                            bottomRight: Radius.circular(16),
                          )
                        ),
                        child: const Text(
                          "10% off",
                        style: TextStyle(
                          color: AppColors.kWhiteColor,
                          
                        ),
                        ),

                    ),),
                  
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
