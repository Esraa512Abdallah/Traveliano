import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SearchPageState();
  }

}
String SearchText=null;

// حط المتغير هنا


class SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Scaffold(

appBar: AppBar(
  
  backgroundColor: Colors.purple[300],
  
  title: 

     TextFormField(
              autofocus: false,
              cursorColor: Colors.black,
              cursorWidth: 1.0,
onChanged: (val){setState(() {
  SearchText=val;

});},
              decoration:InputDecoration(
enabledBorder: UnderlineInputBorder(
  borderSide: BorderSide(color: Colors.transparent)
),
                hintText: 'Search for everything..',
                hintStyle:TextStyle(color: Colors.white24),
                prefixIcon:Icon(Icons.search,size: 30,color: Colors.red[400],) ,
              //  suffixIcon: Icon(Icons.keyboard_voice,size: 30,),

              ),

            )


,),

      body: 

      Container(
        child: Column(
          children: <Widget>[
        
        
        Container(
height: 50,
color: Colors.white,
child: ListView(
scrollDirection:Axis.horizontal,

children: <Widget>[


Card(
  color: Colors.grey[100],
  child: Padding(
    
    padding: const EdgeInsets.all(8.0),
    child: Text("Users"),
  ),
),

Card(
  child: Text("Experince"),
),
Card(
  child: Text("Hotels"),
),
Card(
  child: Text("Attraction"),
),
Card(
  child: Text("Restaurants"),
),

Card(
  child: Text("Cities"),
),




],

),


        )
        
          
       
          
          
          ],
        ),
      ),
   
   
    );
  }


}