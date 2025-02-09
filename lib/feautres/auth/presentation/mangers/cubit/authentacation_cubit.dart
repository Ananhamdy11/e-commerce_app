// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

// part 'authentacation_state.dart';

// class AuthentacationCubit extends Cubit<AuthentacationState> {
//   AuthentacationCubit() : super(AuthentacationInitial());
//   final supabase = Supabase.instance.client;

//   Future<void> login({required String email, required String password}) async {
//     emit(LoginLoading());
//     try {
//       // Validate email format
//       if (!_isValidEmail(email)) {
//         emit(LoginFailure("Please enter a valid email address."));
//         return;
//       }

//       // Validate password length
//       if (password.isEmpty || password.length < 6) {
//         emit(LoginFailure("Password must be at least 6 characters long."));
//         return;
//       }

//       // Attempt to sign in
//       await supabase.auth.signInWithPassword(
//         email: email,
//         password: password,
//       );
//       emit(LoginSuccess());
//     } on AuthApiException catch (e) {
//       // Handle Supabase authentication errors
//       String errorMessage = "Login failed. Please check your credentials.";
//       if (e.message.contains("Invalid login credentials")) {
//         errorMessage = "Invalid email or password.";
//       } else if (e.message.contains("Email not confirmed")) {
//         errorMessage = "Please confirm your email before logging in.";
//       }
//       emit(LoginFailure(errorMessage));
//       print("Supabase Auth Error: ${e.message}");
//     } catch (e) {
//       // Handle generic errors
//       emit(LoginFailure("An unexpected error occurred. Please try again."));
//       print("Unexpected Error: $e");
//     }
//   }


//   // Helper method to validate email format
//   bool _isValidEmail(String email) {
//     return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
//   }


//   Future<void> signup({required String name ,required String email, required String password}) async {
//     emit(SignUpLoading());
//     try {
//       // Validate email format
//       if (!_isValidEmail(email)) {
//         emit(SignUpFailure("Please enter a valid email address."));
//         return;
//       }

//       // Validate password length
//       if (password.isEmpty || password.length < 6) {
//         emit(SignUpFailure("Password must be at least 6 characters long."));
//         return;
//       }

//       // Attempt to sign in
//       await supabase.auth.signUp(
//         email: email,
//         password: password,
//       );
//       emit(SignUpSuccess());
//     } on AuthApiException catch (e) {
//       // Handle Supabase authentication errors
//       String errorMessage = "Login failed. Please check your credentials.";
//       if (e.message.contains("Invalid login credentials")) {
//         errorMessage = "Invalid email or password.";
//       } else if (e.message.contains("Email not confirmed")) {
//         errorMessage = "Please confirm your email before logging in.";
//       }
//       emit(SignUpFailure(errorMessage));
//       print("Supabase Auth Error: ${e.message}");
//     } catch (e) {
//       // Handle generic errors
//       emit(SignUpFailure("An unexpected error occurred. Please try again."));
//       print("Unexpected Error: $e");
//     }
//   }

// }



//  import 'dart:math';

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


}