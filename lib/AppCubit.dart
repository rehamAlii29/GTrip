import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:gtrip/AppStates.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit() : super(InitialState());
  static AppCubit get(context)=> BlocProvider.of(context);
  // show and hide password
  bool obsecured = true;
  IconData passwordIcon= Icons.remove_red_eye ;

  showAndHidePasswordFunc( ){
    obsecured = !obsecured;
    if (obsecured == true){
      passwordIcon= Icons.remove_red_eye;
      emit(ShowAndHidePassword());
    }
    else {
      passwordIcon = Icons.remove_red_eye_outlined;
      emit(ShowAndHidePassword());
    }

      }
// Remember Me Select
  rememberMeFunction(){

  }

  // firebaseAuth
  final FirebaseAuth auth = FirebaseAuth.instance;
  // googleSignin
 Future<void> googleSignInFunction(BuildContext context) async{
   final GoogleSignIn googleSignIn= GoogleSignIn();
   final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
   if(googleSignInAccount != null)
     {
       final GoogleSignInAuthentication googleSignInAuthentication= await googleSignInAccount.authentication;
       final AuthCredential authCredential = GoogleAuthProvider.credential(
         idToken: googleSignInAuthentication.idToken,
         accessToken: googleSignInAuthentication.accessToken
       );
       UserCredential result = await auth.signInWithCredential(authCredential);
       User? googleuser= result.user;
       print(googleuser!.email);
emit(GoogleSignInSuccessState());
     }
   else
     emit(GoogleSignInErrorState());




  }


  // login with gihub


/*

String url = "https://github.com/login/oauth/authorize" +
      "?client_id=" +
      "${yourClientId}" +
      "&scope=public_repo%20read:user%20user:email";

  if (await canLaunch(url)) {
    await launch(
      url,
      forceSafariVC: false,
      forceWebView: false,
    );

    getLinksStream().listen((link) {
           String code = link.substring(link.indexOf(RegExp('code=')) + 5);
  final response = await http.post(
    "https://github.com/login/oauth/access_token",
    headers: {
      "Content-Type": "application/json",
      "Accept": "application/json"
    },
    body: jsonEncode(GitHubLoginRequest(
      clientId: "${yourCredentialId},
      clientSecret: ${yourClientSecret},
      code: code,
    )),
  );
    }, cancelOnError: true);
 */
}
