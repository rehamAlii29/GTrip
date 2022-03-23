import 'package:flutter/material.dart';

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
              Row(children: const [
                Expanded(child: Text("Remember me")),



              ],)

            ],
          ))
        ],
      ),
    ));
  }
}
