import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:gtrip/AppStates.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit() : super(InitialState());
  static AppCubit get(context)=> BlocProvider.of(context);
  final FirebaseAuth auth = FirebaseAuth.instance;
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
}
