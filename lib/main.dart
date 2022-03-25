import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gtrip/AppCubit.dart';
import 'package:gtrip/AppStates.dart';
import 'package:gtrip/modules/LoginUser.dart';
import 'package:gtrip/modules/SplashScreen.dart';
import 'package:simple_auth_flutter/simple_auth_flutter.dart';

void main() async{
 WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp();
  runApp(const GTrip());
}

class GTrip extends StatefulWidget {
  const GTrip({Key? key}) : super(key: key);

  @override

  State<GTrip> createState() => _GTripState();
}

class _GTripState extends State<GTrip> {
  @override
  initState() {
    super.initState();
    SimpleAuthFlutter.init(context);
  }
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
