import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gtrip/AppCubit.dart';
import 'package:gtrip/AppStates.dart';
import 'package:gtrip/modules/UserRegister.dart';
import 'package:flutter_remix/flutter_remix.dart' ;

class LoginUser extends StatefulWidget {
  const LoginUser({Key? key}) : super(key: key);

  @override
  State<LoginUser> createState() => _LoginUserState();
}
var formKey= GlobalKey<FormState>();
var emailController= TextEditingController();
var passwordController= TextEditingController();
AppCubit? appCubit ;
class _LoginUserState extends State<LoginUser> {
  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<AppCubit, AppStates>( listener: (context, state){},builder: (context, state) {
      appCubit = BlocProvider.of<AppCubit>(context);
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
                                hintText: "Duran0124r", suffixIcon: Icon(FlutterRemix.account_box_line,

                            ))),
                        const SizedBox(height: 20,),
                        const Text('password'),
                        TextFormField(
                            controller: passwordController,
                            decoration: const InputDecoration(
                                hintText: "************", suffixIcon: Icon(Icons.key))),
                        const SizedBox(height: 20,),
                        Row(children:  [
                          const Expanded(child: Text("Remember me")),
                          CupertinoSwitch(value: true, onChanged: (value){
                            value=false;
                          }),

                        ],),
                        const SizedBox(height: 25,),
                        Container( width: MediaQuery.of(context).size.width,

                          child: MaterialButton(child: const Text("Login",
                            style: TextStyle(color: Colors.white),
                          ), onPressed: (){},
                            color: Colors.cyan[700]
                            ,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)
                            ),

                          ),
                        ),
                        const SizedBox(height: 5,),


                      ],
                    )),
                Row( mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(onPressed: (){}, child: const Text("Forget password?",
                      style: TextStyle(color: Colors.black,
                          fontWeight: FontWeight.w300
                      ),
                    )),
                    const SizedBox(width: 5,),
                    TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> const UserRegister()));
                    }, child: const Text("Sign Up",
                        style: TextStyle(color: Colors.black))),
                  ],),
                const SizedBox(
                  height: 20,
                ),
                Expanded(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Login with"),
                      ],
                    ),
// lessa goz2 el social sign in

                    MaterialButton(onPressed: (){
                      appCubit!.googleSignInFunction(context);

                    },
                      child : const Image(image: AssetImage('assets/images/google.png'),
                        width: 100,height: 100,
                      ) ,
                    )
                  ],))
              ],
            ),
          ));
    },);
  }
}
