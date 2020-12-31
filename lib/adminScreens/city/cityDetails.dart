import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:traveliano/adminScreens/city/Destination.dart';
import 'package:traveliano/adminScreens/locationpreview.dart';
import 'package:traveliano/globals.dart';
import 'package:traveliano/services/admin.dart';

class cityDetails extends StatefulWidget{

DocumentSnapshot citySnap;

cityDetails(citySnap){

this.citySnap=citySnap;

}
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return cityDetailsState(this.citySnap);
  }

}

class cityDetailsState extends State<cityDetails> {

  
DocumentSnapshot citySnap;

cityDetailsState(citySnap){

this.citySnap=citySnap;

}
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  DefaultTabController(
          child: Scaffold(


        body:CustomScrollView(
slivers: <Widget>[

SliverAppBar(

flexibleSpace: FlexibleSpaceBar(
background: Container(

padding: EdgeInsets.all(MediaQuery.of(context).size.width/10),
child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                ListTile(
                                  title: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                        children: <Widget>[
                                          Container(width: 200,color: Colors.transparent,
                                            child: Text(
                                                citySnap.data['Name'],
                                                  maxLines: 2,
                                                  style: TextStyle(
                                                    
                                                      color: Colors.white,
                                                     // fontFamily: 'Baloo',
                                                      fontWeight: FontWeight.w300,
                                                      fontSize: 30)),
                                          ),
                                      
                                      Container(color: Colors.transparent,height:50,width: 50,
                                        child: Stack(
                                          children: <Widget>[
        
                                   citySnap.data['rate']>4?  Icon(
                                              Icons.star,
                                              size: 50,
                                              color: Colors.amber,
                                            ):   citySnap.data['rate']>2? 
Icon(
                                              Icons.star_half,
                                              size: 50,
                                              color: Colors.amber,
                                            ):Icon(
                                              Icons.star_border,
                                              size: 50,
                                              color: Colors.amber,
                                            ),



                                            Center(
                                              child: Text( citySnap.data['rate']
                                                  .toString()
                                                  ,style: TextStyle(fontWeight: FontWeight.w900,color:Colors.white),
                                                  
                                                  textAlign: TextAlign.center,
                                                  
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                          /*  */
                                        ],
                                      ),
                                      
                                    ],
                                  ),
                                  subtitle: Row(
                                    children: <Widget>[
         Icon(Icons.location_on,color: Colors.grey[100],),

                                      Text(
                                         citySnap.data['country'],
                                        style: TextStyle(color: Colors.white60),
                                      ),
                                    ],
                                  ),
                                  enabled: true,
                                ),


Row(
mainAxisAlignment: MainAxisAlignment.center,


children: <Widget>[


 citySnap.data['recommendedWeather'].toString().isNotEmpty?Card(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(18.0),
                                            ),
                                            // elevation:2,
                                            color: Colors.transparent,
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
                                                       citySnap.data[
                                                                'recommendedWeather']
                                                            .toString(),
                                                        style: TextStyle(
                                                           color: Colors.cyan,
                                                            fontWeight:
                                                                FontWeight.w100,
                                                            fontFamily: 'Oswald',
                                                            fontSize: 20),
                                                      ),

                                                      //    Text(' city',style:  TextStyle(color: Colors.teal,
                                                      //      fontWeight:FontWeight.w800,fontFamily: 'ShadowsIntoLight',fontSize:20 ),),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ):Container(),
                 citySnap.data['recommendedType'].toString().isNotEmpty?Card(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(18.0),
                                            ),
                                            // elevation:2,
                                            color: Colors.transparent,
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
                                                     citySnap.data
                                                                ['recommendedType']
                                                            .toString(),
                                                        style: TextStyle(
                                                            color: Colors.cyan[200],
                                                            fontWeight:
                                                                FontWeight.w100,
                                                            fontFamily: 'Oswald',
                                                            fontSize: 20),
                                                      ),

                                                      //    Text(' city',style:  TextStyle(color: Colors.teal,
                                                      //      fontWeight:FontWeight.w800,fontFamily: 'ShadowsIntoLight',fontSize:20 ),),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ):Container(),




],


),




                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Text(
                                        citySnap.data['maxBudget']
                                                  .toString() +
                                              "\$",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w100,
                                              fontSize: 25,
                                              color: Colors.white,
                                              fontFamily: ''),
                                        ),
                                        Text(
                                          " - ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white),
                                        ),
                                        Text(
                                        citySnap.data['minBudget']
                                                  .toString() +
                                              '\$',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w100,
                                              fontSize: 25,
                                              color: Colors.white,
                                              fontFamily: ''),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                            
                            
                            
                            
                            
                            
                                Stack(
                                  children: <Widget>[
                                    Align(
                                      alignment: Alignment.bottomLeft,
                                      child: InkWell(
                                        child: SvgPicture.asset(
                                          'images/map.svg',
                                          height: 35,
                                        ),
                                        onTap: () {
                                 
     bottomSheethalf(context,MyApp(     double.parse(citySnap.data['latitude'].toString()) ,      double.parse(citySnap.data['longitude'].toString())));
     
                               },
                                      ),
                                    ),
                                    

                                  ],
                                ),
                              ],
                            ),

decoration: BoxDecoration(

image:new DecorationImage(
                                  fit: BoxFit.cover,
                                  colorFilter: new ColorFilter.mode(
                                      Colors.black.withOpacity(0.3),
                                      BlendMode.darken),
                                  image: 
                                  
                                  citySnap.data["photo"]!=null?
                                  new NetworkImage(citySnap.data["photo"]):
                                  AssetImage("images/default.png")
                                )
                                

),

)

),
expandedHeight: 400,
  floating: true,
  pinned: true,
  backgroundColor: Colors.black,
  
         
              bottom: TabBar(indicatorSize: TabBarIndicatorSize.tab,
                indicatorPadding: EdgeInsets.all(0),
                isScrollable: true,
                unselectedLabelColor: Colors.white,
                indicator: BoxDecoration(

                   borderRadius: BorderRadius.circular(5),
                   color: Colors.redAccent
                ),
                tabs: [
           
                  
                  Tab(
                  child: Text('Hotels',style: TextStyle(fontFamily: "Srira"),),
                  ),
                  Tab(
                  child: Text('Toursim Attraction',style: TextStyle(fontFamily: "Srira"),),
                  ),
                  Tab(
                  child: Text('Restaurants',style: TextStyle(fontFamily: "Srira"),),
                  ),
            
                  
                
               


                ]),







),






SliverFillRemaining(
child:      
         TabBarView(children: [


DestinationScreen(Citysnap: citySnap,Collection: "accommodation",barName:"XX"),
  
DestinationScreen(Citysnap: citySnap,Collection: "tourismPlaces",barName:"XXXX"),
 
DestinationScreen(Citysnap: citySnap,Collection: "Restaurants",barName:"XXX"),
 
  /*         UsersFuture(),
        HotelsFuture(),
        TplacesFuture(),
         ResFuture(),
         CitiesFuture()


 */
        ]),

   
  
)


],

        )
        
        
   
   
      ),
       length: 3,
    );
  }



Widget NotFound(){


return Container(
  child:   ListView(
  
   // mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
  
    children: <Widget>[
  
  
  
      Padding(
        padding: const EdgeInsets.only(top:50 ),
        child: Icon(Icons.sentiment_dissatisfied,size: MediaQuery.of(context).size.width-80,color: Colors.grey[100],),
      ),
  
          Center(child: Text("Sorry,There are not results to show",style: TextStyle(fontWeight: FontWeight.w300,color: Colors.grey),)),
  
    ],
  
  ),
);







}
/* 
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
        return Padding(
          padding: const EdgeInsets.all(2.0),
          child: Container(
            decoration: BoxDecoration(

              border: Border(bottom: BorderSide(width: 1,color: Colors.red[100]))
            ),
            child: Row(
              children: <Widget>[
Padding(
  padding: const EdgeInsets.all(8.0),
  child:   ClipOval(child: Image.network(snapshot.data.documents[index]["photo"],height: 60,),
  
  ),
),
Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: <Widget>[
        Text(" "+snapshot.data.documents[index]['firstName']+" "+snapshot.data.documents[index]['lastName'],style: TextStyle(fontSize: 20),),
        Text(" "+snapshot.data.documents[index]['hometown'],style: TextStyle(fontSize: 15,color: Colors.cyan),),
  
  ],
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
        return Container(
padding: EdgeInsets.all(10),
    decoration: BoxDecoration(

            border: Border(bottom: BorderSide(width: 1,color: Colors.red[100]))
          ),

          child: Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
//Image.network(snapshot.data.documents[index]["photo"],height: 90,),

              Text(" "+snapshot.data.documents[index]['Name'],style: TextStyle(fontSize: 25),),
              Container(
                height: 45,
                width: 45,
                child: Stack(
                  children: <Widget>[
                     Icon(Icons.star,color: Colors.blue[300],size:46,),
                Align(
                  
                  alignment: Alignment.center,
                  child: Text(snapshot.data.documents[index]['Rate'].toString(),style: TextStyle(fontSize: 15,color: Colors.white),)),
                     ],
                ),
              ),
            
            
            ],
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
        return Container(
padding: EdgeInsets.all(10),
    decoration: BoxDecoration(

            border: Border(bottom: BorderSide(width: 1,color: Colors.red[100]))
          ),

          child: Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
//Image.network(snapshot.data.documents[index]["photo"],height: 90,),

              Text(" "+snapshot.data.documents[index]['Name'],style: TextStyle(fontSize: 25),),
              Container(
                height: 45,
                width: 45,
                child: Stack(
                  children: <Widget>[
                     Icon(Icons.star,color: Colors.blue[300],size:46,),
                Align(
                  
                  alignment: Alignment.center,
                  child: Text(snapshot.data.documents[index]['Rate'].toString(),style: TextStyle(fontSize: 15,color: Colors.white),)),
                     ],
                ),
              ),
            
            
            ],
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
        return Container(
padding: EdgeInsets.all(10),
    decoration: BoxDecoration(

            border: Border(bottom: BorderSide(width: 1,color: Colors.red[100]))
          ),

          child: Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
//Image.network(snapshot.data.documents[index]["photo"],height: 90,),

              Text(" "+snapshot.data.documents[index]['Name'],style: TextStyle(fontSize: 25),),
              Container(
                height: 45,
                width: 45,
                child: Stack(
                  children: <Widget>[
                     Icon(Icons.star,color: Colors.blue[300],size:46,),
                Align(
                  
                  alignment: Alignment.center,
                  child: Text(snapshot.data.documents[index]['Rate'].toString(),style: TextStyle(fontSize: 15,color: Colors.white),)),
                     ],
                ),
              ),
            
            
            ],
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
        return Container(
padding: EdgeInsets.all(10),
    decoration: BoxDecoration(

            border: Border(bottom: BorderSide(width: 1,color: Colors.red[100]))
          ),

          child: Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
//Image.network(snapshot.data.documents[index]["photo"],height: 90,),

              Text(" "+snapshot.data.documents[index]['Name'],style: TextStyle(fontSize: 25),),
              Container(
                height: 45,
                width: 45,
                child: Stack(
                  children: <Widget>[
                     Icon(Icons.star,color: Colors.blue[300],size:46,),
                Align(
                  
                  alignment: Alignment.center,
                  child: Text(snapshot.data.documents[index]['Rate'].toString(),style: TextStyle(fontSize: 15,color: Colors.white),)),
                     ],
                ),
              ),
            
            
            ],
          ),
        );
       },
      );
  },
);

}

 */











}