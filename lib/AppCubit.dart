import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import 'package:google_sign_in/google_sign_in.dart' ;
import 'package:gtrip/AppStates.dart';
import 'package:simple_auth/simple_auth.dart' as simpleAuth;
import 'package:simple_auth_flutter/simple_auth_flutter.dart';




class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  // show and hide password
  bool obsecured = true;
  IconData passwordIcon = Icons.remove_red_eye;

  showAndHidePasswordFunc() {
    obsecured = !obsecured;
    if (obsecured == true) {
      passwordIcon = Icons.remove_red_eye;
      emit(ShowAndHidePassword());
    }
    else {
      passwordIcon = Icons.remove_red_eye_outlined;
      emit(ShowAndHidePassword());
    }
  }

// Remember Me Select
  bool rememberMeChecked= false;
  rememberMeFunction() {
    rememberMeChecked = !rememberMeChecked;
    emit(RememberMeCheked());

  }

  // firebaseAuth
  final FirebaseAuth auth = FirebaseAuth.instance;
  // UserLogin
  userLoginFunction(
  {
    @required String? email,
    @required String?password,
}
      ){
    auth.signInWithEmailAndPassword(email: email!, password: password!).then((value) {
      print(  value.user!.email);
emit(UserLoginSuccessState());
    }).catchError((onError){
      emit(UserLoginErrorState(onError.toString()));
    });


  }

  // googleSignin
  Future<void> googleSignInFunction(BuildContext context) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount = await googleSignIn
        .signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount
          .authentication;
      final AuthCredential authCredential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken
      );
      UserCredential result = await auth.signInWithCredential(authCredential);

      print(result.user!.email);
      emit(GoogleSignInSuccessState());
    }
    else
      emit(GoogleSignInErrorState());
  }
// Githutb

  final simpleAuth.GithubApi githubApi = new simpleAuth.GithubApi(
      "github", "f192cf09118888abc39e", "e65cf4d0ba1ffb9515f675e7c645258ff998c73c", "https://gtrip-aa098.firebaseapp.com/__/auth/handler",
      scopes: [
        "user",
        "repo",
        "public_repo",
      ]);
   Future<void> siginwithgithub( simpleAuth.AuthenticatedApi api) async{
 api.authenticate().then((value) {
       emit(GithubSigninSuccessState());
     }).catchError((onError){
       emit(GithubSigninErrorState(onError.toString()));
     });









     }

// login with facebook
  Future<void> signInWithFacebook() async {
    final LoginResult result = await FacebookAuth.instance.login();

    final AuthCredential facebookCredential =
    FacebookAuthProvider.credential(result.accessToken!.token);
    print(facebookCredential.token);

    auth.signInWithCredential(facebookCredential).then((value) {
      print(value.user!.displayName);
      print(value.user!.phoneNumber);
      print(value.user!.photoURL);
      emit(FacebookSignInSuccessState());
    }).catchError((onError) {
      emit(FacebookSignInErrorState(onError.toString()));
    });
  }


}
