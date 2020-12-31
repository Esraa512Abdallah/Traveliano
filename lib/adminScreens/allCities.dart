import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:traveliano/adminScreens/city/city.dart';
import 'package:traveliano/globals.dart';

import 'package:traveliano/services/admin.dart';
import 'package:flutter/material.dart';
import 'package:traveliano/adminScreens/dialog.dart';
import 'package:traveliano/models/city.dart';

import 'addNewcity.dart' as editCity;
import 'package:traveliano/services/admin.dart';

import '../load.dart';

class Cities extends StatefulWidget {
  @override
  _citiesState createState() => _citiesState();
}

class _citiesState extends State<Cities> {
  String _SearchText = "";

  bool isFilter = false;
  bool isApply = false;

  City filteredCity = new City();

  RangeLabels labels = RangeLabels('100', '25000');
  RangeValues valuess = RangeValues(100, 25000);

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
                    fontFamily: "Baloo", color: Colors.green, fontSize: 20.0),
              ),
              alignment: Alignment.topLeft),
       
    /*      Padding(
            padding: const EdgeInsets.all(8.0),
            child: RangeSlider(

                //divisions:10 ,
                activeColor: Colors.amber,
                max: 500000,
                min: 0,
                labels: this.labels,
                values: valuess,
                onChanged: (val) {
                  setState(() {
                    valuess = val;
                    str = val.start.round();
                    end = val.end.round();

                    this.filteredCity.maxBudget = end;
                    this.filteredCity.minBudget = str;
                    print(val.start.round().toString() +
                        "_________" +
                        val.end.round().toString());

                    this.labels = RangeLabels(
                        val.start.round().toString() + "\$",
                        val.end.round().toString() + "\$");
                  });
                }),
          ),*/
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

                value: this.filteredCity.Country,

                hint: Text("Country ..."),
                // disabledHint: Text("Travel with ...."),
                onSaved: (val) {
                  this.filteredCity.Country = val;
                },
                onChanged: (val) {
                  setState(() {
                    this.filteredCity.Country = val;
                  });
                },
                items:
                  countries
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

                value: this.filteredCity.recommended_Type,

                hint: Text("City Type ..."),
                // disabledHint: Text(""),
                onSaved: (val) {
                  this.filteredCity.recommended_Type = val;
                },
                onChanged: (val) {
                  setState(() {
                    this.filteredCity.recommended_Type = val;
                  });
                },
                items: this.types.map<DropdownMenuItem<String>>((String value) {
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

                value: this.filteredCity.recommended_Weather,

                hint: Text("Weather ..."),
                // disabledHint: Text("Travel with ...."),
                onSaved: (val) {
                  country = val;
                },
                onChanged: (val) {
                  setState(() {
                    this.filteredCity.recommended_Weather = val;
                  });
                },
                items:
                    this.Weather.map<DropdownMenuItem<String>>((String value) {
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
                      isFilter = !isFilter;
                      isApply = false;
                    });
                  },
                ),
                RaisedButton(
                  onPressed: () {
                    setState(() {
                      isApply = true;
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

  user(BuildContext context, DocumentSnapshot snap) {
    return InkWell(
      child: SizedBox(
        height: 95,
        child: Container(
          margin: EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black45,
                blurRadius: 3.0,
              )
            ],
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    /*    Container(
                      //   padding: EdgeInsets.only(left: 20),
                      width: 70,
                      height: 80,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                        image:NetworkImage(
                  'http://i.imgur.com/74sByqd.jpg'),
       
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
              
              */
                    //    var user=     Firestore.instance.collection("Users").document(snap.data["cityID"]);

                    Stack(
                      children: <Widget>[
                        snap.data["rate"] < 2
                            ? Icon(
                                Icons.star_border,
                                size: 40,
                                color: Colors.amber,
                              )
                            : snap.data["rate"] < 3.9
                                ? Icon(
                                    Icons.star_half,
                                    size: 40,
                                    color: Colors.amber,
                                  )
                                : Icon(
                                    Icons.star,
                                    size: 40,
                                    color: Colors.amber,
                                  ),
                        Text(
                          snap.data["rate"].toString(),
                          style: TextStyle(color: Colors.teal, fontSize: 25),
                        )
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                      pageBuilder: (context, animation,
                                              secondaryAnimation) =>
                                          cityPreview(snap),
                                      transitionDuration:
                                          Duration(milliseconds: 100),
                                      transitionsBuilder: (BuildContext context,
                                          Animation<double> animation,
                                          Animation<double> secondaryAnimation,
                                          Widget child) {
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
                                      }));
                            },
                            child: Text(
                              snap.data["Name"],
                              overflow: TextOverflow.ellipsis,
                              softWrap: false,
                              style: TextStyle(
                                  fontFamily: "Baloo",
                                  color: Colors.blue,
                                  fontSize: 20),
                            ),
                          ),
                          Text(snap.data["country"]),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    IconButton(
                        //    padding: EdgeInsets.only(left:50),
                        icon: Icon(
                          Icons.edit,
                          color: Colors.blue,
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              PageRouteBuilder(
                                  pageBuilder: (context, animation,
                                          secondaryAnimation) =>
                                      editCity.newCity(
                                          admin_ser().convertSnapToCity(snap),
                                          true),
                                  transitionDuration:
                                      Duration(milliseconds: 1000),
                                  transitionsBuilder: (BuildContext context,
                                      Animation<double> animation,
                                      Animation<double> secondaryAnimation,
                                      Widget child) {
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
                                  }));
                        }),
                    IconButton(
                        //    padding: EdgeInsets.only(left:50),
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        onPressed: () {

//_fcm.getToken().then((val){print("Token --------------  "+val);});

                          Dialogs.yesAbortDialog(
                              context, snap.documentID, "Cities"); 
                        }),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  var types = ["Costal", "Religous", "Ancient", "Ski"];
  var Weather = ["Summer", "Winter", "Autum", "Spring"];


/*
List listofdocs;
////////////////////////////
///
getdocs()  async {

await Firestore.instance.collection('Cities').getDocuments().then((QuerySnapshot docs){

for(var doc in docs.documents){

if(doc.data['Name'].toString().contains(_SearchText)){

setState(() {
  listofdocs.add(doc);

});

}


}

///setState(() {
 
 //listofdocs=docs.documents.toList();

//});
 


});


}*/
/////////////////////

  int str = 0, end = 0;
  String country = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
/* 
    this.filteredCity.maxBudget = 25000;
    this.filteredCity.minBudget = 100; */
    filteredCity.recommended_Type = "Costal";
    filteredCity.recommended_Weather = "Summer";
    filteredCity.Country = "United States";
  }









//FirebaseMessaging _fcm= FirebaseMessaging();
 
 
 
  @override
  Widget build(BuildContext context) {
    Widget searchfield = TextFormField(
      cursorWidth: 1.2, obscureText: false,

      //        controller:_TourismPlace_Name,
      onChanged: (val) {
        setState(() {
          this._SearchText = val;
//getdocs();
        });
      },

      textAlign: TextAlign.left,
      textDirection: TextDirection.ltr,
      autofocus: false,
      cursorColor: Colors.black,
      keyboardType: TextInputType.text,
      style: TextStyle(
        color: Colors.black,
        letterSpacing: .5,
        wordSpacing: 1.5,
        decorationStyle: TextDecorationStyle.solid,
        decorationColor: Colors.red,
      ),

      decoration: InputDecoration(
        suffixIcon: Icon(Icons.search),
        fillColor: Colors.white,
        //  filled: true,
        hintText: "Search for city ...",
        contentPadding: EdgeInsets.all(5),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(20.0),
          gapPadding: 40.0,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
    );

    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
/* var x;
await _fcm.getToken().then((st){

x=st;
});
print("My Token is _________________    "+x ); */

Navigator.push(context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation)=>editCity.newCity(null,false),
   transitionDuration: Duration(milliseconds: 1000),
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
          child: Icon(Icons.add,size: 25,),
          mini: true,
        ),
        //    backgroundColor: Colors.grey[200],
        appBar: PreferredSize(
          child: AppBar(
            elevation: 5,
            bottom: PreferredSize(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: searchfield,
              ),
              preferredSize: Size.fromHeight(40),
            ),
            iconTheme: new IconThemeData(color: Colors.green),
            //   leading: Icon(Icons.filter_list,color: Colors.green,) ,
            actions: <Widget>[
              InkWell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: isFilter == false
                      ? SvgPicture.asset("images/filter.svg", height: 25)
                      : Icon(Icons.close),
                ),
                onTap: () {
                  setState(() {
                    isFilter = !isFilter;
                    isApply = false;
                  });

                  //filterDialog.yesAbortDialog(context);
                },
              )
            ],
            title: Text("Top Cities",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.blue[300],
                    fontSize: 20,
                    fontWeight: FontWeight.w900)),

            centerTitle: true, backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
          ),
          preferredSize: Size.fromHeight(95),
        ),
 
        body: isFilter && isApply == false
            ? FilterWidget()
            : isApply
                ? FutureBuilder(
                    future: Firestore.instance
                        .collection('Cities')
                        .where("country", isEqualTo: this.filteredCity.Country)
                        .where("recommendedWeather",
                            isEqualTo: this.filteredCity.recommended_Weather)
                        .where("recommendedType",
                            isEqualTo: this.filteredCity.recommended_Type)
                    
                        // .where("maxBudget",isLessThan: 10000)
                 //       .orderBy("rate", descending: true)
                        .getDocuments(),
                    builder: (context, snapshots) {
                      if (!snapshots.hasData)
                        return Center(child: load("Applying Filters..."));

                      if (snapshots.data.documents.length == 0)
                        return Center(
                            child: Center(
                                child: ListView(
                       //   mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.sentiment_dissatisfied,
                              size: MediaQuery.of(context).size.width/1.2,
                              color: Colors.grey[200],
                            ),
                            Text(
                              "Oops,There are not Cities Matching\n your filters.Try Another Filters. ",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontFamily: "Oswald",color: Colors.grey),
                            ),
                          ],
                        )));
                      return ListView.builder(
                        itemBuilder: (context, index) {
                          return user(context, snapshots.data.documents[index]);
                        },
                        itemCount: snapshots.data.documents.length,
                      );
                    },
                  )
                : StreamBuilder(
                    stream: _SearchText.isEmpty
                        ? Firestore.instance.collection('Cities').snapshots()
                        : Firestore.instance
                            .collection('Cities')
                            .where("Name", isGreaterThanOrEqualTo: _SearchText)
                            .snapshots(),
                    builder: (context, snapshots) {
                      if (!snapshots.hasData)
                        return Center(child: load("Loading ...."));
if (snapshots.data.documents.length == 0)
                          return Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.sentiment_dissatisfied,
                                size:200,color: Colors.grey[400],
                              ),
                              Text("No Cities Found"),
                            ],
                          ));
                      return ListView.builder(
                        itemBuilder: (context, index) {
                          return user(context, snapshots.data.documents[index]);
                        },
                        itemCount: snapshots.data.documents.length,
                      );
                    },
                  ));
  }
}
