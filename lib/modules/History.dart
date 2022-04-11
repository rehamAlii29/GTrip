import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
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
               padding:  EdgeInsets.only(top: 20, left: 10, ),
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
                     width: MediaQuery.of(context).size.width,
                     color: Colors.white,
                     child: SingleChildScrollView(
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                         Padding(
                           padding:  EdgeInsets.only(left: 20, top: 20),
                           child: Text("Newly Scheduled", style: TextStyle(fontWeight: FontWeight.bold), ),
                         ),

                        future.isEmpty? Align( alignment: Alignment.center,
                            child: Text("There is no Sechduled Trips" , style: TextStyle(fontWeight: FontWeight.w900),)) : ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: future.length,
                            itemBuilder: (context , index){
                              return buildFutureTrip(context , future[index], Colors.black );
                            }),

                         Container(
                          // width: MediaQuery.of(context).size.width,
                           child: Padding(
                             padding: const EdgeInsets.all(2),
                             child: Card(

                               child:Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Padding(
                                     padding: const EdgeInsets.only(left: 10, top: 10),
                                     child: Row(
                                       crossAxisAlignment: CrossAxisAlignment.center,
                                       children: [
                                         Text("Ongoing Transport",
                                           style: GoogleFonts.openSans(fontWeight: FontWeight.bold, color: Colors.white, )
                                           ),
                                       ],
                                     ),
                                   ),
                                   SizedBox(height: 10,),
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
                                         return buildFutureTrip(context, ongoing[index], Colors.white
                                         );
                                       }),
                                 ],
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
                         ),
                           SizedBox(height: 15,),
                           Padding(
                             padding: const EdgeInsets.only(left: 10),
                             child: Text("Dlivered & Closed", style: TextStyle(fontWeight: FontWeight.bold),),
                           ),
                         ListView.builder(
                             physics: NeverScrollableScrollPhysics(),
                             scrollDirection: Axis.vertical,
                             shrinkWrap: true,
                             itemCount: finished.length,
                             itemBuilder: (context , index){
                               return buildFutureTrip(context , finished[index],  Colors.black);
                             })
                       ],),
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
Widget buildFutureTrip(BuildContext context, TripModel tripModel ,Color colorofText ){
  return  Padding(
    padding: const EdgeInsets.all(10.0),
    child: Row(
      mainAxisSize: MainAxisSize.max,

        children: [

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          CircleAvatar(
            radius: 30,
            backgroundImage:
          NetworkImage('${tripModel.imageOfDriver}')
          ),
          SizedBox(height: 5,),
          Text('${tripModel.DriverName}', style: TextStyle(color: colorofText),)
        ],),

        // bta3 el description
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Container(
            width: MediaQuery.of(context).size.width*.3,

             child: Text('${tripModel.tripDescription == null ? "No Description found " : tripModel.tripDescription}'
               , style: TextStyle(fontSize: 10,color: colorofText
               ), maxLines: 2,
               overflow: TextOverflow.ellipsis,
             ),),
SizedBox(height: 5,),
          Text('\$${tripModel.tripCost}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: colorofText), )
        ],),

         Expanded(
           child: Column(
         crossAxisAlignment: CrossAxisAlignment.end,

mainAxisAlignment: MainAxisAlignment.center,


           children: [
           Row(mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Text('${DateFormat.yMMMd().format(DateTime.now())}', style: TextStyle(fontSize: 15, color: colorofText)),
             ],
           ),
           Row(
               mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Text('${tripModel.distance}', style :Theme.of(context).textTheme.caption!.copyWith(fontSize: 15, color: colorofText)),
             ],
           ),
           Row(
               mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Text('From ${DateFormat.yMMMd().format(tripModel.fromDate!.toDate())} '
                   'To ${DateFormat.yMMMd().format(tripModel.toDate!.toDate())}',

                 style: TextStyle(fontSize: 10,color: colorofText ),),
             ],
           )
           ],),
         ),
SizedBox(height: 10,)
      ],),
  );


}