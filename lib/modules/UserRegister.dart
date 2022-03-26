import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gtrip/AppCubit.dart';
import 'package:gtrip/AppStates.dart';
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
    return BlocConsumer<AppCubit, AppStates>( listener: (context , state){},
      builder: (context , state){
      appCubit=BlocProvider.of<AppCubit>(context);
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(children: [
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
                    suffix: Icon(Icons.email),
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
                      suffix: Icon(Icons.phone),
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
                      suffix: Icon(Icons.account_circle),
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
                      Icon(Icons.key)
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
                          Icon(Icons.key)
                        ],),
                      hintText: "*************"

                  ),
                ),
                SizedBox(height: 25,),
                //button
                MaterialButton(
                  minWidth: MediaQuery.of(context).size.width,
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
                }, child: Text("Sign Up", style: TextStyle(color: Colors.white),),
                    color: Colors.cyan[700],
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
      ),
                ),
                SizedBox(height: 15,),
Row(
  mainAxisAlignment: MainAxisAlignment.center,
   children: [
  Text("Already have an account  " ,style: Theme.of(context).textTheme.caption,),
     Text("Signin" ,style: Theme.of(context).textTheme.bodyMedium,)
],)





              ],),
            ),
          ),
        ),
      );
      },
    );
  }
}
