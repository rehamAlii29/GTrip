import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_oauth/firebase_auth_oauth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart' ;
import 'package:gtrip/AppStates.dart';
import 'package:gtrip/Constant/const.dart';
import 'package:gtrip/models/ClientModel.dart';
import 'package:twitter_login/twitter_login.dart';
import 'package:github_sign_in/github_sign_in.dart';


class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitialState());
  static AppCubit get(context) => BlocProvider.of(context);
  //  who are you part
int? vlaue ;
ClientModel?clientModel;
  drobDownmenu(int selectedValue){
    vlaue = selectedValue;
    emit(DrobDwonButtonState());

  }


  // show and hide password
  bool obsecured = true;
  IconData passwordIcon =Icons.visibility_off_outlined;

  showAndHidePasswordFunc() {
    obsecured = !obsecured;
    if (obsecured == true) {
      passwordIcon = Icons.visibility_off_outlined;
      emit(ShowAndHidePassword());
    }
    else {
      passwordIcon = Icons.remove_red_eye_outlined;
      emit(ShowAndHidePassword());
    }
  }
  bool ConfirmPasswordobsecure= true;
  IconData confirmpasswordIcon =Icons.visibility_off_outlined;
  confirmPasswordfunction() {
    ConfirmPasswordobsecure = !ConfirmPasswordobsecure;
    if (ConfirmPasswordobsecure == true) {
      confirmpasswordIcon = Icons.visibility_off_outlined;
      emit(ConfirmPasswordIconState());
    }
    else {
      confirmpasswordIcon = Icons.remove_red_eye_outlined;
      emit(ConfirmPasswordIconState());
    }
  }


  //  Signup
  userSignup(
  {
    @required String? fullname,
    @required String? email,
    @required String? phone,
    @required String? username,
    @required String? password,

}
      ){
    auth.createUserWithEmailAndPassword(email: email!, password: password!).then((value) {
      userid= FirebaseAuth.instance.currentUser!.uid;
     createuser(fullname: fullname, email: email, phone: phone, username: username, userid: userid);


    }).catchError((onError){
      emit(UserSignupErrorState(onError.toString()));
    });


  }
  // create user in firebase
  createuser({ @required String? fullname,
    @required String? email,
    @required String? phone,
    @required String? username,
    @required String?userid,
    String?image
  }){
    ClientModel clientModel = ClientModel(
      email: email,
      phone: phone,
      username: username,
      image: image,
        userid: userid,
        fullname: fullname
    );
    FirebaseFirestore.instance.collection('Clients').doc(userid).set(clientModel.tofirebase()).then((value) {
      emit(ClientCreateSuccessState());
    }).catchError((onError){
      emit(ClientcreateError(onError.toString()));
    });
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
      User? currentuser = FirebaseAuth.instance.currentUser;
      userid = currentuser!.uid;
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

/*  final simpleAuth.GithubApi githubApi = simpleAuth.GithubApi(
      "github", "f192cf09118888abc39e", "e65cf4d0ba1ffb9515f675e7c645258ff998c73c",
       "https://gtrip-aa098.firebaseapp.com/__/auth/handler",
      scopes: [
        "user",
        "repo",
        "public_repo",
      ]);*/

  Future<void> signInWithGitHub( ) async {
    User? user = await FirebaseAuthOAuth()
        .openSignInFlow("github.com", ["email"], {"locale": "en"});
    //didnt work also
   /* final GitHubSignIn gitHubSignIn = GitHubSignIn(
        clientId: 'd7422b455a38448d96cf',
        clientSecret: '3d0379fcc5f8da00a78c71676890438b9af8525d',
        redirectUrl: "https://gtrip-aa098.firebaseapp.com/__/auth/handler"
    );
print("1");
    // Trigger the sign-in flow
    final result = await gitHubSignIn.signIn(context);
    print("2");
    // Create a credential from the access token
    final githubAuthCredential = GithubAuthProvider.credential(result.token!);
    print("3");
    // Once signed in, return the UserCredential
    FirebaseAuth.instance.signInWithCredential(githubAuthCredential).then((value) {
      print("4");
      print(value.user!.displayName);
      print("5");
      emit(GithubSigninSuccessState());
      print("6");
    });*/
  }

     // Twitter
  Future<void> signInWithTwitter() async {
    User? user = await FirebaseAuthOAuth()
        .openSignInFlow("twitter.com", ["email"], {"locale": "en"});
print(user!.displayName);
emit(TwitterSignInSuccessState());


// didnt work
  /*  final twitterLogin = new TwitterLogin(
        apiKey: 'CMAMzfkSvgUckQPLv8P7s7CWo',
        apiSecretKey:'KQ5LWIjAFbbguRCZSqwGVJ2jCpBzOfMLBzLriqA6tiEwrWXKfF',
        redirectURI: 'gtriptwitter://'
    );

    final authResult = await twitterLogin.login();
    final twitterAuthCredential = await TwitterAuthProvider.credential(
      accessToken: authResult.authToken!,
      secret: authResult.authTokenSecret!,
    );
    FirebaseAuth.instance.signInWithCredential(twitterAuthCredential).then((value) {
      print(value.user!.displayName);
      emit(TwitterSignInSuccessState());
    });*/





  }


// login with facebook
  Future<void> signInWithFacebook() async {
    final LoginResult result = await FacebookAuth.instance.login();

    final AuthCredential facebookCredential =
    FacebookAuthProvider.credential(result.accessToken!.token);
    print(facebookCredential.token);

    auth.signInWithCredential(facebookCredential).then((value) {
print(value.user!.displayName);
      emit(FacebookSignInSuccessState());
    }).catchError((onError) {
      emit(FacebookSignInErrorState(onError.toString()));
    });
  }



}
