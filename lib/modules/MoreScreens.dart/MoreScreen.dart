import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gtrip/AppCubit.dart';
import 'package:gtrip/AppStates.dart';
import 'package:gtrip/modules/MoreScreens.dart/MyWallet.dart';
import 'package:gtrip/modules/MoreScreens.dart/Personalinfo.dart';

import '../../models/ClientModel.dart';
import 'TokenBnus.dart';
TabController? tabController;

class MoreScreen extends StatefulWidget {

@override


  @override

  State<MoreScreen> createState() => MoreScreenState();

}


var usernamecontroller = TextEditingController();

class MoreScreenState extends State<MoreScreen>
    with SingleTickerProviderStateMixin
{


@override

void initState() {
  tabController = new  TabController(length: 3, vsync: this);

  super.initState();
}
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
        listener: (context , state){

        },
    builder: (context , state){
      var data = AppCubit.get(context).clientModel;
      usernamecontroller.text= data!.username!;
    return Container(
      child: Column(
        children: [
          // above part
      Container(

      height: MediaQuery.of(context).size.height*.3,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        alignment: AlignmentDirectional.bottomStart,
        children: [
          // container of vector image
          Container(
            height: MediaQuery.of(context).size.height*.3,
            width: MediaQuery.of(context).size.width,
            child: Image.asset('assets/images/Vector4.png',

              fit: BoxFit.fill,

            ),
          ),
          //  circular avatar
          Padding(
            padding: const EdgeInsets.only(left: 20,bottom: 1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage('${data.image}'),

                ),
                IconButton(onPressed: (){
                  AppCubit.get(context).updateprofileimage();
                }, icon:FaIcon(FontAwesomeIcons.solidPenToSquare, size: 15,))
              ],
            ),
          )
        ],
      ) ,
      ),

        ///////////////////
        Padding(
              padding: const EdgeInsets.only(left: 20,top: 0),
              child: Row(


                children: [
Container(height: 20,width:100 ,

  child: TextFormField(
    controller: usernamecontroller,
    decoration: InputDecoration.collapsed(border: InputBorder.none, hintText: ''),

    ),
  ),

                IconButton(onPressed: (){
                  AppCubit.get(context).updateNameEmailPhone(username: usernamecontroller.text);

                }, icon: FaIcon(FontAwesomeIcons.solidPenToSquare,size: 15,))
              ],),
            ),

////////////// part bta3 tab veiw

          TabBar(
            labelColor: Colors.black,
            controller: tabController,
indicatorWeight: 1,
            labelStyle: TextStyle(fontSize: 13),
            tabs:const [
              Tab(text: "Personal Info",),
              Tab(text: "My Wallet",),
              Tab(text: "Token Bouns",),
            ],

          ),
          Expanded(child: TabBarView(
            controller: tabController,
            children: const [
               SingleChildScrollView(child: PersonalInfo()),
              SingleChildScrollView(child: MyWallet()),
              TokenBnus()
            ],
          ))


        ],
      ),
    );
    });
  }
}