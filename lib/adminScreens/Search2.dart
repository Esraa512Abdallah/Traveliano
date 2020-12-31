import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:firebase_connect/searchServices.dart';
import 'dart:core';


class citiesPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return citiesPageState();
  }

}

class citiesPageState extends State<citiesPage> {

  var queryResultSet = [];
  var tempSearchStore = [];

  initiateSearch(value) {
    if (value.length == 0) {
      setState(() {
        queryResultSet = [];
        tempSearchStore = [];
      });
    }

    var capitalizedValue =
        value.substring(0, 1).toUpperCase() + value.substring(1);

    if (queryResultSet.length == 0 && value.length == 1) {
      SearchService().searchByName(value).then((QuerySnapshot docs) {
        for (int i = 0; i < docs.documents.length; ++i) {
          queryResultSet.add(docs.documents[i].data);
        }
      });
    } else {
      tempSearchStore = [];
      queryResultSet.forEach((element) {
        if (element['Name'].startsWith(capitalizedValue)) {
          setState(() {
            tempSearchStore.add(element);
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: PreferredSize(
          child: AppBar(
            backgroundColor:Colors.purple[200],

            title: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text("Traveliano",
                    textAlign: TextAlign.center,
                    style: TextStyle(

                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                    )),

              ],
            ),

            centerTitle: true,
          ),

          preferredSize: Size.fromHeight(70),
        ),

        body: ListView(children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              onChanged: (val) {
                initiateSearch(val);
              },
              decoration: InputDecoration(
                  prefixIcon: IconButton(
                    color: Colors.black,
                    icon: Icon(Icons.arrow_back),
                    iconSize: 20.0,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  contentPadding: EdgeInsets.only(left: 25.0),
                  hintText: 'Search by name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0))),
            ),
          ),
          SizedBox(height: 10.0),
                    Container(

                        child:Column(
                      children: tempSearchStore.map((element) {
                      return buildResultCard(element);
                      }).toList()
                      ),

                      ),
     


        ]));
  }
}

Widget buildResultCard(data) {
  return Card(


      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      elevation: 2.0,

      child: Container(

          width:double.infinity ,
          height:100 ,
          padding: EdgeInsets.all(20.0),

              child: Text(data['rate'].toString(),
               // textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                ),
              )
          
              
      )
  );
}

class SearchService {
  searchByName(String searchField) {

    return Firestore.instance
        .collection('Cities')
        .where('SearchKey',
        isEqualTo: searchField.substring(0, 1).toUpperCase())
        .getDocuments();
  }
  

}