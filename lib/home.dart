import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
//import 'package:untitled/main.dart';

class home_screen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  void clickMe(){

  }
  @override
  Widget build(BuildContext context) {

    return DefaultTabController(

      length: 3,
      child: Scaffold(

        endDrawer: Drawer(

          child: ListView(
            children: <Widget>[
              new UserAccountsDrawerHeader(accountName: Text('hassn mohamed'), accountEmail: Text('hassn mohamed@gmail.com'),
                currentAccountPicture: new GestureDetector(
                  onTap: ()=>print("click"),
                  child: new CircleAvatar(
                    backgroundImage: new NetworkImage("https://www.howtogeek.com/wp-content/uploads/2018/06/shutterstock_1006988770.png"),
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
            ],
          ),
        ),
     
     
     
     
        appBar: AppBar(

  iconTheme: new IconThemeData(color: Colors.green),

            title: Text('Traveliano',style: TextStyle(color: Colors.amber)),
            backgroundColor: Colors.white,

   /*         actions: <Widget>[
              new IconButton(icon: new Icon
                (Icons.more_vert),
                  onPressed: clickMe),

            ],*/
            bottom: TabBar(

           //   isScrollable: true,
             
              tabs: <Widget>[
                Tab(
                  icon: Icon(Icons.home , textDirection: TextDirection.ltr,color: Colors.green,),
              //    child: Text('Home'),
                ),
                Tab(
                  icon: Icon(Icons.supervised_user_circle,color: Colors.green),
              //    child: Text('User'),
                ),
                Tab(
                  icon: Icon(Icons.language,color: Colors.green),
//child: Text('Cities'),
                )
              ],
            )
        ),
        body: TabBarView(
            children: <Widget>[
              ListView(
                children: <Widget>[
                  Text('Home'),
                  SizedBox(
                    height: 180,
                    width: 150,
                                      child: Card(
                      child: Column(
                        children: <Widget>[
                          Text('Experience here ')
                        ],
                      ),
              
                    ),
                  ),
                
    
    /*RaisedButton.icon(icon:Icon(Icons.ac_unit) ,label: Text(" Suggest "), onPressed: () {},
    
    
    color: Colors.green,
    elevation: 8.0,
    textColor: Colors.white,
    ),
    
    */
    
    
    
    
    /*    FlatButton(
          padding: const EdgeInsets.only(top: 12),
          onPressed: () => {},
          color: Colors.green,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 15),
                child:Icon(Icons.airplanemode_active,size: 30, color:
                Colors.white,),
              ),
              Padding(
                  padding: EdgeInsets.only(bottom: 15),
                  child:Text("Suggest Destination",
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.ltr,
//      textScaleFactor: 2.2,
                    style: TextStyle(fontWeight: FontWeight.bold,color:
                    Colors.white,fontSize: 20,),)
              ),
            ],
          ),
        ),*/
                ],
              ),
              ListView(
                children: <Widget>[
                  Text('User'),
                  Container(
                    child: Column(
                      children: <Widget>[
                        Text('hi from User')

                      ],
                    ),
                    height: 190,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.black
                        )
                    ),
                  ),
          
               
               
                ],
              ),
              ListView(
                children: <Widget>[
                  Text('Cities'),
                  Container(
                    child: Column(
                      children: <Widget>[
                        Text('hi from Cities')
                      ],
                    ),
                    height: 190,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.black
                        )
                    ),
                  ),
               
                ],
              )
            ],),
        
     
      ),
    );
  }
}
