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

class MoreScreen extends StatefulWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override

  State<MoreScreen> createState() => _MoreScreenState();
}

var usernamecontroller = TextEditingController();

class _MoreScreenState extends State<MoreScreen>
    with SingleTickerProviderStateMixin
{
  TabController? _tabController;
@override
void initState() {
  _tabController = new  TabController(length: 3, vsync: this);
  super.initState();
}
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
        listener: (context , state){

        },
    builder: (context , state){
      var data = AppCubit.get(context).clientModel;
      usernamecontroller.text!= data!.username;
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
            padding: const EdgeInsets.only(left: 20,bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
              
                  radius: 50,
                  backgroundImage: NetworkImage('${data.image}'),

                ),
                IconButton(onPressed: (){
                  AppCubit.get(context).updateprofileimage();
                }, icon:FaIcon(FontAwesomeIcons.solidPenToSquare, size: 20,))
              ],
            ),
          )
        ],
      ) ,
      ),

        ///////////////////
          Padding(
            padding: const EdgeInsets.only(left: 20,),
            child: Row(children: [
Container(height: 40,width: 80,

  child: TextFormField(
    controller: usernamecontroller,
  ),),

              IconButton(onPressed: (){
                AppCubit.get(context).updateNameEmailPhone(username: usernamecontroller!.text);
              }, icon: FaIcon(FontAwesomeIcons.solidPenToSquare,size: 15,))
            ],),
          ),
////////////// part bta3 tab veiw

        TabBar(
          labelColor: Colors.black,
      controller: _tabController,

      tabs:[
            Tab(text: "Personal Info",),
            Tab(text: "My Wallet",),
            Tab(text: "Token Bouns",),
          ],

        ),
          Expanded(child: TabBarView(
            controller: _tabController,
            children: [
              PersonalInfo(),
              MyWallet(),
              TokenBnus()
            ],
          ))


        ],
      ),
    );
        });
  }
}
