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
import 'package:gtrip/modules/AppHome.dart';
import 'package:gtrip/modules/Help.dart';
import 'package:gtrip/modules/History.dart';
import 'package:gtrip/modules/HomeScreen.dart';
import 'package:gtrip/modules/MoreScreens.dart/Personalinfo.dart';
import 'package:twitter_login/twitter_login.dart';
import 'package:github_sign_in/github_sign_in.dart';

import 'modules/MoreScreens.dart/MoreScreen.dart';


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

// bottom nav bar
  int currentIndex= 0;
  List<Widget> ScreensofNavbar= [
   AppHome(),
    History(),
    Help(),
    MoreScreen()

  ];
  toggelbetweenNavbarScreens(int selectedIndex){
    currentIndex = selectedIndex;
    emit(BottomNavBarChangingSuccess());
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

  Future<void> signInWithGitHub( ) async {
    User? user = await FirebaseAuthOAuth()
        .openSignInFlow("github.com", ["email"], {"locale": "en"});

  }

     // Twitter
  Future<void> signInWithTwitter() async {
    User? user = await FirebaseAuthOAuth()
        .openSignInFlow("twitter.com", ["email"], {"locale": "en"});
print(user!.displayName);
emit(TwitterSignInSuccessState());



  }


// login with facebook
  //test
  String ?imageoffacebook ='';
  Future<void> signInWithFacebook() async {
    final LoginResult result = await FacebookAuth.instance.login();

    final AuthCredential facebookCredential =
    FacebookAuthProvider.credential(result.accessToken!.token);
    print(facebookCredential.token);

    auth.signInWithCredential(facebookCredential).then((value) {
      imageoffacebook= value.user!.photoURL;
print(value.user!.displayName);
      emit(FacebookSignInSuccessState());
    }).catchError((onError) {
      emit(FacebookSignInErrorState(onError.toString()));
    });
  }



}
