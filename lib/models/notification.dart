import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:traveliano/models/user.dart';
import 'package:traveliano/services/admin.dart';

class notification
{

String title;
String body;
DateTime timestamp;
String imgUrl;
bool visited;
String type;
User userModel;
  var expId;

  String Id;
 
   Future<void> loadUser() async {
    DocumentSnapshot ds = await Firestore.instance
        .collection("Users").document(this.userModel.Id).get();
    if (ds != null){this.userModel = admin_ser().convertSnapToUser(ds);
    
    print("############################### user model "+this.userModel.firstName);
    }

  }






// NOTIFY FOLLOWERS WHEN ADDING A NEW EXPERIENCE
// NOTIFY EXPERIENCE WRITER WHEN SOMEONE COMMENTED or RATED 
// NOTIFY USER WHEN SOMEONE FOLLOWS HIM 








/* 
notify(Notification notification)
{
Firestore.instance.collection("Notification").add({


"userId":notification.userId,
"body":notification.body,
"imgUrl":notification.imgUrl,
"title":notification.title





});



}
 */



}