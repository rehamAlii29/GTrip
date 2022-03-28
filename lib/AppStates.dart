import 'package:flutter/rendering.dart';

abstract class AppStates {}
class InitialState extends AppStates{}
//Slpash Screen States
class DrobDwonButtonState extends AppStates{}


// bottom navigation bar
class BottomNavBarChangingSuccess extends AppStates{}
class BottomNavBarChangingError extends AppStates{
  String? onError;
  BottomNavBarChangingError(this.onError);
}



// Login Screen States
class ShowAndHidePassword extends AppStates{}
class RememberMeCheked extends AppStates{}
// SignUp
class ConfirmPasswordIconState extends AppStates{}
class ClientCreateSuccessState extends AppStates{}
class ClientcreateError extends AppStates{
  String?onError;
  ClientcreateError(this.onError);
}
class UserSignupErrorState extends AppStates{
  String?onError;
  UserSignupErrorState(this.onError);
}

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
class TwitterSignInSuccessState extends AppStates{}
class TwitterSignInErrorState extends AppStates{
  String? onError;
  TwitterSignInErrorState(this.onError);
}

class FacebookSignInSuccessState extends AppStates{}
class FacebookSignInErrorState extends AppStates{
  String? onError;
  FacebookSignInErrorState(this.onError);
}
