import 'package:ecommerce_app/core/app_colors.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return     const  Card(
            margin:  EdgeInsets.all(20),
            color: AppColors.kWhiteColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(16)
              )
            ),
            child: Padding(
              padding:  EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: AppColors.kPrimaryColor,
                    foregroundColor: AppColors.kWhiteColor,
                    child: Icon(Icons.person,size: 50,),
                  ),
                   Text('User Name',style: TextStyle(
                    fontWeight: FontWeight.bold
                  ),),
                   SizedBox(height: 10,),
                   Text('Your Email'),
                   SizedBox(height: 10,),

                  Card(
                    color: AppColors.kPrimaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(16)
                      )
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.person,color: AppColors.kWhiteColor,),
                          Text('Edit Name',style: TextStyle(
                            color: AppColors.kWhiteColor,
                            fontWeight: FontWeight.bold
                          ),),
                         Icon(Icons.arrow_forward_ios,color: AppColors.kWhiteColor,),
                      
                        ],
                      ),
                    ),
                  )
               
                ],
              ),
            ),
          );
          
    
  }
}