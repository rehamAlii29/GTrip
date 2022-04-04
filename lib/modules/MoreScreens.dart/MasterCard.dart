import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';

class MasterCard extends StatefulWidget {
  const MasterCard({Key? key}) : super(key: key);

  @override
  State<MasterCard> createState() => _MasterCardState();
}

class _MasterCardState extends State<MasterCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading:

        IconButton(icon: const FaIcon(FontAwesomeIcons.arrowLeftLong, color: Colors.black,), onPressed: () {Navigator.pop(context);  },),
        elevation: 0,
        title: const Text('Back', style: TextStyle(color: Colors.black,
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
                  child: const Center(child: Text("Master Card ",
                    style: const TextStyle(color: Colors.white),
                  )),),
              ],
            ),
            const SizedBox(height: 20,),
            const Center(child: Text("Settle a Payment"),),
            SizedBox(height: MediaQuery.of(context).size.height*.1 ,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Form(

                  child: Column(
                    children: [
                      Row(children: const [Text("Card Name", style: TextStyle(fontSize: 15),)],),
                      const SizedBox(height: 15,),
                      TextFormField(


                        decoration: const InputDecoration(
                            border: const OutlineInputBorder()
                        ),
                      ),
                      const SizedBox(height: 20,),
                      Row(children: const [Text(" Card Number", style: TextStyle(fontSize: 15),)],),
                      const SizedBox(height: 15,),
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder()
                      ),
                    ),
                      const SizedBox(height: 20),

                         Row(

                           children: [
                           Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Row(
                               children: [
                                 Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     Text("Exp"),
                                     SizedBox(height: 10,),
                                     SizedBox(
                                       width: 120,
                                       height: 54,
                                       child: TextFormField(
                                         decoration: InputDecoration(
                                           border: OutlineInputBorder()
                                         ),
                                       ),
                                     )
                                   ],
                                 ),
                               ],
                             ),
                           ),
                           Expanded(
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.end,
                               children: [
                                 Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     Text("Cvv"),
                                     SizedBox(height: 10,),
                                     SizedBox(
                                       height: 54,
                                       width: 120,

                                       child: TextFormField(
                                         decoration: InputDecoration(
                                             border: OutlineInputBorder()
                                         ),
                                       ),
                                     )
                                   ],
                                 ),
                               ],
                             ),
                           ),
                         ],),
                      SizedBox(height: 40,),

                      Row(
mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: 140,
                            height: 40,
                            child: RaisedButton(onPressed: (){

                            },
                              color: HexColor('2B8C94'),

                              child: const Text('Validate', style: TextStyle(color: Colors.white),),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40,),

                    ],
                  )),
            )
          ],),
      ),

    );
  }
}