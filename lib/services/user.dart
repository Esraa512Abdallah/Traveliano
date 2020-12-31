import 'dart:async';
import 'dart:core' as prefix0;
import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:traveliano/models/experience.dart';
import 'package:traveliano/models/user.dart';

class user_services{


FirebaseAuth _auth=FirebaseAuth.instance;

Future resetPassword(String email)async{

try{
await _auth.sendPasswordResetEmail(email: email);
return 1;
}catch(e){

return 0;


}
}


getFollowers(String Id) async {
  int x=0;
 await Firestore.instance

.collection("Users").document(Id)
.collection("Followers").getDocuments().then((docs){

x= docs.documents.length;

});
return x;
}
getFollowing(String Id) async {
  int x=0;
 await Firestore.instance

.collection("Users").document(Id)
.collection("Following").getDocuments().then((docs){
x= docs.documents.length;

});
return x;
}

getTrips(String Id) async {
int x=0;
 await Firestore.instance

.collection("Experience")
.where("userid",isEqualTo: Id)
.getDocuments().then((docs){

x= docs.documents.length;

});
return x;

}



















 Future getConnectedUserExperinces(context) {

 
var x=  Firestore.instance.collection("Experience").getDocuments();

return x;
}


Stream<FirebaseUser> get userStream{

  return _auth.onAuthStateChanged/*.map((FirebaseUser user)=>user!=null?User)*/;
}





Future signOut() async {

try{
print("object____________________________Sign out completed");
return await _auth.signOut();

}catch(e){
print("object____________________________Sign out failed");


}


}


Future getUser2(id){

return Firestore.instance.collection("Users").document(id).get();
  
} 



addCommentEx(context,String comment,String ExperienceID) async {


await Firestore.instance.collection("Experience").
document(ExperienceID).collection("Comments")
.document(Provider.of<FirebaseUser>(context).uid.toString())
.setData({

"comment":comment,

"timestamp":DateTime.now(),



});





}






Future getConnectedUser(BuildContext context) async {
//var m;


return Firestore.instance
.collection("Users")
.document(Provider.of<FirebaseUser>(context)
   .uid.toString()).get();




}



signup_user(User user) async {

//  FirebaseUser result= await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //   email: user.email, password: user.password);

if(1==1){

//user.Id=result.uid;



CollectionReference db= await Firestore.instance.collection("Users");

FirebaseMessaging().getToken().then((value){




var data={
 
  "lastName":user.lastName,
"firstName":user.firstName,
"hometown":user.hometown,
//"password":user.password,
"registrationDate":user.registrationDate,
//"email":user.email,
"birthday":user.birthday,
"photo":user.Photo,
"blocked":false,
"token": value,
"active":true
};

db.document(user.Id).setData(data);





});return true;

}else

 return false;

}





}



