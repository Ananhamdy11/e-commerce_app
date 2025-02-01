import 'package:ecommerce_app/core/app_colors.dart';
import 'package:ecommerce_app/feautres/nav%20bar/presentation/views/widgets/main_home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MainHomeView extends StatelessWidget {
  const MainHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:const MainHomeViewBody(),
      bottomNavigationBar: Container(
        decoration:const BoxDecoration(
          color: AppColors.kWhiteColor
        ),
        child:const Padding(
          padding: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
          child: GNav(
            rippleColor: AppColors.kPrimaryColor,
            hoverColor: AppColors.kPrimaryColor,
            curve: Curves.easeOutExpo,
            gap: 3,
            activeColor: AppColors.kWhiteColor,
            iconSize: 24,
            tabBackgroundColor: AppColors.kPrimaryColor,
            color: Colors.grey,
            tabs: [
            GButton(
              icon: Icons.home,
              text: 'Home',
            ),
            GButton(
              icon: Icons.store,
              text: 'Store',
            ),
            GButton(
              icon: Icons.favorite,
              text: 'Favorite',
            ),
            GButton(
              icon: Icons.person,
              text: 'Profile',
            ),
          ],
              ),
        ),
      ));
  }
}