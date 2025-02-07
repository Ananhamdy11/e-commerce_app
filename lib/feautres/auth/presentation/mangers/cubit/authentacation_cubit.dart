import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'authentacation_state.dart';

class AuthentacationCubit extends Cubit<AuthentacationState> {
  AuthentacationCubit() : super(AuthentacationInitial());
  final supabase = Supabase.instance.client;
  
  Future<void>login({required String email, required String password}) async{
    emit(LoginLoading());
    try {
      await supabase.auth.signInWithPassword(password: password, email: email);
      emit(LoginSuccess());
    } on AuthApiException catch (e) {
      print(e.toString());
      emit(LoginFailure(e.message));
      
    }catch (e){
      emit(LoginFailure(e.toString()));
    }

  }



}
