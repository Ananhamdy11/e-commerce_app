import 'package:ecommerce_app/core/app_colors.dart';
import 'package:ecommerce_app/feautres/nav%20bar/presentation/views/widgets/custom_card_row_button.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: MediaQuery.of(context).size.height*0.7,
        child: Card(
                margin:  const EdgeInsets.all(20),
                color: AppColors.kWhiteColor,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16)
                  )
                ),
                child: Padding(
                  padding:  const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CircleAvatar(
                        radius: 50,
                        backgroundColor: AppColors.kPrimaryColor,
                        foregroundColor: AppColors.kWhiteColor,
                        child: Icon(Icons.person,size: 50,),
                      ),
                      const SizedBox(height: 10,),
                       const Text('User Name',style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),),
                       const SizedBox(height: 10,),
                       const Text('Your Email'),
                       const SizedBox(height: 10,),
        
                      CustomCardRowButton(
                        icon: Icons.person,
                        text: 'Edit Name',
                        onTap: (){},
                      ),
                      const SizedBox(height: 10,),
                       CustomCardRowButton(
                        icon: Icons.shopping_basket,
                        text: 'My Orders',
                        onTap: (){},
                      ),
                      const SizedBox(height: 10,),
                       CustomCardRowButton(
                        icon: Icons.logout,
                        text: 'Logout',
                        onTap: (){},
                       ),
        
                    ],
                  ),
                ),
              ),
      ),
    );
          
    
  }
}

