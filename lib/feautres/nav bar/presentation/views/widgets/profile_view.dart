import 'package:ecommerce_app/core/app_colors.dart';
import 'package:ecommerce_app/core/helper/widgets/navigate_to.dart';
import 'package:ecommerce_app/feautres/auth/data/user_model.dart';
import 'package:ecommerce_app/feautres/auth/presentation/mangers/cubit/authentacation_cubit.dart';
import 'package:ecommerce_app/feautres/auth/presentation/views/login_view.dart';
import 'package:ecommerce_app/feautres/nav%20bar/presentation/views/widgets/custom_card_row_button.dart';
import 'package:ecommerce_app/feautres/nav%20bar/presentation/views/widgets/edit_name_view_body.dart';
import 'package:ecommerce_app/feautres/nav%20bar/presentation/views/widgets/my_orders_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthentacationCubit()..GetUserData(),
      child: BlocConsumer<AuthentacationCubit, AuthentacationState>(
        listener: (context, state) {
          if(state is LogOutSuccess){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const LoginView()));
          }
        },
        builder: (context, state) {
          UserDataModel cubit = context.read<AuthentacationCubit>().userDataModel!;
          return state is LogOutLoading || state is GetUserDataLoading ? const Center(child:  CircularProgressIndicator(),) :  Center(
          child: SizedBox(
            height: MediaQuery.of(context).size.height*0.7,
            child: Card(
                    margin:  const EdgeInsets.all(20),
                    color: AppColors.kWhiteColor,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(16)
                      )
                    ),
                    child: Padding(
                      padding:  const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const CircleAvatar(
                            radius: 50,
                            backgroundColor: AppColors.kPrimaryColor,
                            foregroundColor: AppColors.kWhiteColor,
                            child: Icon(Icons.person,size: 50,),
                          ),
                          const SizedBox(height: 10,),
                            Text(cubit.name,style: const TextStyle(
                            fontWeight: FontWeight.bold
                          ),),
                           const SizedBox(height: 10,),
                            Text(cubit.email),
                           const SizedBox(height: 10,),
            
                          CustomCardRowButton(
                            icon: Icons.person,
                            text: 'Edit Name',
                            onTap: (){
                              navigatorTo(context,const EditNameViewBody());
                            },
                          ),
                          const SizedBox(height: 10,),
                           CustomCardRowButton(
                            icon: Icons.shopping_basket,
                            text: 'My Orders',
                            onTap: (){
                              navigatorTo(context, const MyOrdersViewBody());
                            },
                          ),
                          const SizedBox(height: 10,),
                           CustomCardRowButton(
                            icon: Icons.logout,
                            text: 'Logout',
                            onTap: ()async{
                             await context.read<AuthentacationCubit>().signOut();
                            },
                           ),
            
                        ],
                      ),
                    ),
                  ),
          ),
        );
        },
      ),
    );
    
    
    
          
    
  }
}

