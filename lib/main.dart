import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gtrip/AppCubit.dart';
import 'package:gtrip/AppStates.dart';
import 'package:gtrip/CasheHelper.dart';
import 'package:gtrip/modules/HomeScreen.dart';
import 'package:gtrip/modules/LoginUser.dart';
import 'package:gtrip/modules/SplashScreen.dart';

import 'Constant/const.dart';


void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await CasheHelper.init();
  userid = CasheHelper.getData(key: 'userid');
  Widget startWidget;
  if(userid != null){
    startWidget = HomeScreen();
    print(userid);
  }
  else{
    startWidget = SplashScreen();
  }
  runApp( GTrip(startWidget));
}





class GTrip extends StatelessWidget {

  final Widget?startWidget;
  GTrip(this.startWidget);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>AppCubit()..getClientDataFromFireStor(userid),
      child:BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {
        },
        builder: (context,state){
          return  MaterialApp(
            debugShowCheckedModeBanner: false,
            home:  startWidget,
            theme: ThemeData(
                scaffoldBackgroundColor: Colors.white,
                appBarTheme:
                const AppBarTheme(systemOverlayStyle: SystemUiOverlayStyle())),
          );
        }
        ,
      ),
    );
  }
}