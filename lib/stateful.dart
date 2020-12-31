/* import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


// ignore: camel_case_types
class home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return homeState();
  }


}



class homeState extends State<home> {
  TextEditingController x = TextEditingController();




  String val=''; String dropval='rana';
var m;
int num=0;
bool z=false;
var gender="Male";
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return
      Scaffold(
        body:  Container(

          color: Colors.white30,
          //   height: MediaQuery.of().size.height/2,

//decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(15.0)) ),

        child: Column(children: <Widget>[
/*
          TextField(obscureText: false,
            decoration: InputDecoration(prefixIcon: Icon(Icons.airplanemode_active)),
            controller: x,
            onChanged: (val){print(x.text);},
         //onSubmitted: (val){print("${x.text} was submitted.....");},
            //maxLines: null ,
            style: TextStyle(color: Colors.green),),

*/
          Container(

            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(top: 25),
            child: TextFormField(
controller: x,
              decoration: InputDecoration(
filled: true,
              labelStyle: TextStyle(
                color: Colors.indigo


              ),
              //  prefix: Icon(Icons.insert_emoticon),
                hintText: "Enter Your Name ...",
                labelText: 'First Name',
                counterText: "Required",
                counterStyle: TextStyle(color: Colors.red),
             enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  style: BorderStyle.solid,
                  color: Colors.blue,
                  width: 1,

                ),


                ),
focusedBorder: OutlineInputBorder(
  borderSide: BorderSide(
    style: BorderStyle.solid,
    color: Colors.orange,
    width: 1,




  ),

         ),
              ),
          ),



          ),


        FlatButton(

          color: Colors.orange ,
          child: Text('Click!!',style: TextStyle(color: Colors.white),),
          colorBrightness: Brightness.light,
          onPressed: (){setState(() {
          val=x.text;
        });}
        ,),
          RaisedButton(

            color: Colors.amber ,
            child: Text('Click!!',style: TextStyle(color: Colors.white),),
            colorBrightness: Brightness.light,
            onPressed: (){setState(() {
              val=x.text;
            });}
            ,),


      /*    Checkbox(value:z ,
           // tristate: true
             // ,
            onChanged: (bool newval){
            setState(() {
              z=newval;

            });

          } ,activeColor:Colors.amber ,checkColor:Colors.yellow ,)
          ,*/

          CheckboxListTile(
            value:z ,
            onChanged:(bool newval){  setState(() {z=newval;}); if(gender=="Male"){gender="Female";}else{gender="Male";}; } ,
            title:Text(gender,style: TextStyle(fontSize: 15.0,color:Colors.indigo),) ,
            subtitle:Text("Gender") ,
            isThreeLine: true,
            checkColor:Colors.white ,
            activeColor: Colors.green,
            controlAffinity:ListTileControlAffinity.platform ,

secondary: Icon(Icons.beenhere,color: Colors.indigo,),
            dense: true,


          ),




DropdownButton<String>(value: dropval,
  items: <String>['Egypt','Russia','Usa'].map<DropdownMenuItem<String>>((String value){

    return DropdownMenuItem<String>(

    //value: Text(value)
   // ,child: ,
    );

  }).toList()
  ,onChanged: null,)








,Text("Male"),
Radio(
  onChanged:(int x){
    setState(() {

      num=x;
    });

  },
  value:0 ,groupValue:num ,activeColor:Colors.deepPurple ,)
      ,
Text("Female"),
Radio(onChanged:(int x){
  setState(() {

    num=x;
  });

} ,value: 1,groupValue: num,activeColor: Colors.orange,)
,
Switch(value:z ,onChanged: (bool f){setState(() {

  z=f;
});},
  activeTrackColor: Colors.deepOrange,
  inactiveThumbColor: Colors.amber,

  activeColor: Colors.indigo,),

        ],
          ),







        ),


        drawer: Drawer(



        ),


        appBar: AppBar(title: Text("Pack&Go",style: TextStyle(fontFamily: 'cursive' ),),
          backgroundColor: Colors.green,
          centerTitle: true,),


      );

  }


}














 */