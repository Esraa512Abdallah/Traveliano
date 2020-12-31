import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:traveliano/adminScreens/Search2.dart';
import 'package:traveliano/adminScreens/allCities.dart';
import 'package:traveliano/models/city.dart';
import 'package:traveliano/adminScreens/home.dart' ;
//import 'package:traveliano/adminScreens/location2.dart' as location;
import 'package:traveliano/adminScreens/hotel/addAccommodation1.dart' as Acco;
import 'package:traveliano/adminScreens/tourismplace/newTourismPlace1.dart' as Tplace;
import 'package:traveliano/adminScreens/restuarant/newRestuarant1.dart' as Restuarant;
import 'package:traveliano/models/hotel.dart';

class newCity extends StatefulWidget {

 City city=new City();
newCity(City city)
{

  this.city=city;
}
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return newCityState(this.city);
  }
}

class newCityState extends State<newCity> {
City city=new City();
newCityState(City city)
{

  this.city=city;
}
 void fun(){


  
}

 
//int pagenum=1;

 final GlobalKey<FormState> formState = GlobalKey<FormState>();


City new_city=new City() ;


  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
  
  
  appBar: AppBar(
          iconTheme: new IconThemeData(color: Colors.green),
          //   leading: Icon(Icons.filter_list,color: Colors.green,) ,

          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("New City",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Comfortaa')),
            /*   Text(
                "Add New TourismPlace ",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 10,
                    fontWeight: FontWeight.w300,
                    fontFamily: 'Comfortaa'),
              ), */
            ],
          ),

          centerTitle: true, backgroundColor: Colors.white,
        ),
   body: Container(
        padding:EdgeInsets.all(10),
        margin: EdgeInsets.only(top: 3),
        decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            border: Border.all(color: Colors.white10, width: 2)),
        child:ListView(


            children: <Widget>[



              Padding(
                padding: const EdgeInsets.only(bottom: 15,top:15),
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Text(this.city.Name,style: TextStyle(fontSize: 40),textAlign: TextAlign.center,),
                      Text(this.city.Country)
                    ],
                  ),
                )),
                

   Padding(
     padding: const EdgeInsets.only(top:10),
     child: RaisedButton(
  
  
  
  child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        
        
        Text("Add hotel/hostel",
        style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w300),),
     Icon(Icons.arrow_forward_ios,color: Colors.white,),
     
     
      ],
  ),
  
  color: Colors.green,
  
  elevation: 8.0,
  
  
  
  shape: RoundedRectangleBorder(  
  
      borderRadius: BorderRadius.circular(120.0),  
  
      side: BorderSide(color: Colors.green,width: 1.2)
  
         ),
  
        
  
       padding: EdgeInsets.only(top:MediaQuery.of(context).size.height/40,
  
        
  
              bottom: MediaQuery.of(context).size.height/30,
  
        
  
              left: MediaQuery.of(context).size.width/10,
  
        
  
              right: MediaQuery.of(context).size.width/10,
  
        
  
                            ),
  
  
  
  onPressed: (){


  Navigator.push(

      context,
      MaterialPageRoute(builder: (context) =>Acco.CityAccommodation(this.city)),
  );






      
  },
  
  
  
  ),
   ),







   Padding(
     padding: const EdgeInsets.only(top: 20),
     child: RaisedButton(
  
  
  
  child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        
        
        Text("Add Restuarent",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w300),),
     Icon(Icons.arrow_forward_ios,color: Colors.white,),
     
     
      ],
  ),
  
  color: Colors.green,
  
  elevation: 8.0,
  
  
  
  shape: RoundedRectangleBorder(  
  
      borderRadius: BorderRadius.circular(120.0),  
  
      side: BorderSide(color: Colors.green,width: 1.2)
  
         ),
  
        
  
       padding: EdgeInsets.only(top:MediaQuery.of(context).size.height/40,
  
        
  
              bottom: MediaQuery.of(context).size.height/30,
  
        
  
              left: MediaQuery.of(context).size.width/10,
  
        
  
              right: MediaQuery.of(context).size.width/10,
  
        
  
                            ),
  
  
  
  onPressed: (){




  Navigator.push(

      context,
      MaterialPageRoute(builder: (context) =>Restuarant.NewCityRestaurant(this.city),
  ));







      
  },
  
  
  
  ),
   ),





   Padding(
     padding: const EdgeInsets.only(top:20),
     
     child: RaisedButton(
  
  
  
  child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        
        
        Text("Add tourism place",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w300),),
     Icon(Icons.arrow_forward_ios,color: Colors.white,),
     
     
      ],
  ),
  
  color: Colors.green,
  
  elevation: 8.0,
  
  
  
  shape: RoundedRectangleBorder(  
  
      borderRadius: BorderRadius.circular(120.0),  
  
      side: BorderSide(color: Colors.green,width: 1.2)
  
         ),
  
        
  
       padding: EdgeInsets.only(top:MediaQuery.of(context).size.height/40,
  
        
  
              bottom: MediaQuery.of(context).size.height/30,
  
        
  
              left: MediaQuery.of(context).size.width/10,
  
        
  
              right: MediaQuery.of(context).size.width/10,
  
        
  
                            ),
  
  
  
  onPressed: (){

  Navigator.push(

      context,
      MaterialPageRoute(builder: (context) =>Tplace.CityTourismPlace(this.city)),
  );





      
  },
  
  
  
  ),
   ),






Padding(
  padding: const EdgeInsets.only(top: 50,bottom: 0,left: 90,right:90),
  child:  
  
  
  
   RaisedButton(
  
  
  
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      
      Icon(Icons.arrow_back_ios,color: Colors.white,),
      Text("Exit",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w300),),
   
   
   
    ],
  ),
  
  color: Colors.red,
  
  elevation: 8.0,
  
  
  
  shape: RoundedRectangleBorder(  
  
    borderRadius: BorderRadius.circular(120.0),  
  
    side: BorderSide(color: Colors.green,width: 1.2)
  
       ),
  
      
  
     padding: EdgeInsets.only(top:MediaQuery.of(context).size.height/40,
  
      
  
            bottom: MediaQuery.of(context).size.height/30,
  
      
  
            left: MediaQuery.of(context).size.width/12,
  
      
  
            right: MediaQuery.of(context).size.width/12,
  
      
  
                          ),
  
  
  
  onPressed: (){




  Navigator.pop(
      context,
      MaterialPageRoute(builder: (context) => Cities(),
  ));
//Navigator.of(context).popUntil((route) => route.isFirst);

  //Navigator.push(
    //context,
   // MaterialPageRoute(builder: (context) => location.MyApp(new_city)),
 // );






    
  },
  
  
  
  ),
),






   

               
                ],
          ),
      ),
    );
  }
}



/* DropdownButton(isDense: true,isExpanded: true,

        value: dropval,
        icon: Icon(Icons.keyboard_arrow_down),
        iconEnabledColor: Colors.blue,
       hint: Text("Select Course Major..."),
       disabledHint: Text("Enter Major.."), 
        onChanged: (val){
          setState(() {
            dropval=val;
          });
        },
items: <String>["Desgin","Development","Business"].map<DropdownMenuItem<String>>((String value){

return DropdownMenuItem<String>(child: Text(value),value: value,);

}).toList(),

*/

