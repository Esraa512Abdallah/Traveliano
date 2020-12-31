

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:traveliano/adminScreens/Settings.dart';
import 'package:traveliano/services/user.dart';
import 'package:traveliano/adminScreens/experience/experience.dart';
import 'package:traveliano/adminScreens/restaurants.dart';
import 'package:traveliano/adminScreens/tourismPlaces.dart';
import 'package:traveliano/adminScreens/users.dart';
import 'package:traveliano/userScreens/Experince.dart';

import 'hotels.dart';
class home  extends StatefulWidget {


  
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return homeState();
  }


  
}


class homeState  extends State<home>{

  
Color gridColor=Colors.blue[400];
double CardBorder=30.0;
 
 
 
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      
backgroundColor: Colors.blue[100],
appBar: 
PreferredSize(

  child:   AppBar(
 
      
  iconTheme: new IconThemeData(color: Colors.indigoAccent),
 //   leading: Icon(Icons.filter_list,color: Colors.green,) ,
  actions: <Widget>[

InkWell(
child: Padding(
  padding: const EdgeInsets.all(5.0),
  child:   Icon(Icons.exit_to_app,color: Colors.white,),
),
onTap: (){

user_services().signOut();

},

)



  ],
      title: Column(

      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Text("Traveliano",textAlign: TextAlign.center,style: TextStyle(fontFamily: "Pacifico",color: Colors.white,fontSize: 20,fontWeight: FontWeight.w900)),
        Text("Admin Mode",textAlign: TextAlign.center,style: TextStyle(color: Colors.blue,fontSize: 10,fontWeight: FontWeight.w300),),
      ],
  ),
  
  centerTitle: true,backgroundColor: Colors.blue[100],elevation: 0,), preferredSize:Size.fromHeight(75),
),
  /*     drawer: Drawer(

          child: ListView(
            children: <Widget>[
              new UserAccountsDrawerHeader(accountName: Text('Admin'),
               accountEmail: Text('hassn mohamed@gmail.com'),
              
                currentAccountPicture: new GestureDetector(
                  onTap: ()=>print("click"),
                  child: new CircleAvatar(
                    backgroundImage: new NetworkImage("https://www.pinclipart.com/picdir/middle/32-321129_icon-settings-transparent-background-clipart.png"),
                  ),
                ),
              ),
              new ListTile(
                trailing: Icon(Icons.account_circle),
                title: Text('My Profile'),
              ),
              new Divider(),
              new ListTile(
                trailing: Icon(Icons.language),
                title: Text('My Experiense'),
              ),
                          new ListTile(onTap: (){
user_services().signOut();


                          },
                trailing: Icon(Icons.exit_to_app),
                title: Text('    Log Out'),
              ),
            ],
          ),
        ), */

body: Container(
  margin: EdgeInsets.only(top:1),
  decoration: BoxDecoration(
      color: Colors.blue[200],
borderRadius: BorderRadius.only(
topLeft: Radius.circular(40),
topRight: Radius.circular(40),

),
border: Border.all(color: Colors.white10,width:2)

  ),
  child:   Padding(
      padding: const EdgeInsets.only(top:0,right: 5,left: 5),

      
        child: 
       Row(
  
     //    crossAxisCount: 2,crossAxisSpacing: 0.0,
       //  childAspectRatio: 1.09,
        
         
        
         children: <Widget>[
        
        
        Flexible(

      child:
       Padding(
         padding: const EdgeInsets.only(top:15),
         child: GridView.count(
  
         crossAxisCount: 2,crossAxisSpacing: 0.0,
         childAspectRatio: 1.09,
        
         
        
         children: <Widget>[









  InkWell(

      focusColor: Colors.orangeAccent,
      highlightColor: Colors.blue,
      hoverColor: Colors.red,

        child:   Card(     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(CardBorder)),
            
         
     
      
    child: Column(
      
        
      
      crossAxisAlignment: CrossAxisAlignment.center,
      
        
      
      mainAxisAlignment: MainAxisAlignment.center,
      
        
      
      children: <Widget>[
      
        
      
        
      
        
      
         SvgPicture.asset("./images/globe.svg",height: 100,),
      
        
      
        Text("Cities",textAlign: TextAlign.center,
      
        
      
       style: TextStyle(color: Colors.white,
      
        
      
        fontWeight: FontWeight.w300
      
        
      
        ),
      
        
      
        
      
        
      
        ),
      
        
      
      ],
      
        
      
    ),
      
        
      
    color:gridColor,
      
        
      
       // margin: EdgeInsets.only(top:20,left: 10),
      
        
      
        
      elevation: 8.0,
        
      
        ),
      
      
      
      onTap: (){

//Navigator.pushNamed(context, "AdminCities")


Navigator.pushNamed(context, 'AllCities');
  



      },
      
      
      
      ),
      
      
      
      

     
      
      InkWell(
      
        child:   Card(
      
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(CardBorder)),
            
         
      elevation: 8.0,
        

        
      
    child: Column(
      
        
      
      crossAxisAlignment: CrossAxisAlignment.center,
      
        
      
      mainAxisAlignment: MainAxisAlignment.center,
      
        
      
      children: <Widget>[
      
        
      
        
      
        
         SvgPicture.asset("./images/fork.svg",height: 90,),
        
      
        Text("Restaurants",textAlign: TextAlign.center,
      
        
      style: TextStyle(color: Colors.white,
        
      
        fontWeight: FontWeight.w300
      
        
      
        ),
      
        
      
        
      
        
      
        ),
      
        
      
      ],
      
        
      
    ),
      
        
      
    color: gridColor,
      
        
      
        //margin: EdgeInsets.only(top:20,left: 10),
      
        
      
        
      
        
      
        ),
      
      
      
      onTap: (){


Navigator.pushNamed(context, 'AllRestaurants');
      },
      
      
      
      ),
      
      InkWell(
      
        child:   Card(
         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(CardBorder)),
            
         
      elevation: 8.0,
        
        
        
      
    child: Column(
      
        
      
      crossAxisAlignment: CrossAxisAlignment.center,
      
        
      
      mainAxisAlignment: MainAxisAlignment.center,
      
        
      
      children: <Widget>[
      
        
      
     SvgPicture.asset("./images/sleep.svg",height: 100,),
      
        
      
        Text("Hotels&Hostels",textAlign: TextAlign.center,
      
        
      
      style: TextStyle(color: Colors.white,
      
        
      
        fontWeight: FontWeight.w300
      
        
      
        ),
      
        
      
        
      
        
      
        ),
      
        
      
      ],
      
        
      
    ),
      
        
      
    color:gridColor,
      
        
      
        //margin: EdgeInsets.only(top:20,left: 10),
      
        
      
        
        
      
        ),
      
      
      
      onTap: (){

        
Navigator.pushNamed(context, 'AllHotels');
      
      }
      ),
      
      
      
      
      
      
      
      
      
      
      
      InkWell(
      
        child:   Card(
     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(CardBorder)),
            
         
      elevation: 8.0,
     
    child: Column(
      
        
      
      crossAxisAlignment: CrossAxisAlignment.center,
      
        
      
      mainAxisAlignment: MainAxisAlignment.center,
      
        
      
      children: <Widget>[
      
        
      
        
      
        
      
     SvgPicture.asset("./images/khalifa.svg",height: 100,),
        
      
        Text("tourist attractions",textAlign: TextAlign.center,
      
        
      style: TextStyle(color: Colors.white,
      
        
      
        fontWeight: FontWeight.w300
      
        
      
        ),
      
        
      
        
      
        
      
        ),
      
        
      
      ],
      
        
      
    ),
      
        
      
    color:gridColor,
      
        
      
        //margin: EdgeInsets.only(top:20,left: 10),
      
        
      
        
      
        
      
        ),
      
      
      
      onTap: (){


        
Navigator.pushNamed(context, 'AllTplace');
      }
      
      ),
      
        InkWell(
        
         child:   Card(
         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(CardBorder)),
            
         
     
        elevation: 8.0,
     
        
     child: Column(
        
         
        
         crossAxisAlignment: CrossAxisAlignment.center,
        
         
        
         mainAxisAlignment: MainAxisAlignment.center,
        
         
        
         children: <Widget>[
        
         
        
         
        
        SvgPicture.asset("./images/team.svg",height: 100,),
        
         //  Icon(Icons.person_outline , color: Colors.white,size: 70.0,),
        
         
        
           Text("Users",textAlign: TextAlign.center,
        
         
        
           style: TextStyle(color: Colors.white,
        
         
        
           fontWeight: FontWeight.w300
        
         
        
           ),
        
         
        
           
        
         
        
           ),
        
         
        
         ],
        
         
        
     ),
        
         
        
     color: gridColor,
        
         
        
         //margin: EdgeInsets.only(top:20,left: 10),
        
         
        
        // elevation: 10.0,
        
         
        
         ),
        
        
        
        onTap: (){
/*setState(() {
this.Activegrid=5;
  
});

*/ 


 Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => user(),
  ));


        },
        
        
        
        ),
        
        
        
        
        
        //4
        
        
        
        InkWell(
        
         child:   Card(
        
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(CardBorder)),
            
         
     
        elevation: 8.0,
         
     child: Column(
        
         
        
         crossAxisAlignment: CrossAxisAlignment.center,
        
         
        
         mainAxisAlignment: MainAxisAlignment.center,
        
         
        
         children: <Widget>[
        
         
        
        //   Icon(Icons.subtitles,color: Colors.white,size: 70.0,),
    SvgPicture.asset("./images/bad.svg",height: 100,),
         
        
           Text("Experiences",textAlign: TextAlign.center,
        
         
        style: TextStyle(color: Colors.white,
        
           fontWeight: FontWeight.w300
        
         
        
           ),
        
         
        
           
        
         
        
           ),
        
         
        
         ],
        
         
        
     ),
        
         
        
     color: gridColor,
        
         
        
         //margin: EdgeInsets.only(top:20,left: 10),
        
         
        
         
        
         
        
         ),
        
        
        
        onTap: (){


   Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>Experinces(specificId: null,),
      ));



        }

        
        
        
        
        ),
        
        
        
        
        
        
        
     /*    ///5
        
        
        
        InkWell(
        
         child:   Card(
         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(CardBorder)),
            
         
         
        elevation: 8.0,
         
        
     child: Column(
        
         
        
         crossAxisAlignment: CrossAxisAlignment.center,
        
         
        
         mainAxisAlignment: MainAxisAlignment.center,
        
         
        
         children: <Widget>[
        
         
        
         
        
         
        
           Icon(Icons.settings,color: Colors.white,size: 70.0,),
        
         
        
           Text("Adminstration\nSettings",textAlign: TextAlign.center,
        
         
        style: TextStyle(color: Colors.white,
        
         
        
           fontWeight: FontWeight.w300
        
         
        
           ),
        
         
        
           
        
         
        
           ),
        
         
        
         ],
        
         
        
     ),
        
         
        
     color:gridColor,
        
         
        
        //  margin: EdgeInsets.only(top:20,left: 10),
        
         
        
         
        
         
        
         ),
        
        
        
        onTap: (){
  


 Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => settings(),
  ));


        },
        
        
        
        ),InkWell(
        
         child:   Card(
        
         
     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(CardBorder)),
            
    
        elevation: 8.0,
         
     child: Column(
        
         
        
         crossAxisAlignment: CrossAxisAlignment.center,
        
         
        
         mainAxisAlignment: MainAxisAlignment.center,
        
         
        
         children: <Widget>[
        
         
        
         
        
         
        
           Icon(Icons.settings_applications, color: Colors.white,size: 70.0,),
        
         
        
           Text("App Settings",textAlign: TextAlign.center,
        
         
        
style: TextStyle(color: Colors.white,
        
         
        
           fontWeight: FontWeight.w300
        
         
        
           ),
        
         
        
           
        
         
        
           ),
        
         
        
         ],
        
         
        
     ),
        
         
        
     color:gridColor,
        
         
        
         //margin: EdgeInsets.only(top:20,left: 10),
        
         
        
         
        
         
        
         ),
        
        
        
        onTap: (){},
        
        
        
        ),
        
      */
     
    
      
      
      
      ///3333
      
      ///
      
      ///
      
      
      
   
         ]
         ),
       ), 

        ),
        
  
         
        
        
        
        ////222
        
        ///
        
        
        
        
        
        
        
        
        
        //4
        
        
        
        
        ],),
  ),
),



      );



  }

  
}


























