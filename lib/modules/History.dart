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

    return SingleChildScrollView(
      child: Container(

          width: MediaQuery.of(context).size.width,
          height:MediaQuery.of(context).size.height,
          color:  HexColor('2B8C94'),
          child: Column(children: [
            AppBar(backgroundColor:HexColor('2B8C94') ,
            elevation: 0,),
          // search ,
          Padding(
            padding: const EdgeInsets.all(20),
            child:
// box el search
            Row(children: [
              Expanded(child: Container(
                color: Colors.white,


                 child: TextFormField(
                   decoration: InputDecoration(

                     border: InputBorder.none,
                      prefixIcon: Icon(Icons.search, color: Colors.black,),
                     hintText: "search by date, name of driver"
                   ),


                 ),))
            ],),
          ),
            Text("explor the list of past and secheduled goods transportation", style: TextStyle(color: Colors.white),),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 20, left: 20),
                child: ClipRRect(

                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)

                  ),
                  child: SingleChildScrollView(

                    child: Container(
                      color: Colors.white,
                      child: SingleChildScrollView(
                        child: Column(children: [
                          ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: 10,
                              itemBuilder: (context , index){
                            return buildFutureTrip(context);
                          }),
                          Container( color: HexColor('2B8C94'),
                            child:ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: 10,
                              itemBuilder: (context , index){
                                return buildFutureTrip(context);
                              }),
                              )
                        ],),
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],),),
    );

  }
}
Widget buildFutureTrip(BuildContext context){
  return  Padding(
    padding: const EdgeInsets.only(left: 20),
    child: Column(

        children: [
          SizedBox(height: 10,),
Row(

      children: [
      Text('Newly Scheduled', style: TextStyle(fontWeight: FontWeight.bold`),)
],),
        SizedBox(height: 10,),
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
            SizedBox(height: 5,),
            Text('Hamed abdul')
          ],),
          SizedBox(width: 10,),
          // bta3 el description
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Container(
              width: MediaQuery.of(context).size.width*.4,

               child: Text('transportation of pasta from my house in ciaro, street n° 12 to the village at palace' , style: TextStyle(fontSize: 12),),),

            Text('\$3,5000', style: TextStyle(fontWeight: FontWeight.bold),)
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