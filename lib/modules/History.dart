import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gtrip/AppCubit.dart';
import 'package:gtrip/AppStates.dart';
import 'package:gtrip/models/TripModel.dart';
import 'package:intl/intl.dart';
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

    return BlocConsumer<AppCubit, AppStates>(
   listener: (context, state){

   },
      builder: (context, state){
     List finished= AppCubit.get(context).finishedTripes;
     List ongoing = AppCubit.get(context).onGoiningTrips;
     List future = AppCubit.get(context).futerTrips;
     return  SingleChildScrollView(
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
               padding: const EdgeInsets.only(top: 20, left: 10, ),
               child: Card(
  clipBehavior: Clip.antiAliasWithSaveLayer,
                shape:RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),

                  )
                ),
                 child: SingleChildScrollView(

                   child: Container(
                     color: Colors.white,
                     child: SingleChildScrollView(
                       child: Padding(
                         padding: const EdgeInsets.only(left: 10, top: 10 ),
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                           Text("Newly Scheduled", style: TextStyle(fontWeight: FontWeight.bold),),
                           ListView.builder(
                               physics: NeverScrollableScrollPhysics(),
                               scrollDirection: Axis.vertical,
                               shrinkWrap: true,
                               itemCount: future.length,
                               itemBuilder: (context , index){
                                 return buildFutureTrip(context , future[index], );
                               }),

                           Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Card(
                               child:Padding(
                                 padding: const EdgeInsets.only(left: 10, top: 10 ),
                                 child: Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     Text("Ongoing Transport", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
                                     Divider(
                                       thickness: 2,
                                       color: Colors.white,
                                     ),
                                     ListView.builder(
                                         physics: NeverScrollableScrollPhysics(),
                                         scrollDirection: Axis.vertical,
                                         shrinkWrap: true,
                                         itemCount: ongoing.length,
                                         itemBuilder: (context , index){
                                           return buildFutureTrip(context, ongoing[index],);
                                         }),
                                   ],
                                 ),
                               ),
                      elevation: 50,
                               color: HexColor('2B8C94'),
                               clipBehavior: Clip.antiAliasWithSaveLayer,

                               shape: RoundedRectangleBorder(
                                   borderRadius: BorderRadius.only(
                                     topLeft: Radius.circular(30),
                                     bottomRight: Radius.circular(30),

                                   )
                               ),
                             ),
                           ),
                             SizedBox(height: 15,),
                             Text("Dlivered & Closed", style: TextStyle(fontWeight: FontWeight.bold),),
                           ListView.builder(
                               physics: NeverScrollableScrollPhysics(),
                               scrollDirection: Axis.vertical,
                               shrinkWrap: true,
                               itemCount: finished.length,
                               itemBuilder: (context , index){
                                 return buildFutureTrip(context , finished[index], );
                               })
                         ],),
                       ),
                     ),
                   ),
                 ),
               ),
             ),
           ),
         ],),),
     );
      },
    );

  }
}
Widget buildFutureTrip(BuildContext context, TripModel tripModel , ){
  return  Expanded(
    child: Row(

        children: [

        Row(children: [
          // bta3 elsora
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            CircleAvatar(
              radius: 30,
              backgroundImage:
            NetworkImage('${tripModel.imageOfDriver}')
            ),
            SizedBox(height: 5,),
            Text('${tripModel.DriverName}')
          ],),

          // bta3 el description
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Container(
              width: MediaQuery.of(context).size.width*.4,

               child: Text('${tripModel.tripDescription == null ? "No Description found " : tripModel.tripDescription}'
                 , style: TextStyle(fontSize: 10,
                 ), maxLines: 2,
                 overflow: TextOverflow.ellipsis,
               ),),
SizedBox(height: 5,),
            Text('\$${tripModel.tripCost}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10), )
          ],),

         Column(
           crossAxisAlignment: CrossAxisAlignment.end,

mainAxisAlignment: MainAxisAlignment.spaceBetween,
mainAxisSize: MainAxisSize.min,

           children: [
           Text('${DateFormat.yMMMd().add_jm().format(DateTime.now())}', style: TextStyle(fontSize: 8)),
           Text('${tripModel.distance}', style :Theme.of(context).textTheme.caption!.copyWith(fontSize: 15)),
           Text('From ${DateFormat.yMMMd().add_jm().format(tripModel.fromDate!.toDate())} '
               'To ${DateFormat.yMMMd().add_jm().format(tripModel.toDate!.toDate())}',

             style: TextStyle(fontSize: 8),)
         ],)
        ],),
SizedBox(height: 10,)
      ],),
  );


}