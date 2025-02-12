import 'dart:developer';

import 'package:ecommerce_app/core/app_colors.dart';
import 'package:ecommerce_app/core/helper/widgets/show_msg.dart';
import 'package:ecommerce_app/feautres/auth/presentation/mangers/cubit/authentacation_cubit.dart';
import 'package:ecommerce_app/feautres/auth/presentation/views/widgets/custom_row_button.dart';
import 'package:ecommerce_app/feautres/auth/presentation/views/widgets/custom_text_button.dart';
import 'package:ecommerce_app/feautres/auth/presentation/views/widgets/custom_text_field.dart';
import 'package:ecommerce_app/feautres/nav%20bar/presentation/views/main_home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  bool _isPasswordObscured = true;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthentacationCubit, AuthentacationState>(
        listener: (context, state) {
      if (state is SignUpSuccess || state is GoogleSignInSuccess) {
        showMsg(context, 'SignUp Success');
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const MainHomeView()));
      }
      if (state is SignUpFailure) {
        log(state.message);
        showMsg(context, state.message);
      }
    }, builder: (context, state) {
      AuthentacationCubit cubit = context.read<AuthentacationCubit>();
      if (state is SignUpLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: _formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  const Text(
                    'Welcome to our market ',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Card(
                    margin: const EdgeInsets.all(20),
                    color: AppColors.kWhiteColor,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        spacing: 20,
                        children: [
                          CustomTextField(
                            label: 'Name',
                            keyboardType: TextInputType.text,
                            controller: nameController,
                          ),
                          CustomTextField(
                            label: 'Email',
                            keyboardType: TextInputType.emailAddress,
                            controller: emailController,
                          ),
                          CustomTextField(
                            label: 'Password',
                            controller: passwordController,
                            obscureText: _isPasswordObscured,
                            suffixIcon: IconButton(
                              icon: Icon(_isPasswordObscured
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                              onPressed: () {
                                setState(() {
                                  _isPasswordObscured = !_isPasswordObscured;
                                });
                              },
                            ),
                            keyboardType: TextInputType.visiblePassword,
                          ),
                          CustomRowButton(
                            text: 'SignUp',
                            onTap: () {
                              if (_formkey.currentState!.validate()) {
                                cubit.signup(
                                    name: nameController.text,
                                    email: emailController.text,
                                    password: passwordController.text);
                              }
                            },
                          ),
                          CustomRowButton(
                            text: 'SignUp With Google ',
                            onTap: () {
                              cubit.googleSignIn();
                            },
                          ),
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
                              CustomTextButton(
                                text: 'Login',
                                onTap: () {
                                  Navigator.pop(context);
                                },
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
