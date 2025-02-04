import 'package:ecommerce_app/core/app_colors.dart';
import 'package:flutter/material.dart';

AppBar buildCustomAppBar(BuildContext context,String title) {
    return AppBar(
      centerTitle: true,
     title:  Text(title,style: const TextStyle(color: AppColors.kWhiteColor),),
      backgroundColor: AppColors.kPrimaryColor,
      leading :IconButton(
        icon: const Icon(Icons.arrow_back_ios,color:AppColors.kWhiteColor ,),
        onPressed: (){
          Navigator.pop(context);
        },
      ),
    );
  }
