import 'package:ecommerce_app/core/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key, required this.label, this.suffixIcon, required this.keyboardType, this.obscureText = false,
  });
final String label;
final Widget? suffixIcon;
final TextInputType keyboardType;
final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value){
                    if(value!.isEmpty ){
                      return 'please enter your password';
                    }
                    return null;
                  },
     keyboardType:keyboardType,
     obscuringCharacter: '*',
     obscureText: obscureText,
     decoration: InputDecoration(
       labelText: label,
       suffixIcon: suffixIcon,
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
