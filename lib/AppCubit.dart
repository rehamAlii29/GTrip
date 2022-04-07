


import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_oauth/firebase_auth_oauth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart' ;
import 'package:gtrip/AppStates.dart';
import 'package:gtrip/CasheHelper.dart';
import 'package:gtrip/Constant/const.dart';
import 'package:gtrip/models/ClientModel.dart';
import 'package:gtrip/models/TripModel.dart';
import 'package:gtrip/modules/AppHome.dart';
import 'package:gtrip/modules/Help.dart';
import 'package:gtrip/modules/History.dart';
import 'package:gtrip/modules/HomeScreen.dart';
import 'package:gtrip/modules/MoreScreens.dart/Personalinfo.dart';
import 'package:twitter_login/twitter_login.dart';
import 'package:github_sign_in/github_sign_in.dart';

import 'modules/MoreScreens.dart/MoreScreen.dart';
import 'package:image_picker/image_picker.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  //  who are you part
  int? vlaue;

  ClientModel?clientModel;

  drobDownmenu(int selectedValue) {
    vlaue = selectedValue;
    emit(DrobDwonButtonState());
  }


  // show and hide password
  bool obsecured = true;
  IconData passwordIcon = Icons.visibility_off_outlined;

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

  bool ConfirmPasswordobsecure = true;
  IconData confirmpasswordIcon = Icons.visibility_off_outlined;

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
  int currentIndex = 0;
  List<Widget> ScreensofNavbar = [
    AppHome(),
    History(),
    Help(),
    MoreScreen()

  ];

  toggelbetweenNavbarScreens(int selectedIndex) {
    currentIndex = selectedIndex;
    emit(BottomNavBarChangingSuccess());
  }

  //  Signup


  userSignup({
    @required String? fullname,
    @required String? email,
    @required String? phone,
    @required String? username,
    @required String? password,

  }) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email!, password: password!);
      userid = FirebaseAuth.instance.currentUser!.uid;
      createuser(fullname: fullname,
          email: email,
          phone: phone,
          username: username,
          userid: userid);
      CasheHelper.saveData(value: userid);

      getClientDataFromFireStor(userid);

    }
    on FirebaseAuthException catch (error) {
      emit(UserSignupErrorState(error.message.toString()));
    }
  }



  // create user in firebase
  createuser({ @required String? fullname,
    @required String? email,
    @required String? phone,
    @required String? username,
    @required String?userid,
    String?image
  }) {
    ClientModel clientModel = ClientModel(
        email: email,
        phone: phone,
        username: username,
        image: image,
        userid: userid,
        fullname: fullname
    );
    FirebaseFirestore.instance.collection('Clients').doc(userid).set(
        clientModel.tofirebase()).then((value) {
      getClientDataFromFireStor(userid);
      //emit(ClientCreateSuccessState());
    }).catchError((onError) {
      emit(ClientcreateError(onError.toString()));
    });
  }


// Remember Me Select
  bool rememberMeChecked = false;

  rememberMeFunction() {
    rememberMeChecked = !rememberMeChecked;
    emit(RememberMeCheked());
    if (rememberMeChecked == true) {
      print(userid);
    }
  }

  // firebaseAuth
  final FirebaseAuth auth = FirebaseAuth.instance;

  // UserLogin
  userLoginFunction({
    @required String? email,
    @required String?password,
  }) {
    auth.signInWithEmailAndPassword(email: email!, password: password!).then((
        value) {
      //  User? currentuser = FirebaseAuth.instance.currentUser;
      //  userid = currentuser!.uid;
      if (rememberMeChecked)
        CasheHelper.saveData(value: value.user!.uid);

      getClientDataFromFireStor(value.user!.uid);

      emit(UserLoginSuccessState(value.user!.uid));
    }).catchError((onError) {
      emit(UserLoginErrorState(onError.toString()));
    });
  }

  // googleSignin
  Future<void> googleSignInFunction(BuildContext context) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount = await googleSignIn
        .signIn();

    final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount!
        .authentication;
    final AuthCredential authCredential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken
    );

    auth.signInWithCredential(authCredential).then((value) {
//userid= value.user!.uid;
      createuser(fullname: value.user!.displayName,
          email: value.user!.email,
          phone: value.user!.phoneNumber??"",
          username: value.user!.displayName??value.user!.email,
          image: "",
          userid: value.user!.uid);
      getClientDataFromFireStor(value.user!.uid);

      emit(UserLoginSuccessState(value.user!.uid));
      emit(GoogleSignInSuccessState(value.user!.uid));
    }).catchError((exception) {
      print(exception.message.toString());
      emit(GoogleSignInErrorState(exception.message.toString()));
    });
  }

  Future<void> signInWithGitHub() async {

User? githubuser = await  FirebaseAuthOAuth().openSignInFlow("github.com", ["email", "Name"]);
createuser(fullname:githubuser!.displayName?? "${githubuser.email}"
    , email: githubuser.email,
    phone: githubuser.phoneNumber,
    username: githubuser.displayName?? "${githubuser.email}",
    userid: githubuser.uid);
print(githubuser.displayName);


emit(UserLoginSuccessState(githubuser.uid));
emit(GithubSigninSuccessState(githubuser.uid));
  
  }

  // Twitter
  Future<void> signInWithTwitter() async {
    await FirebaseAuthOAuth()
        .openSignInFlow("twitter.com", ["email"], {"locale": "en"}).then((
        value) {
      createuser(fullname: value!.displayName,
          email: value.email,
          phone: value.phoneNumber,
          username: value.displayName,
          userid: value.uid);
      getClientDataFromFireStor(value.uid);

      emit(UserLoginSuccessState(value.uid));
      emit(TwitterSignInSuccessState(value.uid));
    }).catchError((onError));
    emit(TwitterSignInErrorState(onError.toString()));
  }


// login with facebook
  //test

  Future<void> signInWithFacebook() async {
    final LoginResult result = await FacebookAuth.instance.login();

    final AuthCredential facebookCredential =
    FacebookAuthProvider.credential(result.accessToken!.token);


    auth.signInWithCredential(facebookCredential).then((value) {

   createuser(fullname: value.user!.displayName,
    image: value.user!.photoURL,
    email: value.user!.email,
    phone: value.user!.phoneNumber,
    username: value.user!.displayName,
    userid: value.user!.uid);

emit(FacebookSignInSuccessState(value.user!.uid));
   getClientDataFromFireStor(value.user!.uid);

   emit(UserLoginSuccessState(value.user!.uid));

    }).catchError((onError) {
      emit(FacebookSignInErrorState(onError.toString()));
    });
  }

  getClientDataFromFireStor(String?userid) async {
    FirebaseFirestore.instance.collection('Clients').doc(userid).get().then((
        value) {
      clientModel =
          ClientModel.fromfirebase(value.data() as Map<String, dynamic>);
      emit(GetDatasucces());
    });
  }


// SignOut
  signOut() async{
  await  auth.signOut();
  CasheHelper.cashe!.clear();
    emit(SignOutSuccess());
  }



  File?profile_image;
  final _picker = ImagePicker();

  Future<void> updateprofileimage() async {
    XFile? imagepicking = await
    _picker.pickImage(source: ImageSource.gallery);
    if (imagepicking != null) {
      profile_image = File(imagepicking.path);
      FirebaseStorage.instance.ref().child('Clients/${Uri
          .file(profile_image!.path)
          .pathSegments
          .last}').putFile(profile_image!).then((value) {
        value.ref.getDownloadURL().then((value) {
          FirebaseFirestore.instance.collection('Clients').doc(userid).update(
              {'image': value});
          getClientDataFromFireStor(userid);
        });
      });
    }
  }


  updateNameEmailPhone({String? username,
    String? email,
    String?phone
  }) async {
    clientModel = ClientModel(
      fullname: clientModel!.fullname,
      userid: clientModel!.userid,
      image: clientModel!.image,
      email: email ?? clientModel!.email,
      username: username ?? clientModel!.username,
      phone: phone ?? clientModel!.phone,


    );

    FirebaseFirestore.instance.collection('Clients').doc(userid).update(
        clientModel!.tofirebase()).then((value) {
      getClientDataFromFireStor(clientModel!.userid);

    });

  }

// History
TripModel? tripModel;
addtrtip({
    Timestamp? fromdate, Timestamp?Todate,
}){
    tripModel = TripModel(tripId: '1', userid: userid, driverid: '1',
      fromDate: fromdate, toDate: Todate,
      fromPlace: "cairo" , toPlace: "Mansoura"
      
    );
    FirebaseFirestore.instance.collection('Trips').add(tripModel!.toFirebase());
    emit(AddTripSuccess());
}
List<TripModel> finishedTripes= [];
List<TripModel> onGoiningTrips=[];
List<TripModel> futerTrips = [];
Timestamp? firstdate;
  Timestamp? lastdate;
getFinished()async{
  FirebaseFirestore.instance.collection('Trips').where('userid', isEqualTo: userid).get().then((value) {
   for(var element in value.docs)
     {

   firstdate=  element['fromDate'] ;
   lastdate= element['toDate'];
   
  if(firstdate!.toDate().isAfter(DateTime.now())){
    print('afteeeeer');
print(element.data());
   futerTrips.add(TripModel.fromFirebase(element.data() ));
  }
  if((DateTime.now().isAfter(lastdate!.toDate()))){
    print('past');
    finishedTripes.add(TripModel.fromFirebase(element.data() as Map<String , dynamic>));
  }
  if(
  (DateTime.now().isAfter(firstdate!.toDate())) 
      && (DateTime.now().isBefore(lastdate!.toDate()))

  ){

    print('ongoing');
    onGoiningTrips.add(TripModel.fromFirebase(element.data()));
  }
     }

  });
  print(futerTrips);
}

}