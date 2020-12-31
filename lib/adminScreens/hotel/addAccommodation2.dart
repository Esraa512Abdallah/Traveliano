import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:traveliano/globals.dart';
import 'package:traveliano/models/city.dart';
import 'package:traveliano/models/hotel.dart';
import 'package:traveliano/adminScreens/hotel/location2.dart' as location;
import 'package:traveliano/services/admin.dart';




class NewAccommodation extends StatefulWidget {
 Hotel hotel=new Hotel();
NewAccommodation({this.hotel});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return NewAccommodationState();
  }
}

class NewAccommodationState extends State<NewAccommodation> {
Map<String ,bool>values;
  final formkey = GlobalKey<FormState>();

 Hotel _hotel=new Hotel();




  @override
  void initState() {
    super.initState();
    this._hotel=widget.hotel;  values=this._hotel.services;









    
  }

  @override
  void dispose() {
    super.dispose();

  
    //_Accommodation_Name.dispose();
    ////_Max_price.dispose();
    //_Min_price.dispose();


    // _latitude.dispose();
    // _longitude.dispose();
  }





  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(

//backgroundColor: Colors.redAccent,


floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

floatingActionButton: FloatingActionButton(
  
  
  child: Icon(Icons.navigate_next,size: 45,),backgroundColor: Colors.red[300],
  
  onPressed: () async {


if(formkey.currentState.validate()){
formkey.currentState.save();


if(this._hotel.Id==null){
this._hotel.rate=0.0;
City __city=City();
await Firestore.instance.collection("Cities")
.document(this._hotel.cityId).get().then((DocumentSnapshot x){
  __city=admin_ser().convertSnapToCity(x);});
__city.info=null;
/*   Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>location.MyApp(__city,this._hotel) ),
  ); */


Navigator.pushReplacement(context,
      MaterialPageRoute(builder: (context){return location.MyApp(__city,this._hotel);}));
     



}else{


Firestore.instance.collection("accommodation").document(this._hotel.Id).updateData({

"Name":this._hotel.Name,
"minPrice":this._hotel.minPrice,
"maxPrice":this._hotel.maxPrice,
"cityId":this._hotel.cityId,
"services":this._hotel.services


});


Navigator.pop(context);




}


}




}

),




    appBar: this._hotel.photo==null?AppBar(
      iconTheme: new IconThemeData(color: Colors.red[200]),


      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("New Hotel/Hostel",
              //textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.red[300],
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  )),
      /*     Text(
            "New Accommodation ",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.blue,
                fontSize: 10,
                fontWeight: FontWeight.w300,
                ),
          ), */
        ],
      ),

      //centerTitle: true, 
      backgroundColor: Colors.white,
    ):null,
   
   
      body: Container(
        padding:EdgeInsets.all(10),
        margin: EdgeInsets.only(top: 0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            border: Border.all(color: Colors.white10, width: 2)),
        child: Form(
          key:formkey,



          child: ListView(




            children: <Widget>[



              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Column(
                  children: <Widget>[

                    SizedBox(height: 10.0,),

                    SizedBox(
                      child:_SlectCity() ,
                    ),



                  ],
                ),
              ),


              //**************************************************************************************


              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: TextFormField(
initialValue: _hotel.Name,
                  validator: (val) {
                    if (val.length == 0) return "Accommodation name is required !!!";
                  },

onSaved: (val){

this._hotel.Name=val;

} ,
                  cursorWidth: 1.2,   obscureText: false,

             //     controller:_Accommodation_Name,

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

                    labelText: 'Name',

                    hintText: "Enter Hotel/Hostel Name...",

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
                padding: const EdgeInsets.only(bottom: 10),
                child: TextFormField(
                  initialValue:_hotel.maxPrice!=null?_hotel.maxPrice.toString():"",
onChanged:(val){

this._hotel.maxPrice=int.parse(val);

}
,
                  validator: (val) {
                    if (val.length == 0) return "Accommodation Max price is required !!!";
                  
                  if(this._hotel.maxPrice<this._hotel.minPrice) return "Max price should be higher than min Price !!!";
                  },


onSaved: (val){

this._hotel.maxPrice=int.parse(val);

},
                  cursorWidth: 1.2,   obscureText: false,

               //   controller:_Max_price,

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
                         suffixText: "Per Night",
suffixIcon: Icon(Icons.attach_money),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),

                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),

                    errorStyle:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.w500),

                    labelText: 'Max price ',

                    hintText: "Enter Max price ...",

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





              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: TextFormField(
initialValue: _hotel.minPrice!=null?_hotel.minPrice.toString():"",
                  onChanged:(val){

this._hotel.minPrice=int.parse(val);

},
                  validator: (val) {
                    if (val.length == 0) return "Accommodation Min price is required !!!";
                  },


onSaved: (val){

this._hotel.minPrice=int.parse(val);

},


                  cursorWidth: 1.2,

                  obscureText: false,

                 // controller: _Min_price ,

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
                         suffixText: "Per Night",
suffixIcon: Icon(Icons.attach_money),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),

                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),

                    errorStyle:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.w500),

                    labelText: 'Min price',

                    hintText: "Enter Min price...",


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

////***********************************************************************************************************



  
  Text(' Services&Facilities:',style: TextStyle(fontSize:15,fontWeight: FontWeight.w300 ),)

,
 Container(height: MediaQuery.of(context).size.height/1.5,
   child: Padding(
     padding: const EdgeInsets.fromLTRB(15,5,15,10),
     child: ListView(
            children: this._hotel.services.keys.map((String key) {
              return CheckboxListTile( 
                dense: true,
                isThreeLine: false,
                activeColor: Colors.blue,
            //    secondary: Icon(Icons.done_all),
             //   subtitle: Text("1"),
controlAffinity: ListTileControlAffinity.platform,
               selected:this._hotel.services[key], 
               
                title: Text(key,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500
                ,fontFamily: "Bitter"
                ),),
                value: this._hotel.services[key],
                onChanged: (bool value) {
                  setState(() {
                  this._hotel.services[key] = value;
                  });
                },
              );
            }).toList(),
          ),
   ),
 )


,


/* ChipListChoice(
        title: "Users",
        usersDataSet: ["wifi","free girls","fuck"].toSet(),
        finalListResult: _finalListSelection,
        color: Colors.cyan), */
          


            ],
          ),
        ),
      ),
    );
  }

 

  Widget _SlectCity(){
    return StreamBuilder(
      stream: Firestore.instance.collection('Cities').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
        if (snapshot.hasError)
          return new Text('There are Some Errors , Try Again later');
if(!snapshot.hasData)return SpinKitThreeBounce(
  color: Colors.redAccent,
  size: 15,
);
            return   DropdownButtonFormField<String>(

              //  icon: Icon(Icons.keyboard_arrow_down),
                //iconEnabledColor: Colors.blue,
                hint: Text("Select City Name..."),
                //disabledHint: Text("Enter City Name..."),
                //isExpanded: true,
                //isDense: true,


                value: this._hotel.cityId ,

                onChanged:(String newvale){

                  setState(() {
                    this._hotel.cityId =newvale;

                  });
                },


                items: snapshot.data.documents.map((DocumentSnapshot document){
                  return DropdownMenuItem<String>(
                    value: document.documentID,
                    child:Text(document['Name']),

                  );
                }).toList());
        
      },
    );
  }
}




