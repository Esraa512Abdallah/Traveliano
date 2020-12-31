import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:traveliano/adminScreens/city/cityDetails.dart';
import 'package:traveliano/adminScreens/city/placeDetails.dart';
import 'package:traveliano/models/user.dart';
import 'package:traveliano/services/admin.dart';
import 'package:traveliano/services/user.dart';
import 'package:traveliano/userScreens/strangeProfile.dart';

class SearchPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SearchPageState();
  }

}
String SearchText=null;

// حط المتغير هنا


class SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  DefaultTabController(
          child: Scaffold(

appBar: AppBar(
  
  backgroundColor: Colors.white,
  
  title: 

       TextFormField(
         
             //   autofocus: true,
                cursorColor: Colors.black,
                cursorWidth: 1.0,
onChanged: (val){setState(() {
  SearchText=val;

});},
                decoration:InputDecoration(filled: true,
enabledBorder: UnderlineInputBorder(
  borderSide: BorderSide(color: Colors.transparent)
),

focusedBorder: UnderlineInputBorder(
  borderSide: BorderSide(width: 0,color: Colors.blueAccent)
) ,

                  hintText: 'What are you looking for ?',
                  hintStyle:TextStyle(color: Colors.grey),
                 suffixIcon:Icon(Icons.search,size: 30,
                 color: Colors.indigo[200],) ,
                //  suffixIcon: Icon(Icons.keyboard_voice,size: 30,),

                ),

              ),

              
              bottom: TabBar(indicatorSize: TabBarIndicatorSize.tab,
                indicatorPadding: EdgeInsets.all(0),
                isScrollable: true,
                unselectedLabelColor: Colors.red,
                indicator: BoxDecoration(

                   borderRadius: BorderRadius.circular(0),
                   color: Colors.red
                ),
                tabs: [
                Tab(
                  child: Text('Users'),
                  ),
                  
                  Tab(
                  child: Text('Hotels'),
                  ),
                  Tab(
                  child: Text('Attractions'),
                  ),
                  Tab(
                  child: Text('Restaurants'),
                  ),
                  Tab(
                  child: Text('Cities'),
                  ),
                  
                
               


                ]),






),

        body: TabBarView(children: [



          UsersFuture(),
        HotelsFuture(),
        TplacesFuture(),
         ResFuture(),
         CitiesFuture()



        ]),

   
   
      ), length: 5,
    );
  }



Widget NotFound(){


return Container(
  child:   ListView(
  
   // mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
  
    children: <Widget>[
  
  
  
      Padding(
        padding: const EdgeInsets.only(top:50 ),
        child: Icon(Icons.sentiment_dissatisfied,size: MediaQuery.of(context).size.width-100,color: Colors.grey,),
      ),
  
          Center(child: Text("Sorry,There are not results to show",style: TextStyle(fontWeight: FontWeight.w300,color: Colors.grey),)),
  
    ],
  
  ),
);







}

Widget UsersFuture(){
if(SearchText==null)return Center(child:Icon(Icons.search,size: MediaQuery.of(context).size.width-100,color: Colors.grey,));
return FutureBuilder(
 // stream: Firestore.instance.collection("Users").snapshots() ,
  future:
  Firestore.instance.
  collection("Users").
  where("firstName",isGreaterThanOrEqualTo: SearchText).
  getDocuments(),
 
  builder: (BuildContext context, AsyncSnapshot snapshot){

//if(!snapshot.hasData)
if(!snapshot.hasData)return Center(child: CircularProgressIndicator(),);
if(snapshot.data.documents.length==0)return NotFound();


      return ListView.builder(
        
        itemCount: snapshot.data.documents.length,
        itemBuilder: (BuildContext context, int index) {
        return InkWell(


onTap: () async {
DocumentSnapshot user=snapshot.data.documents[index];

if(Provider.of<FirebaseUser>(context,listen: false).uid!=user.documentID)
{


User usr=admin_ser().convertSnapToUser(user);
var doc= await Firestore.instance.collection("Users")
.document(Provider.of<FirebaseUser>(context,listen: false).uid)
.collection("Following").document(user.documentID).get();
if(doc.data==null){
usr.follow=false;
}else  {usr.follow=true;
}
int x=await user_services().getTrips(user.documentID);
int y=await user_services().getFollowing(user.documentID);
int z= await user_services().getFollowers(user.documentID);

 Navigator.push(context,
        MaterialPageRoute(builder: (context)
        {return strangeProfile(selectedUser:usr,followers:z ,following:y ,trips:x ,); }));
 

}







                                              },
                  child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              decoration: BoxDecoration(

                border: Border(bottom: BorderSide(width: 1,color: Colors.red[100]))
              ),
              child: Row(
                children: <Widget>[
Padding(
  padding: const EdgeInsets.all(8.0),
  child:   ClipOval(
    child: snapshot.data.documents[index]["photo"]!=null?
    Image.network(snapshot.data.documents[index]["photo"],
    height: 60,width: 60,):Image.asset("images/defaultuser.png",width: 60,height: 60,)
  
  ),
),
Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: <Widget>[
          Text(" "+snapshot.data.documents[index]['firstName']+" "+snapshot.data.documents[index]['lastName'],style: TextStyle(fontSize: 20,fontFamily: "Oswald"),),
          Text(" "+snapshot.data.documents[index]['hometown'],style: TextStyle(fontSize: 15,color: Colors.teal),),
  
  ],
),
                ],
              ),
            ),
          ),
        );
       },
      );
  },
);

}


Widget HotelsFuture(){
if(SearchText==null)return Center(child:Icon(Icons.search,size: MediaQuery.of(context).size.width-100,color: Colors.grey,));
return FutureBuilder(
 // stream: Firestore.instance.collection("Users").snapshots() ,
  future:
  Firestore.instance.
  collection("accommodation").
  where("Name",isGreaterThanOrEqualTo: SearchText).
  getDocuments(),
 
  builder: (BuildContext context, AsyncSnapshot snapshot){

//if(!snapshot.hasData)
if(!snapshot.hasData)return Center(child: CircularProgressIndicator(),);
if(snapshot.data.documents.length==0)return NotFound();


      return ListView.builder(
        itemCount: snapshot.data.documents.length,
        itemBuilder: (BuildContext context, int index) {
        return InkWell(

              onTap: () async {

DocumentSnapshot doc=snapshot.data.documents[index];
 var users=  await admin_ser().getRateUsers("accommodation",doc.documentID);
Navigator.push(context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation)=>placeDetails(barName: "Details",Collection: "accommodation",placeSnap: snapshot.data.documents[index] ,users: users,),
   transitionDuration: Duration(milliseconds: 700),
   transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
      
      return SlideTransition(

        position: Tween<Offset>(
          begin: const Offset(3.0, 0.0),
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
          
            );


              },
                  child: Container(
padding: EdgeInsets.all(10),
    decoration: BoxDecoration(

              border: Border(bottom: BorderSide(width: 1,color: Colors.red[100]))
            ),

            child: Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
//Image.network(snapshot.data.documents[index]["photo"],height: 90,),

                Container(
                  width: 295,
                  child: Text(" "+snapshot.data.documents[index]['Name'],style: TextStyle(fontSize: 25,fontFamily: "Oswald",color: Colors.black),)),
                Container(
                  height: 45,
                  width: 45,
                  child: Stack(
                    children: <Widget>[
                       Icon(Icons.star,color: Colors.amber,size:46,),
                  Align(
                    
                    alignment: Alignment.center,
                    child: Text(snapshot.data.documents[index]['rate'].toString(),style: TextStyle(fontSize: 15,color: Colors.teal),)),
                       ],
                  ),
                ),
              
              
              ],
            ),
          ),
        );
       },
      );
  },
);

}

Widget TplacesFuture(){
if(SearchText==null)return Center(child:Icon(Icons.search,size: MediaQuery.of(context).size.width-100,color: Colors.grey,));
return FutureBuilder(
 // stream: Firestore.instance.collection("Users").snapshots() ,
  future:
  Firestore.instance.
  collection("tourismPlaces").
  where("Name",isGreaterThanOrEqualTo: SearchText).
  getDocuments(),
 
  builder: (BuildContext context, AsyncSnapshot snapshot){

//if(!snapshot.hasData)
if(!snapshot.hasData)return Center(child: CircularProgressIndicator(),);
if(snapshot.data.documents.length==0)return NotFound();


      return ListView.builder(
        itemCount: snapshot.data.documents.length,
        itemBuilder: (BuildContext context, int index) {
        return InkWell(




              onTap: () async {

DocumentSnapshot doc=snapshot.data.documents[index];
 var users=  await admin_ser().getRateUsers("tourismPlaces",doc.documentID);
Navigator.push(context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation)=>placeDetails(barName: "Details",Collection: "tourismPlaces",placeSnap: snapshot.data.documents[index] ,users: users,),
   transitionDuration: Duration(milliseconds: 700),
   transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
      
      return SlideTransition(

        position: Tween<Offset>(
          begin: const Offset(3.0, 0.0),
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
          
            );


              },


                  child: Container(
padding: EdgeInsets.all(10),
    decoration: BoxDecoration(

              border: Border(bottom: BorderSide(width: 1,color: Colors.red[100]))
            ),

            child: Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
//Image.network(snapshot.data.documents[index]["photo"],height: 90,),

                Container(
                  
                  
                  
                  
                  width: 295,
                  
                  child: Text(" "+snapshot.data.documents[index]['Name'],style: TextStyle(fontSize: 25,fontFamily: "Oswald"),)),
                Container(
                  height: 45,
                  width: 45,
                  child: Stack(
                    children: <Widget>[
                       Icon(Icons.star,color: Colors.blue[300],size:46,),
                  Align(
                    
                    alignment: Alignment.center,
                    child: Text(snapshot.data.documents[index]['rate'].toString(),style: TextStyle(fontSize: 15,color: Colors.white),)),
                       ],
                  ),
                ),
              
              
              ],
            ),
          ),
        );
       },
      );
  },
);

}

Widget ResFuture(){
if(SearchText==null)return Center(child:Icon(Icons.search,size: MediaQuery.of(context).size.width-100,color: Colors.grey,));
return FutureBuilder(
 // stream: Firestore.instance.collection("Users").snapshots() ,
  future:
  Firestore.instance.
  collection("Restaurants").
  where("Name",isGreaterThanOrEqualTo: SearchText).
  getDocuments(),
 
  builder: (BuildContext context, AsyncSnapshot snapshot){

//if(!snapshot.hasData)
if(!snapshot.hasData)return Center(child: CircularProgressIndicator(),);
if(snapshot.data.documents.length==0)return NotFound();


      return ListView.builder(
        itemCount: snapshot.data.documents.length,
        itemBuilder: (BuildContext context, int index) {
        return InkWell(


              onTap: () async {

DocumentSnapshot doc=snapshot.data.documents[index];
 var users=  await admin_ser().getRateUsers("Restaurants",doc.documentID);
Navigator.push(context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation)=>placeDetails(barName: "Details",Collection: "Restaurants",placeSnap: snapshot.data.documents[index] ,users: users,),
   transitionDuration: Duration(milliseconds: 700),
   transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
      
      return SlideTransition(

        position: Tween<Offset>(
          begin: const Offset(3.0, 0.0),
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
          
            );


              },

                  child: Container(
padding: EdgeInsets.all(10),
    decoration: BoxDecoration(

              border: Border(bottom: BorderSide(width: 1,color: Colors.red[100]))
            ),

            child: Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
//Image.network(snapshot.data.documents[index]["photo"],height: 90,),

                Container(
                  
                  width: 295,
                  child: Text(" "+snapshot.data.documents[index]['Name'],style: TextStyle(fontSize: 25,fontFamily: "Oswald"),)),
                Container(
                  height: 45,
                  width: 45,
                  child: Stack(
                    children: <Widget>[
                       Icon(Icons.star,color: Colors.green[300],size:46,),
                  Align(
                    
                    alignment: Alignment.center,
                    child: Text(snapshot.data.documents[index]['rate'].toString(),style: TextStyle(fontSize: 15,color: Colors.white),)),
                       ],
                  ),
                ),
              
              
              ],
            ),
          ),
        );
       },
      );
  },
);

}





Widget CitiesFuture(){
if(SearchText==null)return Center(child:Icon(Icons.search,size: MediaQuery.of(context).size.width-100,color: Colors.grey,));
return FutureBuilder(
 // stream: Firestore.instance.collection("Users").snapshots() ,
  future:
  Firestore.instance.
  collection("Cities").
  where("Name",isGreaterThanOrEqualTo: SearchText).
  getDocuments(),
 
  builder: (BuildContext context, AsyncSnapshot snapshot){

//if(!snapshot.hasData)
if(!snapshot.hasData)return Center(child: CircularProgressIndicator(),);
if(snapshot.data.documents.length==0)return NotFound();


      return ListView.builder(
        itemCount: snapshot.data.documents.length,
        itemBuilder: (BuildContext context, int index) {
        return InkWell(


onTap: (){



    
                                                               
                                   Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => cityDetails(snapshot.data.documents[index])));
                   
    




},


                  child: Container(
padding: EdgeInsets.all(10),
    decoration: BoxDecoration(

              border: Border(bottom: BorderSide(width: 1,color: Colors.red[100]))
            ),

            child: Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
//Image.network(snapshot.data.documents[index]["photo"],height: 90,),

                Text(" "+snapshot.data.documents[index]['Name'],style: TextStyle(fontSize: 25,fontFamily: "Oswald"),),
                Container(
                  height: 45,
                  width: 45,
                  child: Stack(
                    children: <Widget>[
                       Icon(Icons.star,color: Colors.orange[300],size:46,),
                  Align(
                    
                    alignment: Alignment.center,
                    child: Text(snapshot.data.documents[index]['rate'].toString(),style: TextStyle(fontSize: 15,color: Colors.white),)),
                       ],
                  ),
                ),
              
              
              ],
            ),
          ),
        );
       },
      );
  },
);

}

}






