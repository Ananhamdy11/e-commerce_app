import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
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
      log(e.toString());
      emit(LoginFailure(e.message));
      
    }catch (e){
      emit(LoginFailure(e.toString()));
      log(e.toString());

    }

  }
 
  Future<void>signup({required String name ,required String email, required String password}) async{
    emit(SignUpLoading());
    try {
      await supabase.auth.signUp(password: password, email: email);
      await addUserData(name: name, email: email);
      emit(SignUpSuccess());
    } on AuthApiException catch (e) {
      log(e.toString());
      emit(SignUpFailure(e.message));
      
    }catch (e){
      emit(SignUpFailure(e.toString()));
      log(e.toString());

    }

  }

  GoogleSignInAccount? googleUser;
Future<AuthResponse> googleSignIn() async {
  emit(GoogleSignInLoading());
    const webClientId = '185662925378-60il6jkod2ahdarsuln896513l09r6d1.apps.googleusercontent.com';


    final GoogleSignIn googleSignIn = GoogleSignIn(
      serverClientId: webClientId,
    );
     googleUser = await googleSignIn.signIn();
     if (googleUser == null) {
      return AuthResponse();
     }
    final googleAuth = await googleUser!.authentication;
    final accessToken = googleAuth.accessToken;
    final idToken = googleAuth.idToken;

    if (accessToken == null || idToken == null) {
      emit(GoogleSignInFailure());
      return AuthResponse();      
    }
  
    AuthResponse response =await supabase.auth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: idToken,
      accessToken: accessToken,
    );
    emit(GoogleSignInSuccess());
    return response;
  }

Future<void> signOut() async {
  emit(LogOutLoading());
  try {
    await supabase.auth.signOut();
    emit(LogOutSuccess());
  } catch (e) {
    log(e.toString());
    emit(LogOutFailure());
  }
}

Future<void> resetPassword({required String email}) async{
  emit(ResetPasswordLoading());
  try {
    await supabase.auth.resetPasswordForEmail(email);
    emit(ResetPasswordSuccess());
  } catch (e) {
    log(e.toString());
    emit(ResetPasswordFailure());
  } 
 
}

Future<void> addUserData({required String name, required String email })async{
 emit(AddUserDataLoading());
 try {
   await supabase
    .from('users')
    .insert({
      "id":supabase.auth.currentUser!.id,
      "name": name,
      "email" : email
      });
    emit(AddUserDataSuccess());
 } catch (e) {
  log(e.toString());
  emit(AddUserDataFailure());
   
 }
}


}