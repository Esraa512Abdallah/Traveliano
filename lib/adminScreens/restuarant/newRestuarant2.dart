import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:traveliano/models/city.dart';
import 'package:traveliano/models/restuarant.dart';
import 'package:traveliano/services/admin.dart';
import 'package:traveliano/load.dart' as load;
import 'package:traveliano/adminScreens/restuarant/location3.dart' as location;

class NewRestaurant extends StatefulWidget {
Restuarant restuaranto=Restuarant();
NewRestaurant({this.restuaranto});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return NewRestaurantState();
  }
}

class NewRestaurantState extends State<NewRestaurant> {



  final formkey = GlobalKey<FormState>();
bool isLoad=false;
  
  var food_type = ["Chinese","Italian","SeaFood","Other"];

Restuarant restuarant = new Restuarant();

/*
  TextEditingController _Restaurant_Name = TextEditingController();
  TextEditingController _Restaurant_Cost = TextEditingController();
*/
  @override
  void initState() {
    super.initState();
if(widget.restuaranto!=null){

   this.restuarant=widget.restuaranto;
 
}
  }

  @override
  void dispose() {
    super.dispose();
   // _Restaurant_Name.dispose();
   // _Restaurant_Cost.dispose();

    // _latitude.dispose();
    // _longitude.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
//Navigator.pop(context);
    return Scaffold(



floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
floatingActionButton: FloatingActionButton(
backgroundColor: Colors.amber,
child: Icon(Icons.navigate_next,size: 40,),

onPressed: () async {

         if (formkey.currentState.validate()) {
  formkey.currentState.save();

  if(widget.restuaranto==null){this.restuarant.rate=0.0;
City __city=City();
await Firestore.instance.collection("Cities")
.document(this.restuarant.cityId).get().then((DocumentSnapshot x){
  __city=admin_ser().convertSnapToCity(x);});


__city.info=null;
  Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) =>location.MyApp(__city,this.restuarant) ),
  );}else{


Firestore.instance.collection("Restaurants").document(this.restuarant.Id)
.updateData({
"Name":restuarant.Name,

"cityId":restuarant.cityId,
"Cost":restuarant.cost


});



Navigator.pop(context);
  }


                      }


},



),








      appBar:widget.restuaranto==null? PreferredSize(
        child: AppBar(
          iconTheme: new IconThemeData(color: Colors.green),
          //   leading: Icon(Icons.filter_list,color: Colors.green,) ,

          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("New Restaurant",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.amber,
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      fontFamily: 'Comfortaa')),
        /*       Text(
                "Add New Resturant ",
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
      backgroundColor: Colors.grey[100],
      body: isLoad?load.load("Saving Restaurant ..."):Container(
        padding: EdgeInsets.only(left: 10,right: 10),
        margin:widget.restuaranto!=null?EdgeInsets.only(top:50,right: 2,left: 2,bottom: 5):EdgeInsets.only(top:5,right: 2,left: 2,bottom: 5),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
              bottomLeft:Radius.circular(30),
                 bottomRight: Radius.circular(30)
            
            ),
            border: Border.all(color: Colors.white10, width: 2)),
        child: Form(
          key: formkey,
          // autovalidate: true,
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 20.0,
                    ),
                    SizedBox(
                      child: _SlectCity(),
                    ),
                  ],
                ),
              ),

              //********************************************************************************************************************

              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: TextFormField(
                  initialValue: this.restuarant.Name,
                  onSaved: (val){

                    restuarant.Name=val;
                  },
                  validator: (val) {
                    if (val.length == 0)
                      return "Resturant name is required !!!";
                 
                 
                 
                  },
                  cursorWidth: 1.2,
                  obscureText: false,
           //       controller: _Restaurant_Name,
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
                    errorStyle: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.w500),
                    labelText: 'Restaurant Name',
                    hintText: "Enter Restaurant Name..",
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
                padding: const EdgeInsets.only(bottom: 20),
                child: DropdownButtonFormField(
                  validator: (val){

if(val==null)return "Food Type is Required !!!";

                  },
                  //isDense: true,
                  //isExpanded: true,
                  value: restuarant.foodType,
                  //icon: Icon(Icons.keyboard_arrow_down),
                  //iconEnabledColor: Colors.blue,
                  hint: Text("Select Food Type..."),
                  //disabledHint: Text("Enter Food Type..."),
                  onChanged: (val) {
                    setState(() {
                      this.restuarant.foodType = val;
                    });
                  },
                  items: this
                      .food_type
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      child: Text(value),
                      value: value,
                    );
                  }).toList(),
                ),
              ),

////**********************************************************//

              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: TextFormField(
                  initialValue: widget.restuaranto==null?"":restuarant.cost.toString(),
                  validator: (val) {
                    if (val.length == 0)
                      return "Resturant cost is required !!!";
                  },

                  onSaved: (val) {
              this.restuarant.cost=int.parse(val);
                  },

                  cursorWidth: 1.2, obscureText: false,

                  //     autocorrect: true,

                 // controller: _Restaurant_Cost,
                  //onChanged: (value){this.Restaurant_Cost= value;},
                  textAlign: TextAlign.left,

                  textDirection: TextDirection.ltr,

                  autofocus: false,

                  cursorColor: Colors.black,

                  keyboardType: TextInputType.numberWithOptions(decimal: true),

                  style: TextStyle(
                    color: Colors.black,
                    letterSpacing: .5,
                    wordSpacing: 1.5,
                    decorationStyle: TextDecorationStyle.solid,
                    decorationColor: Colors.red,
                  ),

                  decoration: InputDecoration(
                    // prefixIcon: Icon(Icons.text_format),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),

                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),

                    errorStyle: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.w500),

                    labelText: 'Resturant Cost',

                    hintText: "Enter Resturant Cost..",

                    //  filled: true,

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
              Padding(
                padding: const EdgeInsets.only(
                    top: 25, bottom: 5, left: 50, right: 50),
      
              ),
            ],
          ),
        ),
      ),
    );
  }


  Widget _SlectCity() {
    return StreamBuilder(
      stream: Firestore.instance.collection('Cities').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) return new Text('Error: ${snapshot.error}');

        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return new Text('Loading...');
          default:
            return DropdownButtonFormField<String>(
     //           icon: Icon(Icons.keyboard_arrow_down),
       //         iconEnabledColor: Colors.blue,
                hint: Text("Select City Name..."),
         //       disabledHint: Text("Enter City Name..."),
           //     isExpanded: true,
             //   isDense: true,
         value: this.restuarant.cityId,
                onChanged: (String newvale) {
                  setState(() {
     this.restuarant.cityId=newvale;
                  });
                  print(newvale+"#############NEW VALUE");
                },
                items: snapshot.data.documents.map((DocumentSnapshot document) {
                  return DropdownMenuItem<String>(
                    value: document.documentID,
                    child: Text(document['Name']),
                  );
                }).toList());
        }
      },
    );
  }
}
