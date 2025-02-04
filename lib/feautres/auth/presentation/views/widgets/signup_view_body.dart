import 'package:ecommerce_app/core/app_colors.dart';
import 'package:ecommerce_app/feautres/auth/presentation/views/widgets/custom_row_button.dart';
import 'package:ecommerce_app/feautres/auth/presentation/views/widgets/custom_text_button.dart';
import 'package:ecommerce_app/feautres/auth/presentation/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
    bool _isPasswordObscured = true;

  @override
  Widget build(BuildContext context) {
   return SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50,),
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
                  const CustomTextField(label: 'Name', keyboardType: TextInputType.text),
                 const CustomTextField(label:'Email' ,keyboardType: TextInputType.emailAddress,),
                   CustomTextField(label: 'Password',
                   obscureText: _isPasswordObscured,
                    suffixIcon:  IconButton(icon :  Icon(_isPasswordObscured ? Icons.visibility_off : Icons.visibility),
                   onPressed: (){
                      setState(() {
                        _isPasswordObscured = !_isPasswordObscured;
                      });
          
                   },),keyboardType: TextInputType.visiblePassword,
                   ),
       
           CustomRowButton(text: 'SignUp',onTap: (){},),
           CustomRowButton(text: 'SignUp With Goagle ',onTap: (){},),
                    Row(
            mainAxisAlignment: MainAxisAlignment.center, 
            children: [
             const Text(
               "Already have an account ? ",
               style: TextStyle(
                 fontWeight: FontWeight.bold,
                 fontSize: 18,
               ),
             ),
              CustomTextButton(text: 'Login',onTap: (){
                Navigator.pop(context);
              },)
            ],
           )
            
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

