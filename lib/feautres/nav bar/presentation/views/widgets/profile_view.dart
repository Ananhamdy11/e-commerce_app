import 'package:ecommerce_app/core/app_colors.dart';
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

class CustomCardRowButton extends StatelessWidget {
  const CustomCardRowButton({
    super.key, this.onTap, required this.icon, required this.text,
  });
final void Function()? onTap;
final IconData icon;
final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        color: AppColors.kPrimaryColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12)
          )
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(icon,color: AppColors.kWhiteColor,),
              Text(text,style: const TextStyle(
                color: AppColors.kWhiteColor,
                fontWeight: FontWeight.bold
              ),),
             const Icon(Icons.arrow_forward_ios,color: AppColors.kWhiteColor,),
          
            ],
          ),
        ),
      ),
    );
  }
}