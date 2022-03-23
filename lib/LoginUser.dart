import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gtrip/modules/UserRegister.dart';

class LoginUser extends StatefulWidget {
  const LoginUser({Key? key}) : super(key: key);

  @override
  State<LoginUser> createState() => _LoginUserState();
}
var formKey= GlobalKey<FormState>();
var emailController= TextEditingController();
var passwordController= TextEditingController();
class _LoginUserState extends State<LoginUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .3,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [Image.asset('assets/images/logo.png')]),
          ),
          const Text("proceed with your"),
          const SizedBox(height: 5),
          const Text(
            "Login",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          Form(
            key: formKey,
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('username / email'),
              TextFormField(
                controller: emailController,
                  decoration: const InputDecoration(
                      hintText: "Duran0124r", suffixIcon: Icon(Icons.person))),
              const SizedBox(height: 20,),
              const Text('password'),
              TextFormField(
                controller: passwordController,
                  decoration: const InputDecoration(
                      hintText: "************", suffixIcon: Icon(Icons.key_off))),
              const SizedBox(height: 20,),
              Row(children:  [
                const Expanded(child: const Text("Remember me")),
                CupertinoSwitch(value: true, onChanged: (value){
                  value=false;
                }),

              ],),
              const SizedBox(height: 25,),
              Container( width: MediaQuery.of(context).size.width,

                child: MaterialButton(child: Text("Login",
                  style: TextStyle(color: Colors.white),
                ), onPressed: (){},
                color: Colors.cyan[700]
                  ,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                  ),

                ),
              ),
              SizedBox(height: 5,),


            ],
          )),
          Row( mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(onPressed: (){}, child: Text("Forget password?",
                style: TextStyle(color: Colors.black,
                    fontWeight: FontWeight.w300
                ),
              )),
              SizedBox(width: 5,),
              TextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> UserRegister()));
              }, child: Text("Sign Up",
                  style: TextStyle(color: Colors.black))),
            ],),
Expanded(child: Column(
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
  Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text("Login with"),
    ],
  ),
// lessa goz2 el social sign in
],))
        ],
      ),
    ));
  }
}
