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
 final String?onError;
  UserSignupErrorState(this.onError);
}

class UserLoginSuccessState extends AppStates{
  String?userid;
  UserLoginSuccessState(this.userid);
  // user id
}
class UserLoginErrorState extends AppStates{
  String?onError;
  UserLoginErrorState(this.onError);
}

class GithubSigninSuccessState extends AppStates{
  String?userid;
  GithubSigninSuccessState(this.userid);
}
class GithubSigninErrorState extends AppStates{
  String? onError;
  GithubSigninErrorState(this.onError);
}

class GoogleSignInSuccessState extends AppStates{
  String?userid;
  GoogleSignInSuccessState(this.userid);
}
class GoogleSignInErrorState extends AppStates{

  final String? onError;
  GoogleSignInErrorState(this.onError);
}
class TwitterSignInSuccessState extends AppStates{
  String?userid;
  TwitterSignInSuccessState(this.userid);
}
class TwitterSignInErrorState extends AppStates{
  String? onError;
  TwitterSignInErrorState(this.onError);
}

class FacebookSignInSuccessState extends AppStates{
  String?userid;
  FacebookSignInSuccessState(this.userid);
}
class FacebookSignInErrorState extends AppStates{
  String? onError;
  FacebookSignInErrorState(this.onError);
}
class GetDatasucces extends AppStates{}
class SignOutSuccess extends AppStates{}
class UpdateNamaemailphoneSuccess extends AppStates{}
/// trip
class AddTripSuccess extends AppStates{}
class GetTriploading extends AppStates{}
class GetTripSuccess extends AppStates{}
class SearchSuccess extends AppStates{}
class SearchLoading extends AppStates{}
