
// @dart=2.9

import 'package:google_maps_flutter/google_maps_flutter.dart';

class AgenceModel {
String title,image,wilaya,email;
LatLng LL;
int number;


AgenceModel({this.title,this.image,this.LL,this.number,this.wilaya,this.email});
AgenceModel.fromJson(Map<dynamic, dynamic> map){
  title = map['title'];
  image = map['image'];
  LL= LatLng(map['LL'].latitude, map['LL'].longitude);
 number = map['number'];
  wilaya = map['wilaya'];
  email = map['email'];
toJson(){
  return {
    'title':title,
  'image':image,
  'LL':LL,
  'number':number,
  'wilaya':wilaya,
  };
}
}
}