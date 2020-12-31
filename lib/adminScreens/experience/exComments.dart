
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:traveliano/adminScreens/experience/exComments.dart';
import 'package:traveliano/animation/fadeAnimmation.dart';
import 'package:traveliano/models/Comment.dart';
import 'package:traveliano/models/city.dart';
import 'package:traveliano/models/experience.dart';
import 'package:traveliano/services/admin.dart';
import 'package:traveliano/services/user.dart';
import 'package:timeago/timeago.dart' as timeago;

class ExpComments extends StatefulWidget {


String ExpId;
ExpComments({this.ExpId});

  @override
  ExpCommentsState createState() => ExpCommentsState();
}

class ExpCommentsState extends State<ExpComments> {
  String commentText;
  TextEditingController _controller=new TextEditingController();
 ScrollController _scrollController=new ScrollController();
  @override
  Widget build(BuildContext context) {


    return Scaffold(
 // resizeToAvoidBottomPadding: true,
backgroundColor: Colors.transparent,
        body: ListView(
          children: <Widget>[



    Container(
           
           
           
           height: MediaQuery.of(context).size.height/11,
           color: Colors.white,
           
           
           child: 
  Padding(
    padding: const EdgeInsets.fromLTRB(3,0,3,0),
    child: Container(


child: Provider.of<FirebaseUser>(context).uid!="ktXwLhNqcQMVlTEcI7L88C0dIkA2"?Row(
  mainAxisAlignment: MainAxisAlignment.spaceAround,
children: <Widget>[


Container(width:MediaQuery.of(context).size.width/1.3,
child:TextFormField(

 
  onChanged: (val){
commentText=val;
  }
  ,
  
  
  controller: _controller,
  
autocorrect: true,
cursorColor: Colors.black,
cursorWidth: 1,
decoration:InputDecoration(filled: true,fillColor: Colors.black12,
hintText: "Write a Comment ...",
hintStyle: TextStyle(fontWeight: FontWeight.w400),
focusedBorder:OutlineInputBorder(

borderSide: BorderSide(color: Colors.white30,width: .5),
borderRadius: BorderRadius.circular(50)

),

enabledBorder: 
OutlineInputBorder(

borderSide: BorderSide(color: Colors.grey,width: 0.5),
borderRadius: BorderRadius.circular(50)

),
contentPadding: EdgeInsets.all(13),




) 




)



)
,
InkWell(
  
  onTap: () async {


if(commentText!=null&&commentText!=""){


await Firestore.instance.collection("Experience")
.document(widget.ExpId).collection("Comments").add({

"comment":commentText,
"userId":Provider.of<FirebaseUser>(context,listen: false).uid,
"timestamp":DateTime.now(),


});

setState(() {

  commentText="";
_controller.text="";

});
 Timer(Duration(milliseconds: 1000), () => _scrollController.jumpTo(_scrollController.position.maxScrollExtent));

}




  },
  child: ( Icon(Icons.send,color: Colors.blue,size: 30,)))

],


):Container(),

    ),
  ),

           
           
           
           
           )
         
         
         ,

            Container(
              padding: EdgeInsets.only(bottom: 10,top: 9),
        decoration: BoxDecoration(
color: Colors.white,
          borderRadius: BorderRadius.circular(40)
        ),
           //   color: Colors.greenAccent,
              height: MediaQuery.of(context).size.height/1.14,
              
              child: StreamBuilder(
//stream: admin_ser().getExperienceStream(),
                stream: Firestore.instance.collection("Experience")
                .document(widget.ExpId).collection("Comments").orderBy("timestamp",descending: false).snapshots(),
//stream: Firestore.instance.collection("Experience").snapshots(),
                builder: (context, snap) {
                  if (!snap.hasData) return Center(child: CircularProgressIndicator());



if(snap.data.documents.length==0)return Column(
  
  mainAxisAlignment: MainAxisAlignment.center,
  children: <Widget>[

Icon(Icons.mode_comment,size: 150,color: Colors.grey[200],)

,
Padding(
  padding: const EdgeInsets.all(8.0),
  child:   Text("No one has commented ,be the first one to add a comment",
  
  
  textAlign: TextAlign.center,
style: TextStyle(fontWeight: FontWeight.w300,color: Colors.grey,fontSize: 18),
  
  ),
)

],);
  
            
       
                  return ListView.builder(
                    controller: _scrollController,
                    itemBuilder: (BuildContext context, int index) {
                      // List rev = snap.data.documents.reversed.toList();

                      Comment cmt;
 cmt = admin_ser().convertSnapComment(snap.data.documents[index]);
                      return Expcomment(cmt,widget.ExpId);
                    },
                    itemCount: snap.data.documents.length,
                  );
                },
              ),
         
         
         
         
            ),
         
         
         
      
         
          ],
        ));
  }
}

class Expcomment extends StatefulWidget {
  Comment _comment;
  String ExpID;
  Expcomment(Comment comment,String _ExpID) {
    this._comment = comment;
  this.ExpID=_ExpID;
  }
  @override
  _ExpcommentState createState() => _ExpcommentState(this._comment);
}

class _ExpcommentState extends State<Expcomment> with SingleTickerProviderStateMixin {
 
  Comment comment;
  _ExpcommentState(Comment _comment) {
    this.comment = _comment;
  }
  Future<Comment> _load() async {
    await comment.loadUser();
    return comment;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: this._load(),
     // initialData: InitialData,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
      
           if (!snapshot.hasData) return 
        Stack(
                 children: <Widget>[



Container(height: 80,width: 80,
    
    margin: EdgeInsets.only(top:20,left: 20),
    
    decoration: BoxDecoration(
    
    color: Colors.grey[100],
    
    borderRadius: BorderRadius.circular(80)
    
    
    
    ),
    
      
    
    )

                   ,

Container(
  height: 6,width: MediaQuery.of(context).size.width/2,color: Colors.grey[100]
,margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width/3, MediaQuery.of(context).size.height/12, 0, 0),

),Container(
  height: 6,width: MediaQuery.of(context).size.width/3,color: Colors.grey[100]
,margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width/3, MediaQuery.of(context).size.height/8, 0, 0),

),










                   Shimmer.fromColors(
direction: ShimmerDirection.ltr,
                     baseColor: Colors.white10,
                     highlightColor: Colors.black12,
                                    child:Container(

                                   
                             
                                    margin: EdgeInsets.all(2),
height: MediaQuery.of(context).size.width/3,

decoration: BoxDecoration(
color: Colors.grey,
borderRadius: BorderRadius.circular(20)

),

                                    )
                   ),
                 ],
               ); 

        return FadeAnimation(1,ExWidget(snapshot)) ;
      },
    );
  }

  Widget ExWidget(AsyncSnapshot<Comment> snap) {

    return
 
 Container(
      padding: EdgeInsets.all(10),
child: Row(

  crossAxisAlignment: CrossAxisAlignment.start,
  children: <Widget>[
    ClipOval(//borderRadius: BorderRadius.circular(100),
      child: Image.network(snap.data.userModel.Photo,height: 60,width: 60,fit: BoxFit.cover,)),
        Expanded(//color: Colors.black,
     
     //    width: MediaQuery.of(context).size.width/1.4,
         //margin: EdgeInsets.only(left:5),
          child: Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                InkWell(


onTap: (){


//navigator بروفايل اليوزر 

},

                                  child: Text(snap.data.userModel.firstName+" "+snap.data.userModel.lastName,
                  style: TextStyle(fontFamily: "",fontWeight: FontWeight.w600
                  ,color: Colors.purple),
                  
                  ),
                ),

Text(
  
  timeago.format(snap.data.timestamp),
        style: TextStyle(fontSize:10,color: Colors.grey )
),



                Card(
              shape: RoundedRectangleBorder(
    side: BorderSide(color: Colors.white54, width: 2),
    borderRadius: BorderRadius.circular(15),
  ),     
                  
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(snap.data.comment.toString()
                    
                    ,style: TextStyle(fontFamily: "",color: Colors.black87,fontWeight: FontWeight.w600),
                    
                    
                    ),
                  ),color: Colors.grey[100],),
              ],
            ),
          )),
  ],
),
 );


  }
}
