import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:traveliano/adminScreens/hotel/allHotels.dart';
import 'package:traveliano/adminScreens/locationpreview.dart';
import 'package:traveliano/globals.dart';
import 'package:traveliano/models/hotel.dart';

import 'package:smooth_star_rating/smooth_star_rating.dart';



class hotelDetails extends StatefulWidget {

 Hotel hotel;
hotelDetails({this.hotel});
  @override
  _hotelDetailsState createState() => _hotelDetailsState();
}

class _hotelDetailsState extends State<hotelDetails> {

String cityname="";

getCityName() async {

await Firestore.instance.collection("Cities")
.document(widget.hotel.cityId).get().then((val){  
setState(() {
  
cityname=val.data["Name"];

});  
  
print(val.data["Name"].toString()+"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
 });


}


List<String> serviceslist =new List<String>();
@override
  void initState() {
    // TODO: implement initState
    super.initState();
  
getCityName();
for (MapEntry entry in widget.hotel.services.entries) {
  if(entry.value==true){

serviceslist.add(entry.key.toString());


  }

}


  }

  @override
  Widget build(BuildContext context) {

   return Scaffold(
   //  appBar: AppBar(),
     body: Container(height: MediaQuery.of(context).size.height,
       child: Column(
         children: <Widget>[
           Container(
          /*    decoration:BoxDecoration(

image: DecorationImage(

image: AssetImage("images/load.gif"),

)

             ) , */
             width: MediaQuery.of(context).size.width,
             height: MediaQuery.of(context).size.width ,
           color: widget.hotel.photo==null?Colors.grey[200]:Colors.white,
             child: Stack(
               children: <Widget>[
  
widget.hotel.photo==null?
Center(child: Icon(Icons.photo,size: MediaQuery.of(context).size.width/2,color: Colors.grey,))
:  
Container(width: MediaQuery.of(context).size.width,
  child:   FadeInImage.assetNetwork(placeholder: "images/load.gif"
  , image: widget.hotel.photo,height: 500
  ,fit: BoxFit.cover, ),
),




Align(
  alignment: Alignment.bottomLeft
  ,child: Padding(
    padding: const EdgeInsets.all(18.0),
    child: InkWell(
      onTap: (){
        bottomSheethalf(context,Container(
          height: MediaQuery.of(context).size.height/1.5,
          child: MyApp(widget.hotel.latitude,widget.hotel.longtude)));
        
        }
      ,
      child: SvgPicture.asset("images/map.svg",height: 30,)),
  )
  )


               ],
             ),
           ),
           Container(
             padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: <Widget>[
                 Column(
                   children: <Widget>[
                     Container(width: MediaQuery.of(context).size.width/2.1,//color: Colors.black12,
                        child: InkWell(

                          onTap: (){

Navigator.pop(context);

                          },
                                                  child: Text(
                       widget.hotel.Name,maxLines: 3,textAlign: TextAlign.center,
                           style: TextStyle(
                               fontSize: 22, fontWeight: FontWeight.bold),
                       ),
                        ), 
                     ),
                     Text(
                       "🌍 "+cityname,maxLines: 1,textAlign: TextAlign.left,
                           style: TextStyle(color: Colors.grey,
                               fontSize: 15, fontWeight: FontWeight.bold),
                       ),
                     Row(
                       children: <Widget>[
                         SmoothStarRating(
                           allowHalfRating: false,
                           starCount: 5,
                           rating: widget.hotel.rate,
                           size: 22.0,
                           color: Colors.blue[200],
                           borderColor: Colors.black12,
                         ),
                         Text(
                           '(' + widget.hotel.rate.toString() + ')',
                           style:
                               TextStyle(color: Colors.black12, fontSize: 14),
                         ),
                       ],
                     )
                   ],
                 ),
                 Text(
                   widget.hotel.minPrice.toString() +
                       '\$-' +
                       widget.hotel.maxPrice.toString() +
                       '\$',
                   style: TextStyle(
                     fontSize: 20,
                     fontWeight: FontWeight.w300
                   ),
                 ),
               ],
             ),
           ),
  
  
Container(color: Colors.teal[100],
                            
                              //width: MediaQuery.of(context).size.width/1.2,
                           //   color: Colors.white,
                             // padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
//color: Colors.teal,
                             height: MediaQuery.of(context).size.height/3.9,
                              child: serviceslist.length!=0 ?GridView.builder(
                                
                                itemCount: serviceslist.length,
                                gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 4,
                                            childAspectRatio: 2,


                                             crossAxisSpacing: 0.0,
                                            mainAxisSpacing: 2.0, 
                                          )
                              
                              
                              , itemBuilder: (BuildContext context,index){

return Container(
                            
                            decoration: BoxDecoration
                            
                            
                            (
                              
                              
                              borderRadius: BorderRadius.circular(50),color: Colors.red[300]),


                            child:   Center(child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[

                                Padding(
                                  padding: const EdgeInsets.fromLTRB(5,5,1,5),
                                  child: ClipOval(child: Container(color:Colors.white,height: 12,width: 12,)),
                                ),
                                Container(width:60,
                                  child: Text(serviceslist[index].toString() ,maxLines: 2  ,
                                   textAlign: TextAlign.center,style: TextStyle(fontSize: 10
                                   ,color: Colors.white,fontWeight: FontWeight.w400 /* ,backgroundColor: Colors.red */),
                                   ),
                                ),
                              ],
                            )),
);

                              }):Center(child: Text("No Services have been added ,once it's added it will appear here"
                              ,textAlign: TextAlign.center,
                              ),
                              
                              
                              )
                            )
                            
   
  
  
  
  
  

  
         ],
       ),
     ),
   );
  }
}
