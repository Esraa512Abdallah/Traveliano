import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:traveliano/models/notification.dart';
import 'package:traveliano/adminScreens/users.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:traveliano/services/admin.dart';
import 'package:traveliano/services/user.dart';
import 'package:traveliano/userScreens/strangeProfile.dart';

class notificationS extends StatefulWidget {
/* 
String userId;
 notification({this.userId}); */
 
  @override
  _notificationSState createState() => _notificationSState();
}

class _notificationSState extends State<notificationS> {


 
 
  @override
  Widget build(BuildContext context) {
    var userId=Provider.of<FirebaseUser>(context,listen: false).uid;
    return 
    
    StreamBuilder(
    
    stream: Firestore.instance.collection("Users")
    .document(userId)
    .collection("Notifications").orderBy("timestamp",descending: true).snapshots() ,
    
    //initialData: initialData ,
    
    builder: (BuildContext context, AsyncSnapshot snap){
      
  

          return ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              // List rev = snap.data.documents.reversed.toList();
    notification not=  admin_ser()
    .convertSnapToNotification(snap.data.documents[index]);
      
      if(!snap.hasData){
        
        Center(child: CircularProgressIndicator());}
      
      
      return Notify(Notification:not ,);
              
            },
            itemCount: snap.data.documents.length,
          );

    },
  ); 
  }
}



/*Container(margin: EdgeInsets.only(top:5,left: 5),
  height: MediaQuery.of(context).size.height/1.11,
  color: Colors.grey[100],//red



  child:StreamBuilder(
    stream: Firestore.instance.collection("Users")
    .document(Provider.of<FirebaseUser>(context).uid)
    .collection("Notifications").orderBy("timestamp",descending: true).snapshots() ,
    
    //initialData: initialData ,
    
    builder: (BuildContext context, AsyncSnapshot snapshot){
      return ListView.builder(
        
        itemBuilder: (context, index) =>
                        Notification(context, snapshot.data.documents[index]),
                    itemCount: snapshot.data.documents.length,
      
      
      );
    },
  ),
) */







class Notify extends StatefulWidget {
  notification Notification;
  Notify({this.Notification});
  @override
  _NotifyState createState() => _NotifyState(this.Notification);
}

class _NotifyState extends State<Notify> {
notification noty;
  _NotifyState(notification noti){

this.noty=noti;

  }


Future<notification> _load() async {
 await noty.loadUser();

return noty;
} 



  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: _load(),
      //  initialData: InitialData,
        builder: (BuildContext context, AsyncSnapshot<notification> snapshot) {

     
      if(!snapshot.hasData){
        
  return 
                   Shimmer.fromColors(
direction: ShimmerDirection.ltr,
                     baseColor: Colors.white10,
                     highlightColor: Colors.black12,
                                    child:Container(

                                   
                             
                                    margin: EdgeInsets.all(2),
height: MediaQuery.of(context).size.width/4,

decoration: BoxDecoration(
color: Colors.grey,
borderRadius: BorderRadius.circular(15)

),

                                    )
                   );
  }

          return Notification(context, snapshot);
        
        
        
        
        
        
        
        
        
        
        },
      ),
    );
  }







Notification(BuildContext context, AsyncSnapshot<notification> snap)
{
//Timestamp time= snap.data['timestamp'];

return InkWell(

  onTap: () async {



/* if(snap.data.type=='follow'){


  

int x=await user_services().getTrips(snap.data.userModel.Id);
int y=await user_services().getFollowing(snap.data.userModel.Id);
int z= await user_services().getFollowers(snap.data.userModel.Id);
var user =await Firestore.instance.collection("Users").document(snap.data.userModel.Id).get();
 var userModel= admin_ser().convertSnapToUser(user);
 Navigator.push(context,
      MaterialPageRoute(builder: (context)
      {return strangeProfile(selectedUser:userModel,followers:z ,following:y ,trips:x ,); }));
 

} */


  },
  child:   Container(
  
  color: Colors.white,
  
    height: MediaQuery.of(context).size.width/4.5,
  
    margin: EdgeInsets.only(bottom: 3),
  
    child: Row(
  
  
  
  children: <Widget>[
  
  
  
  Container(height: 60,width: 60,margin: EdgeInsets.only(left:5,right: 5),
  
    child:   ClipOval(
  
    
  
    
  
    
  
    child: Image.network(snap.data.userModel.Photo,fit: BoxFit.cover,),
  
    
  
    ),
  
  )
  
  ,
  
  Column(crossAxisAlignment: CrossAxisAlignment.end,
  
    children: <Widget>[
  
          Container(color:Colors.transparent, //Colors.indigo,
  
      
  
        margin: EdgeInsets.only(top: 7),
  
      
  
        width: MediaQuery.of(context).size.width/1.5,
  
      
  
        height:MediaQuery.of(context).size.width/6,
  
      
  
      child: Center(child: Text(snap.data.userModel.firstName+" "+snap.data.userModel.lastName+" "+snap.data.body,style:TextStyle(color: Colors.black87,fontWeight: FontWeight.w300,fontSize: 15,fontFamily: ""),)),
  
      ),
  
  
  
  
  
  
  
  
  
  Text(timeago.format(snap.data.timestamp),style: TextStyle(color: Colors.grey[300],fontSize: 10),),
  
  
  
  
  
  
  
    ],
  
  )
  
  
  
  ,
  
  /* Container(color: Colors.yellow,
  
  //  width: MediaQuery.of(context).size.width/8,
  
    height:MediaQuery.of(context).size.width/5,
  
  
  
  
  
    child: Text(timeago.format(time.toDate())),
  
  ) */
  
  
  
  ],
  
  
  
  
  
  
  
    )
  
  ),
);


}


}













