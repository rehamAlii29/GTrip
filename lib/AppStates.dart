abstract class AppStates {}
class InitialState extends AppStates{}
class ShowAndHidePassword extends AppStates{}
class RememberMeCheked extends AppStates{}
class GoogleSignInSuccessState extends AppStates{}
class GoogleSignInErrorState extends AppStates{
}
class FacebookSignInSuccessState extends AppStates{}
class FacebookSignInErrorState extends AppStates{
  String? onError;
  FacebookSignInErrorState(this.onError);
}
