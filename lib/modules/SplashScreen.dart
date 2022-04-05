

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gtrip/AppCubit.dart';
import 'package:gtrip/modules/LoginUser.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';

// need editting
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
var dropdownkey= GlobalKey();
class _SplashScreenState extends State<SplashScreen> {
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
                  height: heightOfTheScreen * .33,
                  width: widthOfTheScreen,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/Vector1.png'),
                          fit: BoxFit.fill))),
              Positioned(
top: 40,
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

// who are you part
Padding(
  padding: const EdgeInsets.symmetric(horizontal: 50),
  child:   SizedBox(
    height: 60,

    child: DropdownButtonFormField(
elevation: 20,

      hint: const Text("Who are You?"),
      decoration: InputDecoration(

        border:OutlineInputBorder(borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(
              style: BorderStyle.solid,
              color: Colors.black12
          ) ,
        ),
        focusedBorder:OutlineInputBorder(borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(
            style: BorderStyle.solid,
             color: Colors.black12
          ) ,
      ),

      ),
      items: const [ DropdownMenuItem(child: Text("Client"),
      value:1,
    ),
      DropdownMenuItem(child: Text("Driver"),
        value: 2,
      ),], onChanged:  (selectedValue){
      AppCubit.get(context).drobDownmenu(selectedValue as int);
      print(  AppCubit.get(context).vlaue);
    },
      value: AppCubit.get(context).vlaue ,
    ),
  ),
),



          // bottom part
          Expanded(
            child: Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                Container(
                    //  height: heightOfTheScreen * .3,
                    width: widthOfTheScreen,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/Vector 2.png'),
                            fit: BoxFit.fill))),
                // get started
                Padding(
                  padding: const EdgeInsets.only(right: 20,
                  bottom: 20),
                  child: MaterialButton(
                      onPressed: () {
                        if(AppCubit.get(context).vlaue== 1){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const LoginUser()));}
                       else if(AppCubit.get(context).vlaue== 2){}
                       else {
                          MotionToast.warning(
                            animationCurve: Curves.easeInOutQuad,
                            description: const Text("Please we must know Who are you?"),
                            borderRadius: 10,
                            title: const Text("Starting Error",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold
                              ),),
                            iconType: ICON_TYPE.materialDesign,
                          ).show(context);
                        }
                      },
                      color: const Color.fromARGB(255, 218, 23, 9),
                      child: const Text("Get Started",
                          style: TextStyle(color: Colors.white)),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0))),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
