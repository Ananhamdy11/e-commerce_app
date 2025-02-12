import 'package:ecommerce_app/core/app_colors.dart';
import 'package:ecommerce_app/core/helper/widgets/show_msg.dart';
import 'package:ecommerce_app/feautres/auth/presentation/mangers/cubit/authentacation_cubit.dart';
import 'package:ecommerce_app/feautres/auth/presentation/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPasswordViewBody extends StatefulWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  State<ForgetPasswordViewBody> createState() => _ForgetPasswordViewBodyState();
}

class _ForgetPasswordViewBodyState extends State<ForgetPasswordViewBody> {
  final GlobalKey<FormState> _formkey = GlobalKey();

  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthentacationCubit, AuthentacationState>(
      listener: (context, state) {
        if (state is ResetPasswordSuccess) {
          Navigator.pop(context);
          showMsg(context, "Email Sent ");
        }
      },
      builder: (context, state) {
        return state is ResetPasswordLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SafeArea(
                child: Form(
                key: _formkey,
                child: Column(children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Text(
                      'Enter Your Email to Reset Password',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Card(
                    margin: const EdgeInsets.all(20),
                    color: AppColors.kWhiteColor,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: CustomTextField(
                            label: 'Email',
                            keyboardType: TextInputType.emailAddress,
                            controller: emailController,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            context
                                .read<AuthentacationCubit>()
                                .resetPassword(email: emailController.text);
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.kPrimaryColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16))),
                          child: const Text(
                            'Send',
                            style: TextStyle(color: AppColors.kWhiteColor),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  ),
                ]),
              ));
      },
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }
}
