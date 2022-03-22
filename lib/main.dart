import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gtrip/LoginUser.dart';
import 'package:gtrip/modules/SplashScreen.dart';

void main() {
  runApp(const GTrip());
}

class GTrip extends StatelessWidget {
  const GTrip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginUser(),
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          appBarTheme:
              const AppBarTheme(systemOverlayStyle: SystemUiOverlayStyle())),
    );
  }
}
