import 'package:ecommerce_app/core/app_colors.dart';
import 'package:ecommerce_app/core/helper/my_observer.dart';
import 'package:ecommerce_app/core/sensitive_data.dart';
import 'package:ecommerce_app/feautres/auth/presentation/mangers/cubit/authentacation_cubit.dart';
import 'package:ecommerce_app/feautres/auth/presentation/views/login_view.dart';
import 'package:ecommerce_app/feautres/nav%20bar/presentation/views/main_home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: "https://bszoqyenpznebcmhnmge.supabase.co",
    anonKey: anonKey,
  );
  Bloc.observer = MyObserver();
  runApp(const EcommerceApp());
}

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final supabase = Supabase.instance.client;
    return BlocProvider(
      create: (context) => AuthentacationCubit(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            scaffoldBackgroundColor: AppColors.kScaffoldColor,
            useMaterial3: true,
          ),
          home:
               supabase.auth.currentUser !=null? const MainHomeView():
              const LoginView()),
    );
  }
}
