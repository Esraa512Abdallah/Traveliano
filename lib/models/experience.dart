import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:traveliano/models/user.dart';
import 'package:traveliano/services/admin.dart';

import 'city.dart';

class Experience{

String reccommendedWeather;
String reccommendedType;

String cityId;
String userId;
double rate;
int likes;
bool currentUserLike;
int budget;
String description;
DateTime From,To,ExDate;
City cityModel;
User userModel;String Id;
double currentUserRate;

  String status;

  var hide;

  

Future<void> loadExperinceRate(context) async {

/* 
Firestore.instance.collection("Restaurants")
.document("ResId").collection("Rates").getDocuments().then((docs){

for(var document in docs.documents ){


document.
}


}); */

 



/* var userid=Provider.of<FirebaseUser>(context,listen: false).uid.toString();
await Firestore.instance.collection("Experience")
.document(this.Id).collection("Rates")
.where("userId",isEqualTo: userid)
.getDocuments().then((docs){

if(docs.documents.length==0)this.currentUserRate=0;
else this.currentUserRate= double.parse(docs.documents[0].data["rate"].toString()) ;
});
 */
this.currentUserRate=0;

}


  Future<void> loadCity() async {
    DocumentSnapshot ds = await Firestore.instance
        .collection("Cities").document(this.cityId).get();
    if (ds != null)
      this.cityModel = admin_ser().convertSnapToCity(ds);
  }

  Future<void> loadUser() async {
    DocumentSnapshot ds = await Firestore.instance
        .collection("Users").document(this.userId).get();
    if (ds != null)
      this.userModel = admin_ser().convertSnapToUser(ds);
  }

 Future<void> loadLikes(BuildContext context) async {
    

var userid=Provider.of<FirebaseUser>(context,listen: false).uid.toString();
await Firestore.instance.collection("Experience")
.document(this.Id).collection("Likes")
.getDocuments().then((docs){
  this.likes=docs.documents.length;

this.currentUserLike=false;

docs.documents.forEach((element) 
{

if(element.documentID==userid)this.currentUserLike=true;

 });

}

);







  }}