import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:traveliano/models/city.dart';
import 'package:traveliano/models/tourismplace.dart';
import 'package:traveliano/services/admin.dart';

import 'package:traveliano/adminScreens/tourismplace/location4.dart' as location;





class NewTourismPlace extends StatefulWidget {
TourismPlace tourismPlace=new TourismPlace();
NewTourismPlace({this.tourismPlace});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return NewTourismPlaceState();
  }
}

class NewTourismPlaceState extends State<NewTourismPlace> {

  final formkey = GlobalKey<FormState>();

TourismPlace _tourismPlace =new TourismPlace();


  @override
  void initState() {
    super.initState();
if(widget.tourismPlace!=null){
  this._tourismPlace=widget.tourismPlace;
}
 
 
  }

  @override
  void dispose() {
    super.dispose();

  }





  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(

floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
floatingActionButton: FloatingActionButton(

  child: Center(child: Icon(Icons.navigate_next,size: 45,)),
  backgroundColor: Colors.orange,
  
  onPressed: () async {

                    if (formkey.currentState.validate()) {
                          ///save your state

                        formkey.currentState.save();
                      
                          
//admin_ser().addTourismPlace(this._tourismPlace)
if(widget.tourismPlace==null){
City __city=City();
await Firestore.instance.collection("Cities")
.document(_tourismPlace.cityId).get()
.then((DocumentSnapshot x){
  
  
  __city=admin_ser().convertSnapToCity(x);});
//print("----------------------City Passed to loca4 "+__city.Name+__city.latitude.toString());
  __city.info=null;
  Navigator.pushReplacement(
      context,
MaterialPageRoute(builder: (context) =>location.MyApp(__city,this._tourismPlace) ),
  
  ); 
}else{


await Firestore.instance.collection("tourismPlaces").document(_tourismPlace.Id).updateData({


"Name":_tourismPlace.Name,
"Description": _tourismPlace.description,
"Cost": _tourismPlace.cost,
"cityId":_tourismPlace.cityId

});
Navigator.pop(context);
}
                        }

}),


      backgroundColor: Colors.grey[100],
      appBar: widget.tourismPlace==null?PreferredSize(
        child: AppBar(
          iconTheme: new IconThemeData(color: Colors.green),
          //   leading: Icon(Icons.filter_list,color: Colors.green,) ,

          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("New Tourism Place",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.orange,
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
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


        preferredSize: Size.fromHeight(60),
      ):null,
      body: Container(
        height: 550,
        padding:EdgeInsets.all(10),
        margin: widget.tourismPlace==null? EdgeInsets.only(top: 10):EdgeInsets.only(top: 50),
        decoration: BoxDecoration(
            color: Colors.white, 
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30)
            ),
            border: Border.all(color: Colors.white10, width: 2)),
        child: Center(
          child: Form(
            key:formkey,



            child: ListView(




              children: <Widget>[



                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Column(
                    children: <Widget>[

                      SizedBox(height: 20.0,),

                      SizedBox(
                        child:_SlectCity() ,
                      ),



                    ],
                  ),
                ),


                //********************************************************************************************************************


                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: TextFormField(
initialValue: _tourismPlace.Name,
                    validator: (val) {
                      if (val.length == 0) return "Tourism Place name is required !!!";
                    },
onSaved: (val){

this._tourismPlace.Name=val;

},

                    cursorWidth: 1.2,   obscureText: false,

                 //   controller:_TourismPlace_Name,

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

                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),

                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),

                      errorStyle:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.w500),

                      labelText: 'TourismPlace Name',

                      hintText: "Enter TourismPlace Name..",

                      contentPadding: EdgeInsets.all(20),

                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.greenAccent,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                        gapPadding: 40.0,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.green,
                          width: 3.0,
                        ),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                ),

//////////////////////////////////////////////////////



      Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: TextFormField(
                  initialValue: _tourismPlace.cost==null?"":_tourismPlace.cost.toString(),
                    validator: (val) {
                      if (val.length == 0) return "TourismPlace  cost is required !!!";
                    },


onSaved: (val){

this._tourismPlace.cost=int.parse(val);

},

                    cursorWidth: 1.2,

                    obscureText: false,

//                  controller: _TourismPlace_Cost ,

                    textAlign: TextAlign.left,

                    textDirection: TextDirection.ltr,

                    autofocus: false,

                    cursorColor: Colors.black,

                    keyboardType:  TextInputType.numberWithOptions(
                        decimal: true
                    
                    ),           
           inputFormatters: <TextInputFormatter>[
          WhitelistingTextInputFormatter.digitsOnly
    ],

                    style: TextStyle(
                      color: Colors.black,
                      letterSpacing: .5,
                      wordSpacing: 1.5,
                      decorationStyle: TextDecorationStyle.solid,
                      decorationColor: Colors.red,
                    ),

                    decoration: InputDecoration(
   suffixStyle: TextStyle(fontSize: 12),
                           suffixText: "entry/visit",
suffixIcon: Icon(Icons.attach_money),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),

                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),

                      errorStyle:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.w500),

                      labelText: 'TourismPlace Cost',

                      hintText: "Enter TourismPlace Cost...",


                      contentPadding: EdgeInsets.all(20),

                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.greenAccent,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                        gapPadding: 40.0,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.green,
                          width: 3.0,
                        ),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                ),

////**********************************************************///
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: TextFormField(
initialValue: _tourismPlace.description,
                    validator: (val) {
                      if (val.length == 0) return "Tourism Place description is required !!!";
                    },
onSaved: (val){

this._tourismPlace.description=val;

},

                    cursorWidth: 1.2,   obscureText: false,

                //    controller:_TourismPlace_Description,

                    textAlign: TextAlign.left,

                    textDirection: TextDirection.ltr,

                    autofocus: false,

                    cursorColor: Colors.black,

                    keyboardType: TextInputType.text,

                    maxLines: 3 ,

                    style: TextStyle(
                      color: Colors.black,
                      letterSpacing: .5,
                      wordSpacing: 1.5,
                      decorationStyle: TextDecorationStyle.solid,
                      decorationColor: Colors.red,
                    ),

                    decoration: InputDecoration(

                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),

                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),

                      errorStyle:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.w500),

                      labelText: 'TourismPlace description ',

                      hintText: "Enter TourismPlace description ..",

                      contentPadding: EdgeInsets.all(20),

                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.greenAccent,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                        gapPadding: 40.0,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.green,
                          width: 3.0,
                        ),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                ),


////**********************************************************//





          

////***********************************************************************************************************
        


              ],
            ),
          ),
        ),
      ),
    );
  }



  Widget _SlectCity(){
    return FutureBuilder(
      future: Firestore.instance.collection('Cities').getDocuments(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
        if (snapshot.hasError)
          return new Text('Error: ${snapshot.error}');

        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return new Text('Loading...');
          default:
            return   DropdownButtonFormField<String>(

           //     icon: Icon(Icons.keyboard_arrow_down),
          //      iconEnabledColor: Colors.blue,
                hint: Text("Select City Name..."),
            //    disabledHint: Text("Enter City Name..."),
            //    isExpanded: true,
             //   isDense: true,


                value: this._tourismPlace.cityId ,

                onChanged:(String newvale){

                  setState(() {
                this._tourismPlace.cityId=newvale;

                  });
                },


                items: snapshot.data.documents.map((DocumentSnapshot document){
                  return DropdownMenuItem<String>(
                    value: document.documentID,
                    child:Text(document['Name']),

                  );
                }).toList());
        }
      },
    );
  }
}




