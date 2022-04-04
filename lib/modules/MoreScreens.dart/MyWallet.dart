import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gtrip/modules/MoreScreens.dart/ChargeMyWallet.dart';

class MyWallet extends StatefulWidget {
  const MyWallet({Key? key}) : super(key: key);

  @override
  State<MyWallet> createState() => _MyWalletState();
}

class _MyWalletState extends State<MyWallet> {
  @override
  Widget build(BuildContext context) {
    return Expanded(

        child: Column(children: [
          Row(
           mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
              crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Wallet Ballance '),
                  SizedBox(height: 5,),
                  Text('\$2,000.00' , style: TextStyle(fontWeight: FontWeight.bold),), // مفروض انها مرتبطة بال id بتاع اليوز
                ],
              )
            ],),
          SizedBox(height: 30,),
Row( mainAxisAlignment: MainAxisAlignment.start,

  children: [
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ChargeMyWallet()));
            },
            child: Container(
              padding: EdgeInsets.only(left: 10),
                  color: Colors.grey.withOpacity(.2),
        child: Row(  mainAxisAlignment: MainAxisAlignment.start,

            children: [

        Icon(Icons.credit_card),

        SizedBox(width: 10,),

        Text("Recharge my Wallet ", style: TextStyle(fontWeight: FontWeight.w500),)

      ],),),
          ),
  ],
)
        ],),

    );
  }
}
