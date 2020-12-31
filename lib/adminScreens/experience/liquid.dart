import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class liquid extends StatefulWidget {
  String colName;
  liquid({this.colName});
  
  @override
  _liquidState createState() => _liquidState();
}

class _liquidState extends State<liquid> {


getdoc() async {

await Firestore.instance.collection(widget.colName)
.getDocuments().then(
  (docs)
  {

    
docs.documents.forEach((element) {
setState(() {
  pages.add(Container(
  
  decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(element.data["photo"]),fit: BoxFit.cover)),
  height: MediaQuery.of(context).size.height,
  width: MediaQuery.of(context).size.width,
  child: 
  Center(
    child: Text(element.data["Name"],
    style: TextStyle(fontSize: 35,color: Colors.white),),
  ),
)
);

});



 });


  }
  
  );
    

}

  List<Container> pages=[];
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdoc();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Builder(
          builder: (context) =>
      pages.length!=0?      LiquidSwipe(
                
                  pages: pages, initialPage:0,
                 
              ):SpinKitFadingCircle(color: Colors.blueAccent,),
              
              
              ),
    );
  }
}