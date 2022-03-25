import 'package:flutter/rendering.dart';

abstract class AppStates {}
class InitialState extends AppStates{}
class ShowAndHidePassword extends AppStates{}
class RememberMeCheked extends AppStates{}
class UserLoginSuccessState extends AppStates{
  // user id
}
class UserLoginErrorState extends AppStates{
  String?onError;
  UserLoginErrorState(this.onError);
}

class GithubSigninSuccessState extends AppStates{}
class GithubSigninErrorState extends AppStates{
  String? onError;
  GithubSigninErrorState(this.onError);
}

class GoogleSignInSuccessState extends AppStates{}
class GoogleSignInErrorState extends AppStates{
}
class FacebookSignInSuccessState extends AppStates{}
class FacebookSignInErrorState extends AppStates{
  String? onError;
  FacebookSignInErrorState(this.onError);
}
