import 'package:ecommerce_app/core/app_colors.dart';
import 'package:flutter/material.dart';

class CustomRowButton extends StatelessWidget {
  const CustomRowButton({
    super.key, required this.text, this.onTap,

  });
final String text;
final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
     mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             Text(text,
             style:const TextStyle(
               fontSize: 20,
               fontWeight: FontWeight.bold,
               color: AppColors.kBlackColor,
    
             ),),
             ElevatedButton(onPressed:onTap,
             style: ElevatedButton.styleFrom(
               backgroundColor: AppColors.kPrimaryColor,
               shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(16)
               )
             ),
              child: const Icon(Icons.arrow_forward,color: AppColors.kWhiteColor,),
              )
             
           ],
         );
  }
}
