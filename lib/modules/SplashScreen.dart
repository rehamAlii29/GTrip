

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// need editting
class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double heightOfTheScreen = MediaQuery.of(context).size.height;
    double widthOfTheScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          // top part
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(
                  height: heightOfTheScreen * .4,
                  width: widthOfTheScreen,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/Vector1.png'),
                          fit: BoxFit.fill))),
              Positioned(

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: const Text(
                        "GTrip",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                        height: 50,
                        width: 50,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/logo.png'),
                                fit: BoxFit.fill))),
                  ],
                ),
              ),
            ],
          ),
          //center part

            Stack(
              overflow: Overflow.visible,
            //  alignment: AlignmentDirectional.topEnd
              
              children: [

                Image.asset('assets/images/car.png',),
                Positioned(
                  bottom: heightOfTheScreen*.1,
                  left: widthOfTheScreen*.3,

                  child: Container(
                    child: Stack( alignment: AlignmentDirectional.bottomStart,
                      children: [Image.asset('assets/images/person.png'),
                      Image.asset('assets/images/box.png')],),
                  ),
                ),

              ],
            ),


          // bottom part
          Expanded(
            child: Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                Container(
                    //  height: heightOfTheScreen * .5,
                    width: widthOfTheScreen,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/Vector 2.png'),
                            fit: BoxFit.fill))),
                MaterialButton(
                    onPressed: () {},
                    color: const Color.fromARGB(255, 218, 23, 9),
                    child: const Text("Get Started",
                        style: TextStyle(color: Colors.white)),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)))
              ],
            ),
          )
        ],
      ),
    );
  }
}
