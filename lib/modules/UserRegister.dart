import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gtrip/AppCubit.dart';
import 'package:gtrip/AppStates.dart';
import 'package:gtrip/modules/LoginUser.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gtrip/modules/MoreScreens.dart/MoreScreen.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';
class UserRegister extends StatefulWidget {
  const UserRegister({Key? key}) : super(key: key);

  @override
  _UserRegisterState createState() => _UserRegisterState();
}
var fullname=TextEditingController();
var email=TextEditingController();
var phonenumber=TextEditingController();
var username=TextEditingController();
var password=TextEditingController();
var confirmpassword=TextEditingController();
String fullphoneNumber= '+02' + phonenumber.text;
var formKey=GlobalKey<FormState>();
AppCubit appCubit=AppCubit();
class _UserRegisterState extends State<UserRegister> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>( listener: (context , state){
      if(state is UserSignupErrorState)
      {
        MotionToast.warning(
          description:  Text(state.onError!),
          borderRadius: 5,
          title: const Text("Login Error",
            style: TextStyle(
                fontWeight: FontWeight.bold
            ),),
          iconType: ICON_TYPE.materialDesign,
        ).show(context);
      }
      if(State is UserSignupSuccessState ){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MoreScreen()));
      }
    },
      builder: (context , state){
      appCubit=BlocProvider.of<AppCubit>(context);
      return Scaffold(

        body: Container(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Row(children: [Text("FullName")],),
                  TextFormField(
                    controller: fullname,
                    validator: (value){
                      if (value!.isEmpty) {
                        return " Name cant be emty";
                      }
                    },
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      hintText: "Abdul Lazirh"

                    ),
                  ),
                  SizedBox(height: 20,),
                  Row(children: [Text("E-mail address")],),
                  TextFormField(
                    controller: email,
                    validator: (value){
                      if (value!.isEmpty) {
                        return " email cant be emty";
                      }
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.email_outlined),
                        hintText: "myemail@gmail.com"

                    ),
                  ),
                  SizedBox(height: 20,),
                  Row(children: [Text('phone number')],),
                  TextFormField(

                    controller: phonenumber,
                    validator: (value){
                      if (value!.isEmpty) {
                        return " phone cant be emty";
                      }
                    },
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      prefixIcon: CountryCodePicker(
initialSelection: 'eg',
                        onChanged: (value){
  fullphoneNumber =  value.toString()+ phonenumber.text;

                        },
                      ),
                        suffixIcon:  Icon(Icons.phone),
                        hintText: "0231458795"

                    ),
                  ),
                  SizedBox(height: 20,),
                  Row(children: [Text("Username")],),
                  TextFormField(
                    controller: username,
                    validator: (value){
                      if (value!.isEmpty) {
                        return " username cant be emty";
                      }
                    },
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                        suffixIcon: Icon(Icons.account_circle),
                        hintText: "Duran0124r"

                    ),
                  ),
                  SizedBox(height: 20,),
                  Row(children: [Text("password")],),
                  TextFormField(
                    controller: password,
                    validator: (value){
                      if (value!.isEmpty) {
                        return " password cant be empty";
                      }
                    },
                    obscureText: appCubit.obsecured,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(

                        suffixIcon:
                      Row( mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [ IconButton(onPressed: (){
                        appCubit.showAndHidePasswordFunc();
                      },
                          icon: Icon(appCubit.passwordIcon)),
                        FaIcon(FontAwesomeIcons.key, size: 20,)
                      ],),
                        hintText: "*************",
                    ),
                  ),
                  SizedBox(height: 20,),
                  Row(children: [Text("Confirm Password")],),
                  TextFormField(
                    controller: confirmpassword,
                    obscureText: appCubit.ConfirmPasswordobsecure,
                    validator: (value){
                      if ( confirmpassword.text != password.text ) {
                        return "password must be same ";
                      }
                    },
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(

                        suffixIcon:
                        Row( mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: [ IconButton(onPressed: (){
                            appCubit.confirmPasswordfunction();
                          },
                              icon: Icon(appCubit.confirmpasswordIcon)),
                            FaIcon(FontAwesomeIcons.key, size: 20,)
                          ],),
                        hintText: "*************"

                    ),
                  ),
                  SizedBox(height: 20,),
                  //button
                  MaterialButton(
                    minWidth: MediaQuery.of(context).size.width,
                    height: 40,
                    onPressed: (){
if(formKey.currentState!.validate()){
  appCubit.userSignup(fullname: fullname.text,
      email: email.text,
      phone: fullphoneNumber.toString(),
      username: username.text,
    password: password.text
     );
  print(fullphoneNumber);
}
                  }, child: Text("Sign Up", style: TextStyle(color: Colors.white, fontSize: 16,fontWeight: FontWeight.bold),),
                      color: Colors.cyan[800],
                      shape: RoundedRectangleBorder(

                      borderRadius: BorderRadius.circular(20)
      ),
                  ),

Row(
  mainAxisAlignment: MainAxisAlignment.center,
   children: [
  Text("Already have an account  " ,style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 15),),
     TextButton(onPressed: (){Navigator.pushReplacement(context,
           MaterialPageRoute(builder: (context)=> LoginUser()));}, child:
     Text("LogIn" ,style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 17),))
],)





                ],),
              ),
            ),
          ),
        ),
      );
      },
    );
  }
}
