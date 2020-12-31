/*احط اليوزر اى دى جوا كولكشن الريت مع الريت نفسه*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flare_flutter/flare_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:provider/provider.dart';
import 'package:reviews_slider/reviews_slider.dart';
import 'package:shape_of_view/shape_of_view.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:traveliano/adminScreens/experience/ratePlacesEx.dart';
import 'package:traveliano/animation/fadeAnimmation.dart';

import 'package:traveliano/globals.dart';
import 'package:traveliano/models/experience.dart';
import 'package:traveliano/services/admin.dart';

class AddEx extends StatefulWidget {
  @override
  _AddExState createState() => _AddExState();
}

class _AddExState extends State<AddEx> {
  String state = "Okay";

  final _formKey = new GlobalKey<FormState>();

  Experience _experience = Experience();
  String _country;

  bool _isloading = false;

  int page = 1, budgt = 1000;

  String animation;

  var value = 3.0;
  FlareController flareController;
  int radio1 = 0;
  int radio2 = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* 
          floatingActionButton:page==3? FloatingActionButton(
            backgroundColor: Colors.blue[300],
            child: Icon(Icons.navigate_next,size: 40,),
            onPressed: (){
    
    
    setState(() {
      page=page+1;
    });
          }):null,
      
       */
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          /*           decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.brown, Colors.red[300]])),
       */
          height: MediaQuery.of(context).size.height - 50,
          padding: EdgeInsets.only(top: 0),
          child: page == 1
              ? Container(
                  //color: Colors.teal,

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      /* Container(margin: EdgeInsets.only(top:22),
      height: 100,
      width: 390,
      child: CustomPaint(painter: feeling(),)),
    
     */
                      ShapeOfView(
                        shape: ArcShape(
                            direction: ArcDirection.Outside,
                            height: 40,
                            position: ArcPosition.Bottom),
                        child: Container(
                          height: MediaQuery.of(context).size.width / 1.5,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.red[300],
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Share with us your Trip",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.w200,
                                //fontStyle: FontStyle.italic
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                        child: DropdownButtonFormField(
                          //isDense: true,isExpanded: true,
                          decoration: InputDecoration(

                              //  icon: Icon(Icons.keyboard_arrow_down),
                              //     iconEnabledColor: Colors.blue,
                              ),

                          value: this._country,

                          hint: Text("Select the country..."),
                          // disabledHint: Text("Travel with ...."),

                          onChanged: (val) {
                            setState(() {
                              this._country = val;
                            });
                          },
                          items: countries
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              child: Text(
                                value,
                                style: TextStyle(fontWeight: FontWeight.w400),
                              ),
                              value: value,
                            );
                          }).toList(),
                        ),
                      ),

                      //NumberPicker.integer(,maxValue: 100,minValue: 0,initialValue: 15,onChanged: (val){},),

                      /////////////////////////////////////next

                      InkWell(
                          onTap: () {
                            if (this._country != null) {
                              setState(() {
                                page = 2;
                              });
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 40),
                            child: Text(
                              'Next',
                              style: TextStyle(color: Colors.grey),
                            ),
                          )),
                    ],
                  ),
                )
              : page == 2
                  ? Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          FadeAnimation(
                            1,
                            ShapeOfView(
                              elevation: 4,
                              height: MediaQuery.of(context).size.width / 1.5,
                              shape: DiagonalShape(
                                  position: DiagonalPosition.Bottom,
                                  direction: DiagonalDirection.Right,
                                  angle: DiagonalAngle.deg(angle: 10)),
                              child: Container(
                                height: MediaQuery.of(context).size.width / 1.2,
                                width: MediaQuery.of(context).size.width,
                                color: Colors.red[300],
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Tell us more about the city",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w200,
                                      //fontStyle: FontStyle.italic
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),

///////////////////////////////////

//Text("How was The Weather:")
//,
                          Center(
                            child: Container(
                              height: 50,
                              margin: EdgeInsets.only(top: 20),
                              child: ToggleSwitch(
                                minWidth: 70.0,
                                initialLabelIndex: 0,
                                activeBgColor: Colors.red[400],
                                activeTextColor: Colors.white,
                                inactiveBgColor: Colors.indigo[100],
                                inactiveTextColor: Colors.grey[900],
                                labels: [
                                  'Winter',
                                  'Summer',
                                  'Spring',
                                  "Autumn",
                                ],
                                onToggle: (index) {
                                  index == 0
                                      ? this._experience.reccommendedWeather =
                                          "Winter"
                                      : index == 1
                                          ? this
                                              ._experience
                                              .reccommendedWeather = "Summer"
                                          : index == 2
                                              ? this
                                                      ._experience
                                                      .reccommendedWeather =
                                                  "Spring"
                                              : this
                                                      ._experience
                                                      .reccommendedWeather =
                                                  "Autumn";
                                },
                              ),
                            ),
                          ),

                          Container(
                            margin: EdgeInsets.only(top: 20),
                            width: MediaQuery.of(context).size.width / 1.1,
                            child: _SlectCity(this._country),
                          ),

                          Center(
                            child: Container(
                              height: 50,
                              margin: EdgeInsets.only(top: 20),
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: <Widget>[
                                  ToggleSwitch(
                                    minWidth: 70.0,
                                    initialLabelIndex: 0,
                                    activeBgColor: Colors.red[400],
                                    activeTextColor: Colors.white,
                                    inactiveBgColor: Colors.grey[300],
                                    inactiveTextColor: Colors.grey[900],
                                    labels: [
                                      'Coastal',
                                      'Honeymoon',
                                      'Historic',
                                      "Religious",
                                      "Ski",
                                      "Discovery"
                                    ],
                                    onToggle: (index) {
                                      index == 0
                                          ? this._experience.reccommendedType =
                                              "Coastal"
                                          : index == 1
                                              ? this
                                                      ._experience
                                                      .reccommendedType =
                                                  "Honeymoon"
                                              : index == 2
                                                  ? this
                                                          ._experience
                                                          .reccommendedType =
                                                      "Historic"
                                                  : index == 3
                                                      ? this
                                                              ._experience
                                                              .reccommendedType =
                                                          "Religous"
                                                      : index == 4
                                                          ? this
                                                                  ._experience
                                                                  .reccommendedType =
                                                              "Ski"
                                                          : this
                                                                  ._experience
                                                                  .reccommendedType =
                                                              "Discovery";
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),

///////////////////////////////////

                          InkWell(
                              onTap: () {
                                if (this._experience.cityId != null) {
                                  setState(() {
                                    page = 3;
                                  });
                                }
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(top: 50),
                                child: Text(
                                  'Next',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              )),
                        ],
                      ))
                  : page == 3
                      ? SafeArea(
                          child: Form(
                            key: _formKey,
                            child: Container(
                              height: 300,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  ReviewSlider(
                                    onChange: (int val) {
                                      if (val == 0) {
                                        state = "Terrible";
                                      } else if (val == 1) {
                                        state = "Bad";
                                      } else if (val == 2) {
                                        state = "Okay";
                                      } else if (val == 3) {
                                        state = "Good";
                                      } else if (val == 4) {
                                        state = "Great";
                                      }
                                    },
                                    options: [
                                      'Terrible',
                                      'Bad',
                                      'Okay',
                                      'Good',
                                      'Great'
                                    ],
                                    initialValue: 2,
                                  ),
                                  //Text("Add Exoerince",textAlign: TextAlign.left,style: TextStyle(color: Colors.white,fontSize: 20),),
                                  /////////////////////////
                                  /*   Container(
                            width: MediaQuery.of(context).size.width / 1.1,
                            child: _SlectCity(),
                          ),  */
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                    2 -
                                                30,
                                        child: DateTimeField(
                                          validator: (date) {},
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.all(5),
                                            filled: true,
                                            fillColor: Colors.white54,
                                            // focusColor: Colors.black,
                                            labelText: 'From',
                                            labelStyle: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                              fontSize: 18,
                                            ),
                                          ),
                                          format: DateFormat("yyyy-MM-dd"),
                                          onSaved: (val) {
                                            this._experience.From = val;
                                          },
                                          onChanged: (val) {
                                            setState(() {
                                              this._experience.From = val;
                                            });
                                          },
                                          onShowPicker:
                                              (context, currentValue) {
                                            return showDatePicker(
                                              context: context,
                                              firstDate: DateTime(1900),
                                              initialDate: currentValue ??
                                                      this._experience.To !=
                                                          null
                                                  ? this._experience.To
                                                  : DateTime.now(),
                                              lastDate:
                                                  this._experience.To != null
                                                      ? this._experience.To
                                                      : DateTime.now(),
                                            );
                                          },
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                    2 -
                                                30,
                                        child: DateTimeField(
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.all(5),
                                            filled: true,
                                            fillColor: Colors.white54,
                                            // focusColor: Colors.black,
                                            labelText: 'To',
                                            labelStyle: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                              fontSize: 18,
                                            ),
                                          ),
                                          format: DateFormat("yyyy-MM-dd"),
                                          onSaved: (val) {
                                            this._experience.To = val;
                                          },
                                          onChanged: (val) {
                                            setState(() {
                                              this._experience.To = val;
                                            });
                                          },
                                          onShowPicker:
                                              (context, currentValue) {
                                            return showDatePicker(
                                                context: context,
                                                firstDate: DateTime(1900),
                                                initialDate: currentValue ??
                                                    DateTime.now(),
                                                lastDate: DateTime.now());
                                          },
                                        ),
                                      ),
                                    ],
                                  ),

                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 1.1,
                                    height: 50,
                                    child: TextFormField(
                                      autofocus: false,
                                      keyboardType: TextInputType.number,
                                      onSaved: (String value) {
                                        this._experience.budget =
                                            int.parse(value);
                                      },
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(5),
                                        filled: true,
                                        suffixText: '\$',
                                        fillColor: Colors.white54,
                                        // focusColor: Colors.black,
                                        labelText: 'Budget',
                                        labelStyle: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: 18,
                                        ),
                                        hintText: 'Ex: 2500\$',
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 1.1,
                                    child: TextFormField(
                                      autofocus: false,
                                      keyboardType: TextInputType.multiline,
                                      maxLines: 5,
                                      onSaved: (val) {
                                        this._experience.description = val;
                                      },
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white54,
                                        // focusColor: Colors.black,
                                        labelText: 'Description',
                                        labelStyle: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ),

/////////////////////////////////////////

//////////////////////////////////////////////////

                                  Container(
                                    child: RaisedButton(
                                      color: Colors.indigo,
                                      child: Text(
                                        _isloading ? 'Hold on...' : 'Post',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      onPressed: _isloading
                                          ? null
                                          : () async {
                                              if (_formKey.currentState
                                                  .validate()) {
                                                _formKey.currentState.save();

                                                setState(() {
                                                  page = 5;
                                                  _isloading = true;
                                                });



///////////////////


                                                var citi = await Firestore
                                                    .instance
                                                    .collection('Experience')
                                                    .document()
                                                    .setData({
                                                  'userid':
                                                      Provider.of<FirebaseUser>(
                                                              context,
                                                              listen: false)
                                                          .uid
                                                          .toString(),
                                                  'cityid':
                                                      this._experience.cityId,
                                                  'startdate':
                                                      this._experience.From,
                                                  'enddate':
                                                      this._experience.To,
                                                  'budget':
                                                      this._experience.budget,
                                                  'description': this
                                                      ._experience
                                                      .description,
                                                  "timestamp": DateTime.now(),
                                                  'status': state,
                                                  'rate': 0.0,
                                                  'reccommendeWeather': this
                                                      ._experience
                                                      .reccommendedWeather,
                                                  'reccommendedType': this
                                                      ._experience
                                                      .reccommendedType
                                                });

                    var    min,mix,rate;

////////////////////
                                                Map _list,_list2;
                       await Firestore.instance
                                                    .collection("Cities")
                                                    .document(
                                                        this._experience.cityId)
                                                    .get()
                                                    .then((doc) {
                                                  _list = doc.data["weather"];
                                                  _list2=doc.data["type"];

min=doc["minBudget"];
mix=doc["maxBudget"];
rate=doc["rate"];

                                                });
                                                _list.forEach((key, value) {
                                                  if (key ==
                                                      _experience
                                                          .reccommendedWeather) {
                                                    _list[key] =
                                                        _list[key] + 1;
                                                  }
                                                });
                                       _list2.forEach((key, value) {
                                                  if (key ==
                                                      _experience
                                                        .reccommendedType) {
                                                    _list2[key] =
                                                        _list2[key] + 1;
                                                  }
                                                });

var max=0,max2=0;
var recT,recW;

_list.forEach((key, value) {

if(value>max)max=value; recW =key;

});

_list2.forEach((key, value) {

if(value>max2)max2=value; recT=key;

});

if(  this._experience.budget<min)min=  this._experience.budget;
if(  this._experience.budget>mix)mix=  this._experience.budget;

if(this._experience.status=="Good")rate=rate+0.1;

if(this._experience.status=="Great")rate=rate+0.2;
                                                Firestore.instance
                                                    .collection("Cities")
                                                    .document(
                                                        this._experience.cityId)
                                                    .updateData(
                                                        {"weather": _list
                                                        ,
                                                        "type":_list2 ,
                                                        "recommendedWeather":recW,
                                                        "recommendedType":recT,
                                                        "minBudget":min,
                                                        "rate":rate,
                                                        "maxBudget":mix
                                                        });

                                                setState(() {
                                                  _isloading = false;
                                                  //         _formKey.currentState.reset();
                                                  //  country = null;
                                                });


                      }
                                            },
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      : page == 5
                          ? Container(
                              color: Colors.white,
                              height: MediaQuery.of(context).size.height / 1.3,
                              child: ratePlacesEx(),
                            )
                          : Container(),
        ),
      ),
    );
  }

  Widget _SlectCity(country) {
    return FutureBuilder(
      //  stream: Firestore.instance.collection('Cities').snapshots(),
      future: Firestore.instance
          .collection("Cities")
          .where("country", isEqualTo: country)
          .getDocuments(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return Text("Loading...");
        }

        return DropdownButtonFormField<String>(
            //           icon: Icon(Icons.keyboard_arrow_down),
            //         iconEnabledColor: Colors.blue,

            hint: Text(
              "Select the city ...",
              /*     style: TextStyle(
                      color: Colors.black, /* fontWeight: FontWeight.w700 */),
                */
            ),
            decoration:
                InputDecoration(filled: true, fillColor: Colors.white54),
            //       disabledHint: Text("Enter City Name..."),
            //     isExpanded: true,
            //   isDense: true,
            value: this._experience.cityId,
            onChanged: (String newvale) {
              setState(() {
                this._experience.cityId = newvale;
              });
              print(newvale + "#############NEW VALUE");
            },
            items: snapshot.data.documents.map((DocumentSnapshot document) {
              return DropdownMenuItem<String>(
                value: document.documentID,
                child: Text(document.data['Name'].toString()),
              );
            }).toList());
      },
    );
  }
}

/*    Padding(
     padding: const EdgeInsets.fromLTRB(15,1,15,0),
     child: ListView(
            children:types.keys.map((String key) {
              return CheckboxListTile( 
                dense: true,
                isThreeLine: false,
              
                activeColor: Colors.blue,
               // checkColor: Colors.red,
            //    secondary: Icon(Icons.done_all),
             //   subtitle: Text("1"),
controlAffinity: ListTileControlAffinity.platform,
               selected:types[key], 
               
                title: Text(key,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500
                ,fontFamily: "Bitter",
         //       color: Colors.white60
                ),),
                value:types[key],
                onChanged: (bool value) {
                  setState(() {
                  types[key] = value;
                  });
                },
              );
            }).toList(),
          ),
   ), */

/* 
class feeling extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    Paint paint = Paint();
    paint.color = Colors.red[400];
    var path = Path();


   // path.lineTo(0, size.height*0.78);
    path.lineTo(size.width / 2, size.height*0.98);

    // path.relativeQuadraticBezierTo(15,3, 23, -5);
   // path.relativeQuadraticBezierTo(4,3,7,-2);

    path.lineTo(size.width, size.height*0.98);
    path.lineTo(size.width, 0);

    path.close(); 
 //   canvas.drawCircle(Offset.zero,60,paint);
  
  //canvas.drawOval(Rect.fromLTRB(30, 30, 30, 30), paint);
canvas.drawPath(path,paint);
  
  }

   bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }} */

class MyCircle extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.redAccent;
    canvas.drawArc(
        Rect.fromCenter(
          center: Offset(size.height / 3, size.width / 6),
          height: size.height,
          width: size.width,
        ),
        -3.14,
        -3.14,
        false,
        paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
