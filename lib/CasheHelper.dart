import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CasheHelper{
  static SharedPreferences? cashe;
  static init()async{
    cashe = await SharedPreferences?.getInstance();
  }
  static Future<bool> saveData( {@required String?value}) async{
    return await cashe!.setString('userid', value!);

  }
static getData({@required String? key}){
 return   cashe!.get(key!);
}
}