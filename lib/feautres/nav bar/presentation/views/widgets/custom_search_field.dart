import 'package:ecommerce_app/core/app_colors.dart';
import 'package:flutter/material.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({super.key, 
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value){
                    if(value!.isEmpty ){
                      return 'please enter your password';
                    }
                    return null;
                  },
     keyboardType:TextInputType.text,
     obscuringCharacter: '*',
     decoration: InputDecoration(
       label:const Text( 'Search in Market....') ,
           suffixIcon: ElevatedButton.icon(
            
           label:const Icon(Icons.search,color: AppColors.kWhiteColor,) ,
           onPressed: (){},
           style: ButtonStyle(
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
            backgroundColor: WidgetStateProperty.all(AppColors.kPrimaryColor),
                      ),
          ),
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
                
                    );
  }
}