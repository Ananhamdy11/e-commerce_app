import 'package:ecommerce_app/core/app_colors.dart';
import 'package:flutter/material.dart';

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