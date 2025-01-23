import 'package:ecommerce_app/core/app_colors.dart';
import 'package:ecommerce_app/feautres/auth/presentation/views/login_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const EcommerceApp());
  
}

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(  
        scaffoldBackgroundColor: AppColors.kScaffoldColor,      
        useMaterial3: true,
      ),
      home:const AuthView()
    );
  }
}

