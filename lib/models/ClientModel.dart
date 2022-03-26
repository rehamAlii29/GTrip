class ClientModel{
  String? fullname;
  String? username;
String?userid;
  String? email;
  String? phone;
  String? image;
  ClientModel({this.fullname, this.username,this.email,this.phone, this.image, this.userid});

  ClientModel.fromfirebase(Map<String,dynamic> fromfirebase){
    fullname= fromfirebase['fullname'];
    username= fromfirebase['username'];
    email= fromfirebase['email'];
    phone= fromfirebase['phone'];
    image= fromfirebase['image'];
    username = fromfirebase['username'];

  }
  Map<String,dynamic> tofirebase (){
    return
    {
      'username':userid,
     'fullname': fullname,
      'username':username,
      'email': email,
      'phone':phone,
      'image':image,


    };
  }


}