


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gtrip/AppCubit.dart';
import 'package:gtrip/AppStates.dart';

class PersonalInfo extends StatefulWidget {
  const PersonalInfo({Key? key}) : super(key: key);

  @override
  _PersonalInfoState createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<AppCubit, AppStates>(
        listener: (context, state){},
        builder: (context, state) {

          return
             Padding(
                padding: const EdgeInsets.all(20),
          child: Column(children: [

          Text("Email"),
          SizedBox(height:25 ,),
          Row(
            children: [
                Expanded(
                  child: TextFormField(

                  ),
                ),
                SizedBox(width: 20,),
                IconButton(onPressed: (){}, icon: FaIcon(FontAwesomeIcons.solidPenToSquare,size: 15,)),
            ],
          ),

          Text("Email"),
          ],),
          






          //

              );}
    );
  }
}
