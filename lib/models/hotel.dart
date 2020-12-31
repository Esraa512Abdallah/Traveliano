

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

class Hotel{




String Id;
String Name;
double rate;
String cityId;
double latitude;
double longtude;
int maxPrice;
int minPrice;

  String photo;

 Map<String , bool> services=
 {
'Free Wifi':false,
"Parking":false,
'Swimming Pool':false,
'Bar':false,
'Restaurant':false,
'Smoking Rooms':false,
'Room Service 24h':false,
'Air Cooling':false,
'Spa&Sauna':false,

 };


 double currentUserRate;

  

Future<void> loadRate(context) async {

var userid=Provider.of<FirebaseUser>(context).uid.toString();
await Firestore.instance.collection("accommodation")
.document(this.Id).collection("Rates")
.where("userId",isEqualTo: userid)
.getDocuments().then((docs){

if(docs.documents.length==0)this.currentUserRate=0;
else this.currentUserRate= double.parse(docs.documents[0].data["rate"].toString()) ;
});}

}


