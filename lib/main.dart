import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gtrip/AppCubit.dart';
import 'package:gtrip/AppStates.dart';
import 'package:gtrip/LoginUser.dart';
import 'package:gtrip/modules/SplashScreen.dart';

void main() async{
 WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp();
  runApp(const GTrip());
}

class GTrip extends StatelessWidget {
  const GTrip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>AppCubit(),
      child:BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {
        },
        builder: (context,state){
          return  MaterialApp(
          debugShowCheckedModeBanner: false,
          home: const LoginUser(),
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
