import 'package:ecommerce_app/core/app_colors.dart';
import 'package:flutter/material.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
       const Text('Welcome to our market ',
        style:TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold

        ) ,
        ),
       const SizedBox(height: 20,),
        Card(
          margin: const EdgeInsets.all(20),
          color: AppColors.kWhiteColor,
          shape:const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(16)
            )
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              spacing: 20,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        width: 2,
                        color: AppColors.kBordersideColor
                      )
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide:const BorderSide(
                        color: AppColors.kBordersideColor
                      )
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        color: AppColors.kBordersideColor
                      )
                    ),
                  ),
            
                ),
                
                 TextFormField(
                  decoration: InputDecoration(
                    labelText: 'password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        width: 2,
                        color: AppColors.kBordersideColor
                      )
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide:const BorderSide(
                        color: AppColors.kBordersideColor
                      )
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        color: AppColors.kBordersideColor
                      )
                    ),
                  ),
            
                ),
                
              ],
            ),
          ),
        )

             ],
        ),
      )
      
    );
  }
}