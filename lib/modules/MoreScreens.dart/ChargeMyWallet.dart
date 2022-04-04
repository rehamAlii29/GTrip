import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gtrip/modules/MoreScreens.dart/MasterCard.dart';
import 'package:gtrip/modules/MoreScreens.dart/MoreScreen.dart';
import 'package:gtrip/modules/MoreScreens.dart/TokenBnus.dart';
import 'package:hexcolor/hexcolor.dart';

class ChargeMyWallet extends StatefulWidget {
  const ChargeMyWallet({Key? key}) : super(key: key);

  @override
  State<ChargeMyWallet> createState() => _ChargeMyWalletState();
}
var formKey= GlobalKey<FormState>();
var amountController = TextEditingController();
var userAcoountContorller=TextEditingController();
class _ChargeMyWalletState extends State<ChargeMyWallet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading:

            IconButton(icon: FaIcon(FontAwesomeIcons.arrowLeftLong, color: Colors.black,), onPressed: () {Navigator.pop(context);  },),
          elevation: 0,
        title: Text('Back', style: TextStyle(color: Colors.black,
          fontWeight: FontWeight.w400
        ), ),
titleSpacing: -9,
        ),



      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
         Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Container
               (

               width: MediaQuery.of(context).size.width * .7,
               height: 40,

               decoration: BoxDecoration(

                   color: HexColor("2B8C94"),
                 borderRadius: BorderRadius.circular(20)
               ),
               child: Center(child: Text(" My Wallet",
                 style: TextStyle(color: Colors.white),
               )),),
           ],
         ),
            SizedBox(height: 20,),
            Center(child: Text("Settle a Payment"),),
            SizedBox(height: MediaQuery.of(context).size.height*.1 ,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Form(
                key: formKey,
                  child: Column(
                children: [
                  Row(children: [Text("Amount", style: TextStyle(fontSize: 15),)],),
                  SizedBox(height: 15,),
                  TextFormField(
                    controller: amountController,
                    validator: (value){
                      if(value!.isEmpty){
                        return "please enter the amount";
                      }
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder()
                    ),
                  ),
                  SizedBox(height: 20,),
                  Row(children: [Text("User Account", style: TextStyle(fontSize: 15),)],),
                  SizedBox(height: 15,),
                  DropdownButtonFormField(
                    validator: (value){

                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder()
                    ), onChanged: (value) {  }, items: [
                      DropdownMenuItem(
                        value: 1,
                        child: Text(''),
                      )
                  ],
                  ),
                  SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 140,
                        height: 40,
                        child: RaisedButton(onPressed: (){
                          if(
                          formKey.currentState!.validate())
                          {
                         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MasterCard()));
                          }

                        },
                          color: HexColor('2B8C94'),

                          child: Text('Validate', style: TextStyle(color: Colors.white),),
                        ),
                      ),
                    ],
                  ),


                ],
              )),
            )
        ],),
      ),

    );
  }
}
