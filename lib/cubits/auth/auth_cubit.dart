import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../services/firebase_auth_services.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState>{

  final FirebaseAuthServices _authServices;
  
  AuthCubit(this._authServices):super(InitialAuthState());
  
  
  
  Future<void> signUp(String email, String password) async {
    try{
      emit(LoadingAuthState());
      User? user = await _authServices.signUpWithEmailAndPassword(email, password);
      if(user != null){
        emit(AuthenticatedState(user));
      }else{
        emit(AuthErrorState("Authenticated Error"));
      }
    }
    catch(e){
      emit(AuthErrorState("Error: $e"));
    }
  }

  void togglePasswordVisibility(){

    if (state is PasswordsVisibleState){
      bool isVisible = !(state as PasswordsVisibleState).isVisible;
      emit(PasswordsVisibleState(isVisible));
    }else{
      emit(PasswordsVisibleState(false));
    }


  }
  
  
  Future<void> signIn(String email, String password) async {
    try{
      emit(LoadingAuthState());
      User? user = await _authServices.signInWithEmailAndPassword(email, password);
      if(user != null){
        emit(AuthenticatedState(user));
      }else{
        emit(AuthErrorState("Error during log in"));
      }
    }catch(e){
      emit(AuthErrorState("Error: $e"));
    }
    
  }
  
}