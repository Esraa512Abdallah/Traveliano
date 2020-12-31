import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:like_button/like_button.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:traveliano/adminScreens/dialog.dart';
import 'package:traveliano/adminScreens/experience/exComments.dart';
import 'package:traveliano/globals.dart';
import 'package:traveliano/models/city.dart';
import 'package:traveliano/models/experience.dart';
import 'package:traveliano/services/admin.dart';
import 'package:traveliano/services/user.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:traveliano/userScreens/strangeProfile.dart';
import 'package:traveliano/adminScreens/experience/experiencePage.dart';

class Experinces extends StatefulWidget {

String specificId;
Experinces({this.specificId});
  @override
  ExperincesState createState() => ExperincesState();
}



class ExperincesState extends State<Experinces> {

var filter=false;

var apply=false;
var country="Summer";
var type="Ski";

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
        //appBar: AppBar(title: Text("My Experince"),),




   appBar: widget.specificId==null&&Provider.of<FirebaseUser>(context).uid!="ktXwLhNqcQMVlTEcI7L88C0dIkA2"?AppBar(
        centerTitle: true,
              elevation:2,
    backgroundColor: Colors.white,
  actions: <Widget>[

Padding(
  padding: const EdgeInsets.all(12.0),
  child:   InkWell(
  
  
  
  child:Icon(Icons.filter_list,size: 30,color: Colors.blue,)
  ,
  onTap: (){

setState(() {
  filter=!filter;
  apply=false;
});



  },
  
  
  
  
  
  ),
)



  ],
    title: 
    
     Shimmer.fromColors(
       period: Duration(seconds:4),
    baseColor: Colors.indigo[300],
    highlightColor: Colors.teal[100],
    child:  Text("Experiences",
    
        
    
        style:TextStyle(color:Colors.black,
    
        
    
        fontSize: 20,
    
        
    
        fontWeight: FontWeight.w500)
        )
  ),
   
    
    
            ):null,




        body: SafeArea(
      child: filter==true? FilterWidget():FutureBuilder(
//stream: admin_ser().getExperienceStream(),
        future: 
        
      widget.specificId==null? filter==false&&apply==true?
        Firestore.instance.collection("Experience")
        .where("reccomendedWeather",isEqualTo: country)
        .where("reccommendedType",isEqualTo: type).getDocuments()
        
                           :
        Firestore.instance.collection("Experience").orderBy("timestamp",descending: true).getDocuments()
        
        :
        Firestore.instance.collection("Experience")
  .where("userid",isEqualTo: widget.specificId)
  .getDocuments(),

        //stream: Firestore.instance.collection("Experience").snapshots(),
        builder: (context, snap) {

if(snap.hasError){

print ("1st Error stream  :   "+snap.error.toString());

}

        if (!snap.hasData) return Center(
            child: CircularProgressIndicator()); 
            
            
             if(snap.data.documents.length==0) return Container(
    color:Colors.white,
    child: Center(child:Column(mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[

        Icon(Icons.mood_bad,size: 300,color: Colors.grey[200],),
        Text("Oops, there aren't any experience to display ",textAlign: TextAlign.center,style: TextStyle(fontSize: 18,color: Colors.grey),),
      ],
    )));

          
////////////////where are you
          return ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              // List rev = snap.data.documents.reversed.toList();

              Experience ex;
              ex = admin_ser()
                  .convertSnapToExperince(snap.data.documents[index]);

              return ExCi(ex);
            },
            itemCount: snap.data.documents.length,
          );
        },
      ),
    ));
  }



Widget FilterWidget() {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Align(
              child: Text(
                "Filters:",
                style: TextStyle(
                    fontFamily: "Baloo", color: Colors.red, fontSize: 20.0),
              ),
              alignment: Alignment.topLeft),
   
          Container(
            //width: 200,height: 100,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButtonFormField(
                //isDense: true,isExpanded: true,
                decoration: InputDecoration(

                    //  icon: Icon(Icons.keyboard_arrow_down),
                    //     iconEnabledColor: Colors.blue,
                    ),

                value: country,

                hint: Text(" ..."),
                // disabledHint: Text("Travel with ...."),
                onSaved: (val) {
                  country = val;
                },
                onChanged: (val) {
                  setState(() {
                  country= val;
                  });
                },
                items:
                  ["Winter","Summer","Autumn","Spring"]
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    child: Text(value),
                    value: value,
                  );
                }).toList(),
              ),
            ),
          ),
     
  Container(
            //width: 200,height: 100,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButtonFormField(
                //isDense: true,isExpanded: true,
                decoration: InputDecoration(

                    //  icon: Icon(Icons.keyboard_arrow_down),
                    //     iconEnabledColor: Colors.blue,
                    ),

                value: type,

                hint: Text(" ..."),
                // disabledHint: Text("Travel with ...."),
                onSaved: (val) {
                  type = val;
                },
                onChanged: (val) {
                  setState(() {
                  type= val;
                  });
                },
                items:
                  ["Ski","Religous","Discovery","Honeymoon","Historic","Coastal"]
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    child: Text(value),
                    value: value,
                  );
                }).toList(),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                FlatButton(
                  child: Text("Cancel"),
                  onPressed: () {
                    setState(() {
                      filter = false;
                      apply = false;
                    });
                  },
                ),
                RaisedButton(
                  onPressed: () {
                    setState(() {
                      apply = true;
                      filter=false;
                      // isFilter=false;
                    });
                  },
                  child: Text(
                    "Apply",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.orange,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}

class ExCi extends StatefulWidget {
  Experience _experience;
  ExCi(Experience experience) {
    this._experience = experience;
  }
  @override
  _ExCiState createState() => _ExCiState(this._experience);
}

class _ExCiState extends State<ExCi>  {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  Experience _experience;
  _ExCiState(Experience experience) {
    this._experience = experience;
  }
  Future<Experience> _load() async {
    await _experience.loadUser();
    await _experience.loadCity();
    await _experience.loadExperinceRate(context);
    await _experience.loadLikes(context);
    return _experience;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 500,
      color: Colors.white,
      child: FutureBuilder(
          future: _load(),
          builder: (context, AsyncSnapshot<Experience> snap) {
            if (!snap.hasData) return 
            
      
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

Container(
  height: 5,width: MediaQuery.of(context).size.width/1.15,color: Colors.grey[100]
,margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width/12, MediaQuery.of(context).size.height/3, 0, 0),

),

Container(
  height: 5,width: MediaQuery.of(context).size.width/1.2,color: Colors.grey[100]
,margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width/10, MediaQuery.of(context).size.height/2.5, 0, 0),

),

Container(
  height: 5,width: MediaQuery.of(context).size.width/1.3,color: Colors.grey[100]
,margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width/8, MediaQuery.of(context).size.height/2.1, 0, 0),

),







                   Shimmer.fromColors(
direction: ShimmerDirection.ltr,
                     baseColor: Colors.white10,
                     highlightColor: Colors.black12,
                                    child:Container(

                                    margin: EdgeInsets.all(5),
height: 400,

decoration: BoxDecoration(
color: Colors.grey,
borderRadius: BorderRadius.circular(20)

),

                                    )
                   ),
                 ],
               ); 

            ///print(snap.data.cityModel.Name+"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@21");

            return //Text(snap.data.description);

                ExWidget(snap);
          }),
    );
  }

  Widget ExWidget(AsyncSnapshot<Experience> snap) {
    
    return InkWell(
      onTap: (){


  Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => experiencePage(exp:snap)));
                   
    
                                               


      },
          child: Container(  constraints: BoxConstraints(
            maxHeight: 350,minHeight: 300),
        child: Column(
          children: <Widget>[
            Stack(
              overflow: Overflow.visible,
              children: <Widget>[
                Container(
                color: snap.data.userModel.Id==Provider.of<FirebaseUser>(context,listen: false).uid?Colors.white70:Colors.white,
                   
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(33.0),
                    ),
                    elevation: 0,
                   margin:
                        EdgeInsets.only(bottom: 10, right: 10, left: 10, top: 5),
                    child: Container(
                      padding: EdgeInsets.all(8),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: <Widget>[

                                  
                                  Container(
                                    height: 70,
                                    width: 70,
                                    decoration: BoxDecoration(
                                        color: Colors.teal,
                                        image: new DecorationImage(
                                            image:       snap.data.userModel.Photo!=null? 
                                            NetworkImage(
                                                snap.data.userModel.Photo):AssetImage("images/defaultuser.png",),
                                            fit: BoxFit.cover),
                                        shape: BoxShape.circle),
                                  ),
                                  Container(color: Colors.transparent,
                                    padding: EdgeInsets.only(top: 5),
                                    margin: EdgeInsets.only(left: 11),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[



                             Container(
                                               constraints: BoxConstraints(minWidth: 100, maxWidth: 230,maxHeight: 100,),
                                         //    color: Colors.white,
                                                //                               height: 50,
                                                                               child: Row(
                                          children: <Widget>[
                                            InkWell(

                                              onTap: () async {

var doc= await Firestore.instance.collection("Users")
.document(Provider.of<FirebaseUser>(context,listen: false).uid)
.collection("Following").document(snap.data.userId).get();
if(doc.data==null){
snap.data.userModel.follow=false;

}else  {snap.data.userModel.follow=true;
}

int x=await user_services().getTrips(snap.data.userId);
int y=await user_services().getFollowing(snap.data.userId);
int z= await user_services().getFollowers(snap.data.userId);

 Navigator.push(context,
        MaterialPageRoute(builder: (context)
        {return strangeProfile(selectedUser:snap.data.userModel,followers:z ,following:y ,trips:x ,); }));
 





                                              },
                                                                     child: Text(snap.data.userModel.firstName,
                                                  style: TextStyle(
                                                      color: Colors.teal,
                                                      fontSize: 17,
                                                      fontFamily: 'Bitter',
                                                      fontWeight: FontWeight.w600)),
                                            ),
                                            Text(" "),
                                            Text(snap.data.userModel.lastName,
                                                style: TextStyle(
                                                    color: Colors.teal,
                                                    fontSize: 17,
                                                    fontFamily: 'Bitter',
                                                    fontWeight: FontWeight.w600)),


                                          /*      Text(" "+snap.data.userModel.lastName,
                                                style: TextStyle(
                                                    color: Colors.teal,
                                                    fontSize: 17,
                                                    fontFamily: 'Bitter',
                                                    fontWeight: FontWeight.w600)), */


                                          ],
                                                                               ),
                                                                             ),


  
                                        SizedBox(
                                          height: 2,
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Text(snap.data.userModel.hometown,
                                                style:
                                                    TextStyle(color: Colors.grey)),

                                                    
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          //   crossAxisAlignment: CrossAxisAlignment.end,
                                          children: <Widget>[
                                            Text(
                                                //"Time Stamp"
                                                //   snap.data.ExDate.,
                                                timeago.format(snap.data.ExDate),
                                                style:
                                                    TextStyle(color: Colors.grey)),

                                            //           SvgPicture.asset('images/khalifa.svg',height: 30,width:30,color:Colors.pink[300] ,),
                                       /*      Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),

                                            Text(snap.data.rate.toString(),
                                                style: TextStyle(
                                                    color: Colors.blue[500])), */
                                          ],
                                        ),
                                        SizedBox(
                                          height: 3,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),

            
                        
                        
                            ],
                          ),

                          Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(top: 16, bottom: 16),
                                child: Column(
                                  // crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
                                    /***********************************************************************************************************/

                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text("Traveled To ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600)),
                                        Card(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(18.0),
                                          ),
                                          // elevation:2,
                                          color: Colors.grey[200],
                                          //          margin:EdgeInsets.only(right:5,left:190 ),
                                          // padding:EdgeInsets.all(10 ),

                                          child: Row(
                                            // crossAxisAlignment: CrossAxisAlignment.start,

                                            children: <Widget>[
                                              Container(
                                                padding: EdgeInsets.all(10),
                                                child: Row(
                                                  children: <Widget>[
                                                    Text(
                                                      snap.data.cityModel.Name,
                                                      style: TextStyle(
                                                          color: Colors.teal,
                                                          fontWeight:
                                                              FontWeight.w800,
                                                          fontFamily:
                                                              'ShadowsIntoLight',
                                                          fontSize: 20),
                                                    ),

                                                    //    Text(' city',style:  TextStyle(color: Colors.teal,
                                                    //      fontWeight:FontWeight.w800,fontFamily: 'ShadowsIntoLight',fontSize:20 ),),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
/***********************************************************************************************************/
                                    SizedBox(
                                      height: 13,
                                    ),
                                    Column(
                                      children: <Widget>[
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Container(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Text('From',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.w600)),
                                              //Text(,style: TextStyle(color: Colors.blue)),
                                              Card(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(18.0),
                                                ),
                                                // elevation:2,
                                                color: Colors.grey[200],
                                                //          margin:EdgeInsets.only(right:5,left:190 ),
                                                // padding:EdgeInsets.all(10 ),

                                                child: Row(
                                                  // crossAxisAlignment: CrossAxisAlignment.start,

                                                  children: <Widget>[
                                                    Container(
                                                      padding: EdgeInsets.all(10),
                                                      child: Row(
                                                        children: <Widget>[
                                                          Text(
                                                            snap.data.From.year
                                                                    .toString() +
                                                                "-" +
                                                                snap.data.From.month
                                                                    .toString() +
                                                                "-" +
                                                                snap.data.From.day
                                                                    .toString(),
                                                            style: TextStyle(
                                                                color: Colors.red,
                                                                fontWeight:
                                                                    FontWeight.w500,
                                                                fontFamily: 'Chewy',
                                                                fontSize: 15),
                                                          ),

                                                          //    Text(' city',style:  TextStyle(color: Colors.teal,
                                                          //      fontWeight:FontWeight.w800,fontFamily: 'ShadowsIntoLight',fontSize:20 ),),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),

                                              Text(' To ',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.w600)),
                                              Card(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(18.0),
                                                ),
                                                // elevation:2,
                                                color: Colors.grey[200],
                                                //          margin:EdgeInsets.only(right:5,left:190 ),
                                                // padding:EdgeInsets.all(10 ),

                                                child: Row(
                                                  // crossAxisAlignment: CrossAxisAlignment.start,

                                                  children: <Widget>[
                                                    Container(
                                                      padding: EdgeInsets.all(10),
                                                      child: Row(
                                                        children: <Widget>[
                                                          Text(
                                                            snap.data.To.year
                                                                    .toString() +
                                                                "-" +
                                                                snap.data.To.month
                                                                    .toString() +
                                                                "-" +
                                                                snap.data.To.day
                                                                    .toString(),

                                                            /*  snap.data.To.toString()*/
                                                            style: TextStyle(
                                                                color: Colors.red,
                                                                fontWeight:
                                                                    FontWeight.w500,
                                                                fontFamily: 'Chewy',
                                                                fontSize: 15),
                                                          ),

                                                          //    Text(' city',style:  TextStyle(color: Colors.teal,
                                                          //      fontWeight:FontWeight.w800,fontFamily: 'ShadowsIntoLight',fontSize:20 ),),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Text('Budget ',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontFamily: '',
                                                    fontWeight: FontWeight.w600,
                                                  )),
                                              Card(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(18.0),
                                                ),
                                                // elevation:2,
                                                color: Colors.grey[200],
                                                //          margin:EdgeInsets.only(right:5,left:190 ),
                                                // padding:EdgeInsets.all(10 ),

                                                child: Row(
                                                  // crossAxisAlignment: CrossAxisAlignment.start,

                                                  children: <Widget>[
                                                    Container(
                                                      padding: EdgeInsets.all(10),
                                                      child: Row(
                                                        //    mainAxisAlignment: MainAxisAlignment.center,
                                                        children: <Widget>[
                                                          Text(
                                                            snap.data.budget
                                                                    .toString() +
                                                                '\$',
                                                            style: TextStyle(
                                                                color: Colors.red,
                                                                fontWeight:
                                                                    FontWeight.w500,
                                                                fontFamily: 'Chewy',
                                                                fontSize: 20),
                                                          ),

                                                          //    Text(' city',style:  TextStyle(color: Colors.teal,
                                                          //      fontWeight:FontWeight.w800,fontFamily: 'ShadowsIntoLight',fontSize:20 ),),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          //        Divider(
                          //        height:0.2 ,

                          //      color:Colors.grey[300],

                          //  ),
                          ////////////////////

                          ///////////////////////
                        ],
                      ),
                    ),
                  ),
                ),
                Divider(
                  height: 0,
                  thickness: 2,
                ),
                Positioned(
                  right: 10,
                  left: 10,
                  top:MediaQuery.of(context).size.width-90,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      

              Provider.of<FirebaseUser>(context).uid=="ktXwLhNqcQMVlTEcI7L88C0dIkA2"?IconButton(
   
   icon: Icon(Icons.delete),
   onPressed: () async {

  return Dialogs.yesAbortDialog(
                              context, snap.data.Id, "Experience");
     },
   
   
   ):Container(),
                      Container(
                          padding: EdgeInsets.only(top: 20),
                          child: FloatingActionButton(
                            mini: true,
                            elevation: 2,
                            heroTag: DateTime.now(),
                            backgroundColor: Colors.cyan[50],
                            child: Icon(Icons.expand_less,size:40,color: Colors.blue,),
                            onPressed: () async{

bottomSheet(context,   Container(
                                  color: Colors.transparent,
                                  padding: EdgeInsets.all( 15),
                                  child: Container(
                                    //  elevation: 0.0,
                           //         height: 110,
                                    constraints: BoxConstraints(maxHeight: 200),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: <Widget>[
                              
                              
                  Text(snap.data.status+" Trip",style:TextStyle(fontSize: 20,fontWeight: FontWeight.w600)) ,           
                              

                                          Text(
                                              snap.data.description.toString(),
                                              style: TextStyle(
                                                  height: 1.5,
                                                  fontSize: 15,
                                                  color: Colors.black54,
                                                  fontFamily: '')),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),);


                             
/* 
Navigator.push(context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation)=> ExpComments(ExpId:_experience.Id),
   transitionDuration: Duration(milliseconds: 2000),
   transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
          
          return SlideTransition(

            position: Tween<Offset>(
              begin: const Offset(1.0, 0.0),
              end: Offset.zero,
            ).animate(animation),
            child: SlideTransition(
              position: Tween<Offset>(
                begin: Offset.zero,
                end: const Offset(1.0, 0.0),
              ).animate(secondaryAnimation),
              child: child,
            ),
          );
        
        }
              
              )
              
                ); */










                              //                print(snapshot2.data.documents[index].documentID+"           ######### User id");
                              //                   print(snapshot3.data.documents[index].documentID+"           ######### City id");
                            },
                          )
                          ),
                      
                      
                    // _experience.userId==Provider.of<FirebaseUser>(context,listen: false).uid? Container():
                      Container(
                        child: /* Icon(FontAwesomeIcons.solidHeart,
                        size: 50,color: Colors.grey[300]) */
                        LikeButton(
padding: EdgeInsets.only(top:15),
isLiked: snap.data.currentUserLike,
size: 40,

onTap: (bool isLiked) async {

if(isLiked==false){

await Firestore.instance.collection("Experience")
.document(snap.data.Id).collection("Likes")
.document(Provider.of<FirebaseUser>(context,listen: false).uid)
.setData({"timestamp":DateTime.now()});


}else{
  await Firestore.instance.collection("Experience")
.document(snap.data.Id).collection("Likes")
.document(Provider.of<FirebaseUser>(context,listen: false).uid)
.delete();

}

return !isLiked;

},


  likeBuilder: (bool isLiked) {
            return Icon(
              FontAwesomeIcons.solidHeart,
              color: isLiked ? Colors.red : Colors.grey,
              size: 40,
            );
          },
        
 likeCount: snap.data.likes,
          countBuilder: (int count, bool isLiked, String text) {
            var color = isLiked ? Colors.deepPurpleAccent : Colors.grey;
            Widget result;
            if (count == 0) {
              result = Text(
                "Love",
                style: TextStyle(color: color),
              );
            } else
              result = Text(
                text,
                style: TextStyle(color: color),
              );
            return result;
          },
                        ),
                        
                        
                        
                        /* SmoothStarRating(
                            allowHalfRating: true,
                            onRatingChanged: (val) async {
                              if (_experience.currentUserRate == 0) {
                                await Firestore.instance
                                    .collection("Experience")
                                    .document(_experience.Id)
                                    .collection("Rates")
                                    .add({
                                  "userId": Provider.of<FirebaseUser>(context,listen: false)
                                      .uid
                                      .toString(),
                                  "rate": val
                                });
                                setState(() {
                                  _experience.currentUserRate = val;
                                });
                              } else {
                                String rateID;
                                await Firestore.instance
                                    .collection("Experience")
                                    .document(_experience.Id)
                                    .collection("Rates").where("userId",
                                    isEqualTo:Provider.of<FirebaseUser>(context,listen: false).uid)
                                    .getDocuments()
                                    .then((docs) {
                                  rateID = docs.documents.first.documentID;
                                });

                                if (val == _experience.currentUserRate) {
                                  await Firestore.instance
                                      .collection("Experience")
                                      .document(_experience.Id).collection("Rates")
                                      .document(rateID)
                                      .delete();

                                  setState(() {
                                    _experience.currentUserRate = 0;
                                  });
                                } else {
                                  await Firestore.instance
                                      .collection("Experience")
                                      .document(_experience.Id).collection("Rates")
                                      .document(rateID)
                                      .updateData({"rate": val});

                                          setState(() {
                                    _experience.currentUserRate = val;
                                  });
                                }
                              }
                            },
                            starCount: 5,
                            rating: _experience.currentUserRate,
                            size: 30.0,
                            color: Colors.amber,
                            borderColor: Colors.teal,
                            spacing: 0.0), */
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}











/*

  Padding(
    padding: const EdgeInsets.fromLTRB(3,0,3,0),
    child: Container(


child: Row(
  mainAxisAlignment: MainAxisAlignment.spaceAround,
children: <Widget>[


Container(width:MediaQuery.of(context).size.width/1.25,
child:TextFormField(
  initialValue: commentText,
  onChanged: (val){
commentText=val;
  },
autocorrect: true,
cursorColor: Colors.black,
cursorWidth: 1,
decoration:InputDecoration(
enabledBorder: 
OutlineInputBorder(

borderSide: BorderSide(color: Colors.grey,width: 9),
borderRadius: BorderRadius.circular(50)

),
contentPadding: EdgeInsets.all(10),
border: 
OutlineInputBorder(

borderSide: BorderSide(color: Colors.grey,width: 9),
borderRadius: BorderRadius.circular(50)

),



) 




)



)
,
InkWell(
  
  onTap: () async {


if(commentText!=null&&commentText!=""){


await Firestore.instance.collection("Experience")
.document(widget.ExpID).collection("Comments").add({

"comment":commentText,
"userId":Provider.of<FirebaseUser>(context).uid,
"timestamp":DateTime.now(),


});

setState(() {
  commentText="";
});


}




  },
  child: ( Icon(Icons.send,color: Colors.green,size: 30,)))

],


),

    ),
  ),


*/

















/*   Container(
      padding: EdgeInsets.all(10),
child: Row(

  crossAxisAlignment: CrossAxisAlignment.start,
  children: <Widget>[
    ClipOval(
      child: Image.network(snap.data.userModel.Photo,height: 50,)),
        Expanded(//color: Colors.black,
     
     //    width: MediaQuery.of(context).size.width/1.4,
         //margin: EdgeInsets.only(left:5),
          child: Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                Text(snap.data.userModel.firstName+" "+snap.data.userModel.lastName,
                style: TextStyle(fontFamily: "",fontWeight: FontWeight.w600
                ,color: Colors.purple),
                
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
                    
                    ,style: TextStyle(fontFamily: "",fontWeight: FontWeight.w600),
                    
                    
                    ),
                  ),color: Colors.grey[100],),
              ],
            ),
          )),
  ],
),
 ) ;*/