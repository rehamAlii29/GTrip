import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
      home: const SplashScreen(),
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          appBarTheme:
              const AppBarTheme(systemOverlayStyle: SystemUiOverlayStyle())),
    );
  }
}
