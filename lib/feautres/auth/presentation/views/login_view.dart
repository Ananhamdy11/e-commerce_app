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
            const SizedBox(height: 30,),
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
                
               const CustomTextField(label:'Email' ,keyboardType: TextInputType.emailAddress,),
                 CustomTextField(label: 'Password',
                  suffixIcon:  IconButton(icon:const Icon(Icons.visibility_off),
                 onPressed: (){
                  

                 },),keyboardType: TextInputType.visiblePassword,
                 obscureText: true,),
                
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