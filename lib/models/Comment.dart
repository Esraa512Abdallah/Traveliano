import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:traveliano/models/user.dart';
import 'package:traveliano/services/admin.dart';

class Comment{

String comment;
String userId;
DateTime timestamp;

User userModel;

loadUser() async {

 DocumentSnapshot ds = await Firestore.instance
        .collection("Users").document(this.userId).get();
    if (ds != null)
      this.userModel = admin_ser().convertSnapToUser(ds);


}




}