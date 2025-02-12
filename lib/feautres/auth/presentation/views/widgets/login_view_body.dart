import 'package:ecommerce_app/core/app_colors.dart';
import 'package:ecommerce_app/core/helper/widgets/navigate_to.dart';
import 'package:ecommerce_app/core/helper/widgets/show_msg.dart';
import 'package:ecommerce_app/feautres/auth/presentation/mangers/cubit/authentacation_cubit.dart';
import 'package:ecommerce_app/feautres/auth/presentation/views/forget_passsword_view.dart';
import 'package:ecommerce_app/feautres/auth/presentation/views/signup_view.dart';
import 'package:ecommerce_app/feautres/auth/presentation/views/widgets/custom_row_button.dart';
import 'package:ecommerce_app/feautres/auth/presentation/views/widgets/custom_text_button.dart';
import 'package:ecommerce_app/feautres/auth/presentation/views/widgets/custom_text_field.dart';
import 'package:ecommerce_app/feautres/nav%20bar/presentation/views/main_home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool _isPasswordObscured = true;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthentacationCubit, AuthentacationState>(
      listener: (context, state) {
        if (state is LoginSuccess || state is GoogleSignInSuccess) {
          showMsg(context, 'Login Success');
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const MainHomeView()));
        }
        if (state is LoginFailure) {
          showMsg(context, state.message);
        }
      },
      builder: (context, state) {
        AuthentacationCubit cubit = context.read<AuthentacationCubit>();
        if (state is LoginLoading) {
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
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
                              label: 'Email',
                              keyboardType: TextInputType.emailAddress,
                              controller: emailController,
                            ),
                            CustomTextField(
                              label: 'Password',
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
                              controller: passwordController,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                CustomTextButton(
                                  text: 'Forget Password ? ',
                                  onTap: () {
                                    navigatorTo(
                                        context, const ForgetPassswordView());
                                  },
                                ),
                              ],
                            ),
                            CustomRowButton(
                              text: 'Login',
                              onTap: () {
                                if (_formkey.currentState!.validate()) {
                                  cubit.login(
                                      email: emailController.text,
                                      password: passwordController.text);
                                }
                              },
                            ),
                            CustomRowButton(
                              text: 'Login With Google ',
                              onTap: () {
                                cubit.googleSignIn();
                              },
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Don't have any account?",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                CustomTextButton(
                                  text: 'Sign Up',
                                  onTap: () {
                                    navigatorTo(context, const SignupView());
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
      },
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
