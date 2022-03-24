import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:gtrip/AppStates.dart';


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
      User? googleuser = result.user;
      print(googleuser!.email);
      emit(GoogleSignInSuccessState());
    }
    else
      emit(GoogleSignInErrorState());
  }


  // login with gihub lessa >_<
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
//trying github

}
