import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TokenBnus extends StatefulWidget {
  const TokenBnus({Key? key}) : super(key: key);

  @override
  State<TokenBnus> createState() => _TokenBnusState();
}

class _TokenBnusState extends State<TokenBnus> {
  @override
  Widget build(BuildContext context) {
    return Expanded(

      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text('Token Ballance '),
                SizedBox(height: 5,),
                Text('500 Token' , style: TextStyle(fontWeight: FontWeight.bold),), //
              ],
            )
          ],),
        SizedBox(height: 30,),
        Row( mainAxisAlignment: MainAxisAlignment.start,

          children: [
            InkWell(
              onTap: (){

              },
              child: Container(
                padding: EdgeInsets.only(left: 10),
                color: Colors.grey.withOpacity(.2),
                child: Row(  mainAxisAlignment: MainAxisAlignment.start,

                  children: const [

                    Icon(Icons.credit_card),

                    SizedBox(width: 10,),

                    Text("Upgrade Token ", style: TextStyle(fontWeight: FontWeight.w500),)

                  ],),),
            ),
          ],
        )
      ],),

    );
  }
}


