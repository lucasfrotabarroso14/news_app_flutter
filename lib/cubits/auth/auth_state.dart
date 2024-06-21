import 'package:firebase_auth/firebase_auth.dart';

import '../../models/user_model.dart';

abstract class AuthState{}

class InitialAuthState extends AuthState{}

class LoadingAuthState extends AuthState{}

class AuthenticatedState extends AuthState{
  final UserModel user;

  AuthenticatedState(this.user);

}

class UnauthenticatedState extends AuthState{}

class AuthErrorState extends AuthState{
  final String message;
  AuthErrorState(this.message);
}

class PasswordsVisibleState extends AuthState{
  final bool isVisible;
  PasswordsVisibleState(this.isVisible);
}

class SignUpSuccessState extends AuthState{

}