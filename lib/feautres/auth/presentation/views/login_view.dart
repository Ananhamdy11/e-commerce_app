import 'package:ecommerce_app/feautres/auth/presentation/views/widgets/login_view_body.dart';
import 'package:flutter/material.dart';

class AuthView extends StatefulWidget {
  const AuthView({super.key});

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:  LoginViewBody(),
    );
  }
}



