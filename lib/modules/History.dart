import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gtrip/AppCubit.dart';
import 'package:hexcolor/hexcolor.dart';




class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  State<History> createState() => _HistoryState();
}
var from=TextEditingController();
var to = TextEditingController();



class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context){

    return Scaffold(
backgroundColor: HexColor('2B8C94'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(children: [
                Expanded(child: Container(child: TextFormField(),))
              ],),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: SingleChildScrollView(
                child: Card(
shape: RoundedRectangleBorder(
  borderRadius: BorderRadius.only(topLeft: Radius.circular(30),
    bottomRight: Radius.circular(30),
  )
),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      child: Column(children: [
                      ListView.builder(itemBuilder: (context, index) {
                        return buildFutureTrip(context);

                      },
                      itemCount: 5,
                      shrinkWrap: true,
     ),
                      ListView.builder(itemBuilder: (context, index) {
                        return buildFutureTrip(context);

                      },
                        itemCount: 2,
                        shrinkWrap: true,
                      ),
                      ListView.builder(itemBuilder: (context, index) {
                        return buildFutureTrip(context);

                      },
                        itemCount: 2,
                        shrinkWrap: true,
                      ),
                ],),
                    ),
                  ),),
              ),
            ),
          ],
        ),
      )
    );

  }
}
Widget buildFutureTrip(BuildContext context){
  return Expanded(
    child: Column(

      children: [
        SizedBox(height: 10,),
Row(

    children: [
    Text('Newly Scheduled')
],),
      Row(children: [
        // bta3 elsora
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          CircleAvatar(
            radius: 30,
            backgroundImage:
          NetworkImage('https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80')
          ),
          Text('Hamed abdul')
        ],),
        SizedBox(width: 10,),
        // bta3 el description
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          Container(
            width: MediaQuery.of(context).size.width*.4,

             child: Text('transportation of pasta from my house in ciaro, street n° 12 to the village at palace'),),
          Text('\$3,5000')
        ],),
        SizedBox(width: 20,),
       Column(
         crossAxisAlignment: CrossAxisAlignment.end,
mainAxisAlignment: MainAxisAlignment.end,
mainAxisSize: MainAxisSize.min,

         children: [
         Text('19/8/2022'),
         Text('23Km'),
         Text('From 14/4/2022 To 20/4/2022', style: TextStyle(fontSize: 10),)
       ],)
      ],),
SizedBox(height: 10,)
    ],),
  );

}
/*
: Column(
        children: [

          DateTimePicker(

            dateLabelText: 'from',
            controller: from,
            initialDate: DateTime.now(),
            lastDate: DateTime(2023),
            firstDate: DateTime.now(),
            type: DateTimePickerType.dateTimeSeparate ,

          ),
          SizedBox(height: 20,),
          DateTimePicker(
onChanged: (value){

},

            dateLabelText: 'from',
            controller: to,
            initialDate: DateTime.now(),
            lastDate: DateTime(2023),
            firstDate: DateTime.now(),
            type: DateTimePickerType.dateTimeSeparate ,

          ),
          SizedBox(height: 20,),
          RaisedButton(onPressed: (){
DateTime fromtodatetime =  DateTime.parse(from.text.toString());
DateTime todatetodatetime= DateTime.parse(to.text.toString());
        //  AppCubit.get(context).addtrtip(fromdate:Timestamp.fromDate(fromtodatetime), Todate: Timestamp.fromDate(todatetodatetime));

AppCubit.get(context).getFinished();
            }, child: Text('send'),)
        ],
      ),
 */