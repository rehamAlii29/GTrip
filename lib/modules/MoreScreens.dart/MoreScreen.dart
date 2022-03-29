import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gtrip/AppCubit.dart';
import 'package:gtrip/AppStates.dart';
import 'package:gtrip/modules/MoreScreens.dart/MyWallet.dart';
import 'package:gtrip/modules/MoreScreens.dart/Personalinfo.dart';

import 'TokenBnus.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
        listener: (context , state){},
    builder: (context , state){
    return DefaultTabController(
      length: 3,

      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          toolbarHeight: MediaQuery.of(context).size.height*.3,

toolbarOpacity: 0,
primary: false,
titleSpacing: 0,
elevation: 0,
centerTitle: true,
flexibleSpace:Column(
  children: [
        Container(

    height: MediaQuery.of(context).size.height*.3,
    width: MediaQuery.of(context).size.width,
    child: Stack(
      alignment: AlignmentDirectional.bottomStart,
      children: [
              Container(
                height: MediaQuery.of(context).size.height*.3,
                width: MediaQuery.of(context).size.width,
                child: Image.asset('assets/images/Vector4.png',

                  fit: BoxFit.fill,

          ),
              ),
          Padding(
            padding: const EdgeInsets.only(left: 20,bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage('${AppCubit.get(context).imageoffacebook}'),

                ),
                IconButton(onPressed: (){}, icon:FaIcon(FontAwesomeIcons.solidPenToSquare, size: 20,))
              ],
            ),
          )
      ],
    ) ,
            ),

    Padding(
      padding: const EdgeInsets.only(left: 20,),
      child: Row(children: [
        Text("User name", style: TextStyle(color: Colors.black, fontSize: 20)),


        IconButton(onPressed: (){}, icon: FaIcon(FontAwesomeIcons.solidPenToSquare,size: 15,))
      ],),
    ),

  ],
),

        bottom: TabBar(
          labelColor: Colors.black,

          tabs: [
          Tab(text: "Personal Info",),
          Tab(text: "My Wallet",),
          Tab(text: "Token Bouns",),
        ],

        ),
        ),
        body: TabBarView(
          children:[
            PersonalInfo(),
            MyWallet(),
            TokenBnus()

          ],
        ),











      ),
    );});
  }
}
