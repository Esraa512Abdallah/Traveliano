import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:traveliano/adminScreens/hotel/allHotels.dart';
import 'package:traveliano/adminScreens/locationpreview.dart';
import 'package:traveliano/globals.dart';
import 'package:traveliano/models/hotel.dart';

import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:traveliano/models/tourismplace.dart';



class tourismDetails extends StatefulWidget {

 TourismPlace hotel;
tourismDetails({this.hotel});
  @override
  _tourismDetailsState createState() => _tourismDetailsState();
}

class _tourismDetailsState extends State<tourismDetails> {

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
                 Text("Avg. Cost "+
                   widget.hotel.cost.toString() +
                       '\$',
                   style: TextStyle(
                     fontSize: 20,
                     fontWeight: FontWeight.w300
                   ),
                 ),
               ],
             ),
           ),
  
  
Expanded(
  child:   Container(
  
                              
  
                     // height: MediaQuery.of(context).size.height/4.5,
  
                      
  
                      
  
                      color: Colors.teal[100],
  
                      
  
                            
  
                            
  
                            child: Padding(
  
                              padding: const EdgeInsets.only(left:10.0,right:10.0),
  
                              child: ListView(children: <Widget>[
  
  
  
  Text(widget.hotel.description,style: TextStyle(fontSize: 15),textAlign: TextAlign.center,)
  
  
  
  
  
                              ],),
  
                            ),
  
                            
  
                            
  
                              ),
),
                            
   
  
  
  
  
  

  
         ],
       ),
     ),
   );
  }
}
