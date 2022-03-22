import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double heightOfTheScreen = MediaQuery.of(context).size.height;
    double widthOfTheScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                SizedBox(
                  //   height: 300,
                  width: widthOfTheScreen,
                  child: Image.asset(
                    'assets/images/Vector1.png',
                    // height: 500,
                    // width: double.infinity,
                    // fit: BoxFit.,
                  ),
                )
                /* Container(
                    height: heightOfTheScreen * .5,
                    width: widthOfTheScreen,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/Vector1.png'),
                            fit: BoxFit.fill))),
                Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/logo.png'),
                            fit: BoxFit.fill))),*/

                /*    Image.asset(
                  'assets/images/Vector1.png',
                  height: 500,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Column(
                  children: [
                    const Text(
                      "GTrip",
                      style: TextStyle(color: Colors.white),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Image.asset(
                      'assets/images/logo.png',
                      width: 60,
                      height: 60,
                      // width: double.infinity,
                      //  fit: BoxFit.cover,
                    ),
                  ],
                ),*/
              ],
            ),
            /* Row(
              children: [
                Image.asset('assets/images/car.png'),
                Image.asset('assets/images/box.png'),
                Image.asset('assets/images/person.png')
              ],
            )*/
          ],
        ),
      ),
    );
  }
}
