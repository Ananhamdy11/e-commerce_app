import 'package:ecommerce_app/core/app_colors.dart';
import 'package:ecommerce_app/feautres/auth/presentation/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class ForgetPasswordViewBody extends StatelessWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Column(
        children: [
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            child: const Text('Enter Your Email to Reset Password',
            
            style: TextStyle(
              
              fontSize: 24,
              fontWeight: FontWeight.bold
            ),),
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
            child: Column(
              children: [
               const Padding(
                  padding:  EdgeInsets.all(16.0),
                  child:  CustomTextField(label:'Email' ,keyboardType: TextInputType.emailAddress,),
                    
                          ),
                           ElevatedButton(onPressed:(){},
             style: ElevatedButton.styleFrom(
               backgroundColor: AppColors.kPrimaryColor,
               shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(16)
               )
             ),
              child: const Text('Send',style: TextStyle(
                color: AppColors.kWhiteColor
              ),),
              ),
              const SizedBox(height: 20,)
             
              ],
            ),
           
          ),
        ]
    ));
  }
}