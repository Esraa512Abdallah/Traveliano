import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:traveliano/adminScreens/allCities.dart';
import 'package:traveliano/models/city.dart';
import 'package:traveliano/adminScreens/location.dart' as location;
import 'package:traveliano/load.dart' as load;
import 'package:traveliano/services/admin.dart' as admin_service;
import 'package:traveliano/adminScreens/addNewCity3.dart' as nc3;
import 'package:traveliano/services/user.dart';
class newCity extends StatefulWidget {
  City _city= new City() ;
  newCity(City city){

this._city=city;

  }
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return newCityState(this._city);
  }
}

class newCityState extends State<newCity> {

  bool isload=false;
  City _city= new City() ;
  newCityState(City city){

this._city=city;

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
      appBar: PreferredSize(
        child: AppBar(
          iconTheme: new IconThemeData(color: Colors.green),
          //   leading: Icon(Icons.filter_list,color: Colors.green,) ,

          title: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text("Traveliano",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 30,
                      fontWeight: FontWeight.w900)),
              Text(
                "Add New City",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 10,
                    fontWeight: FontWeight.w300),
              ),
            ],
          ),

          centerTitle: true, backgroundColor: Colors.white,
        ),
        preferredSize: Size.fromHeight(75),
      ),
      body:isload==true?load.load("Saving City ... Please Wait"):Container(
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
                      Text(this._city.Name,style: TextStyle(fontSize: 50),textAlign: TextAlign.center,),
                      Text(this._city.Country)
                    ],
                  ),
                )),
                

   Padding(
     padding: const EdgeInsets.only(top:10),
     child: RaisedButton(
  
  
  
  child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        
        
        Text("Save & Continue",
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
  
  
  
  onPressed: ()async{



setState(() {
this.isload=!this.isload;
});




var result = await admin_service.admin_ser().addCityID(this._city);


setState(() {
this.isload=!this.isload;
});

if(result!=null){
this._city.Id=result;
print("REsult ================================city2=== "+this._city.Id.toString());
  Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => nc3.newCity(this._city),
  ));
}





      
  },
  
  
  
  ),
   ),







Padding(
  padding: const EdgeInsets.only(top: 50,bottom: 0,left: 50,right: 50),
  child:  
  
  
  
   RaisedButton(
  
  
  
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      
      
      Text("Save & Exit",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w300),),
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
  
  
  
  onPressed: ()async{
setState(() {
this.isload=!this.isload;
});
//print("!!!!!!!!!!!!!!!!!"+_city.latitude+_city.rate.toString()+"@@@@@@@@@@@@@@@@@@@@@@@@!!!!!!!!!!!!!!!!!!@@@@@@@@@@@@@@@@@!!!!!!!!!!!!");
await admin_service.admin_ser().addCity(this._city);

//user_services().addCommentEx(context, "Nice Experience ", "PAwCUzTzHZfoVa4ldyGz");

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>Cities(),
      ));

setState(() {
  this.isload=!this.isload;
});
 






    
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

