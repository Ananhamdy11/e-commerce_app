import 'package:ecommerce_app/feautres/auth/presentation/views/auth_view.dart';
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:const AuthView()
    );
  }
}

