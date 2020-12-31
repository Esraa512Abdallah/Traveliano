
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

class TourismPlace{
  


double latitude;
double longtude;

  String Id;
  String Name;
  double rate;
  String cityId;

int cost;
String description;

  var photo;


 double currentUserRate;

  

Future<void> loadRate(context) async {

var userid=Provider.of<FirebaseUser>(context).uid.toString();
await Firestore.instance.collection("tourismPlaces")
.document(this.Id).collection("Rates")
.where("userId",isEqualTo: userid)
.getDocuments().then((docs){

if(docs.documents.length==0)this.currentUserRate=0;
else this.currentUserRate= double.parse(docs.documents[0].data["rate"].toString()) ;
});}


}