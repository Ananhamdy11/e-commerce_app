import 'package:ecommerce_app/core/app_colors.dart';
import 'package:ecommerce_app/feautres/auth/data/user_model.dart';
import 'package:ecommerce_app/feautres/nav%20bar/presentation/manager/cubit/nav_bar_cubit.dart';
import 'package:ecommerce_app/feautres/nav%20bar/presentation/views/widgets/favorite_view.dart';
import 'package:ecommerce_app/feautres/nav%20bar/presentation/views/widgets/home_view.dart';
import 'package:ecommerce_app/feautres/nav%20bar/presentation/views/widgets/profile_view.dart';
import 'package:ecommerce_app/feautres/nav%20bar/presentation/views/widgets/store_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MainHomeView extends StatefulWidget {
   const MainHomeView({super.key, required this.userDataModel});
  final UserDataModel userDataModel;

  @override
  State<MainHomeView> createState() => _MainHomeViewState();
}


class _MainHomeViewState extends State<MainHomeView> {
  late List<Widget> views;
  @override
  void initState(){
    super.initState();
 views =  [
    HomeView(userDataModel: widget.userDataModel,),
    const StoreView(),
    const FavoriteView(),
    const ProfileView(),
  ];
  }
  

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavBarCubit(),
      child: BlocBuilder<NavBarCubit, NavBarState>(
        builder: (context, state) {
          NavBarCubit cubit = context.read<NavBarCubit>();
          return Scaffold(
              body: views[cubit.currentIndex],
              bottomNavigationBar: Container(
                decoration: const BoxDecoration(color: AppColors.kWhiteColor),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  child: GNav(
                    onTabChange: cubit.changeIndex,
                    rippleColor: AppColors.kPrimaryColor,
                    hoverColor: AppColors.kPrimaryColor,
                    curve: Curves.easeOutExpo,
                    gap: 1,
                    activeColor: AppColors.kWhiteColor,
                    iconSize: 20,
                    tabBackgroundColor: AppColors.kPrimaryColor,
                    color: Colors.grey,
                    tabs: const [
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
        },
      ),
    );
  }
}
