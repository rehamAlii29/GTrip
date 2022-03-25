import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gtrip/AppCubit.dart';
import 'package:gtrip/AppStates.dart';
import 'package:gtrip/modules/MoreScreens.dart/Personalinfo.dart';
import 'package:gtrip/modules/UserRegister.dart';
import 'package:flutter_remix/flutter_remix.dart' ;
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';

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
    return  BlocConsumer<AppCubit, AppStates>( listener: (context, state){
      if(state is UserLoginSuccessState){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const PersonalInfo()));
      }
      if(State is UserLoginErrorState){
        MotionToast.warning(
          description: const Text("Check your NetWork"),
          borderRadius: 5,
          title: const Text("Login Error",
            style: TextStyle(
                fontWeight: FontWeight.bold
            ),),
          iconType: ICON_TYPE.materialDesign,
        ).show(context);
      }
      if(State is GoogleSignInSuccessState)
        {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const PersonalInfo()));
        }
      if (State is GoogleSignInErrorState){
        MotionToast.warning(
          description: const Text("Check your NetWork"),
          borderRadius: 5,
          title: const Text("Login Error",
          style: TextStyle(
              fontWeight: FontWeight.bold
          ),),
          iconType: ICON_TYPE.materialDesign,
        ).show(context);
      }
    },builder: (context, state) {
      appCubit = BlocProvider.of<AppCubit>(context);
      return Scaffold(

          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * .3,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [Image.asset('assets/images/logo.png')]),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(children: [ const Text("proceed with your"),
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
                                keyboardType: TextInputType.emailAddress,
                                validator: (value){
                                  if (value!.isEmpty)
                                  {
                                    return "E-mail or UserName Cant be Empty";
                                  }
                                  else
                                    return null;
                                },
                                decoration: const InputDecoration(
                                    hintText: "Duran0124r", suffixIcon: Icon(FlutterRemix.account_box_line,

                                ))),
                            const SizedBox(height: 20,),
                            const Text('password'),
                            TextFormField(
                                controller: passwordController,

                                obscureText: appCubit!.obsecured,
                                keyboardType: TextInputType.visiblePassword,
                                validator: (value){
                                  if (value!.isEmpty)
                                  {
                                    return "Password Cant be Empty";
                                  }
                                  else
                                    return null;
                                },
                                decoration:  InputDecoration(
                                    hintText: "************",

                                    suffix: IconButton(onPressed:(){
                                      appCubit!.showAndHidePasswordFunc();
                                      print(appCubit!.obsecured);
                                    },
                                        icon: Icon(appCubit!.passwordIcon)),
                                    suffixIcon: const Icon(Icons.key))),
                            const SizedBox(height: 20,),
                            Row(children:  [
                              const Expanded(child: Text("Remember me")),
                              CupertinoSwitch(value: appCubit!.rememberMeChecked, onChanged: (value){
                            //    value=appCubit!.rememberMeChecked;
                                appCubit!.rememberMeFunction();
                              }),

                            ],),
                            const SizedBox(height: 25,),
                            Container( width: MediaQuery.of(context).size.width,

                              child: MaterialButton(child: const Text("Login",
                                style: TextStyle(color: Colors.white),
                              ), onPressed: (){
                               if (formKey.currentState!.validate()){ appCubit!.userLoginFunction(email: emailController.text, password: passwordController.text);}


                              },
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
                    const Text("Login with"),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment:  MainAxisAlignment.center,

                      children: [

                        GestureDetector(
                          child:  const Image(image: AssetImage('assets/images/google.png'),
                            width: 50,height: 50,
                          ) ,
                          onTap: (){  appCubit!.googleSignInFunction(context);},
                        ),
                        SizedBox(width: 10,),
                        GestureDetector(
                          child:  const Image(image: AssetImage('assets/images/github.png'),
                            width: 50,height: 50,
                          ) ,
                          onTap: (){

                            appCubit!.siginwithgithub(appCubit!.githubApi);


                            },
                        ),
                        SizedBox(width: 10,),
                        GestureDetector(
                          child:  const Image(image: AssetImage('assets/images/twitter.png'),
                            width: 50,height: 50,
                          ) ,
                          onTap: (){  },
                        ),
                        SizedBox(width: 10,),
                        GestureDetector(
                          child:  const Image(image: AssetImage('assets/images/facebook.png'),
                            width: 50,height: 50,
                          ) ,
                          onTap: (){  appCubit!.signInWithFacebook();},
                        ),



                      ],)],),
                ),

              ],
            ),
          ));
    },);
  }
}
