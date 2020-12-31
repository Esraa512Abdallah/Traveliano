import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:counter_animation/counter_animation.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import "dart:io";

import 'package:provider/provider.dart';
import 'package:traveliano/HOMEPAGE/EshomePage_rate.dart' as hm;
import 'package:traveliano/abdalahSwap/Hotels.dart';
import 'package:traveliano/abdalahSwap/Restourants.dart';
import 'package:traveliano/abdalahSwap/Swap.dart';
import 'package:traveliano/adminScreens/restuarant/allRestaurant.dart';
import 'package:traveliano/adminScreens/tourismplace/allTourismPlaces.dart';
import 'package:traveliano/models/user.dart';
//import 'package:traveliano/home.dart';
import 'package:traveliano/services/user.dart';
import 'package:traveliano/userScreens/myExperince.dart';

import '../globals.dart';
import '../home.dart';

class userProfile extends StatefulWidget {



  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return userProfileState();
  }
}

class userProfileState extends State<userProfile> {
  int x = 0;

  final formkey1 = GlobalKey<FormState>();
  final formkey2 = GlobalKey<FormState>();

  User _user = new User();
  var _currentPassword, _newPassword, _confirmNewPassword;

  int position = 0;
  File _image;

  bool _isVisible = true;

  Future getImage(bool isCamera) async {
    File image;

    image = await (ImagePicker.pickImage(source: ImageSource.gallery));

    setState(() {
      _image = image;
    });

    uploadFile();
  }



final FirebaseStorage _storage =FirebaseStorage(storageBucket: 'gs://traveliano-eefe4.appspot.com');
StorageUploadTask _uploadTask;
Future uploadFile() async {   
   String filePath = 'usersImages/${Provider.of<FirebaseUser>(context,listen: false).email}.png'; 
   StorageReference storageReference = FirebaseStorage.instance    
       .ref()    
       .child('${filePath}');    
   StorageUploadTask uploadTask = storageReference.putFile(_image);    
   await uploadTask.onComplete;    
   print('File Uploaded');    
   storageReference.getDownloadURL().then((fileURL) {    
    Firestore.instance.collection("Users")
    .document(Provider.of<FirebaseUser>(context,listen: false).uid).updateData({

'photo':fileURL

    });  
   });    
 } 










int trips=0,followers=0,following=0;




Future getNum()

async{
var id=Provider.of<FirebaseUser>(context,listen: false).uid;

 await Firestore.instance

.collection("Experience")
.where("userid",isEqualTo: id)
.getDocuments().then((docs){

trips= docs.documents.length;

});



 await Firestore.instance

.collection("Users").document(id)
.collection("Following").getDocuments().then((docs){
following= docs.documents.length;

});

 await Firestore.instance

.collection("Users").document(id)
.collection("Followers").getDocuments().then((docs){
followers= docs.documents.length;

});







}



@override
  void initState() {
    // TODO: implement initState
     
       getNum(); 
  }

  @override
  Widget build(BuildContext context) {




    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
              child: FutureBuilder(
            future: user_services().getConnectedUser(context),
            builder: (BuildContext context, AsyncSnapshot snap) {
              if (!snap.hasData) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top:100),
                    child: SpinKitRipple(color: Colors.blue, size: 200),
                  ),
                );
              }

              _user.Photo = snap.data["photo"];
              _user.lastName = snap.data["lastName"];
              _user.firstName = snap.data["firstName"];
              _user.hometown = snap.data["hometown"];

              DateTime birthday;

              Timestamp ts = snap.data["birthday"];
              birthday = ts.toDate();

              return Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height-50,
                //var usersMap = snapshot2.data.documents.asMap();

                //painter:LogoPainter( ),
//height: 300,
                child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    GestureDetector(

onTap: (){




  
},

                                          child: AnimatedContainer(
                        color: Colors.red[400],
                        duration: Duration(seconds: 1),
                        height: MediaQuery.of(context).size.width / 2,
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(top: 35.0, left: 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Container(
                                    child: Stack(
                                      children: <Widget>[
                                        Container(
                                          child: CircleAvatar(
                                            radius: 40,
                                            backgroundColor: Color(0xff476cfb),
                                            child: ClipOval(
                                              child: new SizedBox(
                                                width: 80.0,
                                                height: 80.0,
                                                child: (_image != null)
                                                    ? Image.file(
                                                        _image,
                                                        fit: BoxFit.cover,
                                                      )
                                                    :_user.Photo==null? 
                                                    Image.asset("images/defaultuser.png",
                                                    fit:BoxFit.fitHeight
                                                    )
                                                    :Image.network(
                                                        _user.Photo,
                                                        fit: BoxFit.cover,
                                                      ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        (x == 1)
                                            ? Container(
                                                width: 80,
                                                padding: EdgeInsets.only(
                                                    left: 50, top: 40),
                                                child: IconButton(
                                                    icon: Icon(
                                                      Icons.add_a_photo,
                                                      size: 30,
                                                      color: Colors.white,
                                                    ),
                                                    onPressed: () {
                                                      getImage(false);



                                                    }),
                                              )
                                            : Container(),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                          padding: EdgeInsets.only(left: 9),
                                          child: Row(
                                            //mainAxisAlignment: MainAxisAlignment.center,
                                            children: <Widget>[
                                              Text(_user.firstName,
                                                  style: TextStyle(
                                                      color: Colors
                                                          .white, //  ,fontWeight: FontWeight.w900,
                                                      fontFamily: "Bitter",
                                                      fontSize: 15)),
                                              Text(' ',
                                                  style: TextStyle(
                                                      color: Colors.white)),
                                              Text(_user.lastName,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: "Bitter",
                                                    fontSize: 15,
                                                  )),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(right: 30),
                                          child: Row(
                                            // mainAxisAlignment: MainAxisAlignment.start,
                                            children: <Widget>[
                                              Icon(
                                                Icons.location_on,
                                                color: Colors.white54,
                                              ),
                                              Text(_user.hometown,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w100)),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    //    alignment: Alignment.topRight,
                                    child: x > 0
                                        ? InkWell(
                                            child: Text(
                                              "✖️",
                                              style:
                                                  TextStyle(color: Colors.white),
                                            ),
                                            onTap: () {
                                              setState(() {
                                                x = 0;
                                              });
                                            },
                                          )
                                        : PopupMenuButton<String>(
                                            icon: Icon(
                                              FontAwesomeIcons.edit,
                                              size: 25,
                                              color: Colors.white70,
                                            ),
                                            itemBuilder: (context) => [
                                              PopupMenuItem(
//height: 300,

                                                child: Column(children: <Widget>[
                                                  InkWell(
                                                    child: Row(
                                                      children: <Widget>[
                                                        Text(
                                                          'Basic Info',
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .blueGrey),
                                                        ),
                                                      ],
                                                    ),
                                                    onTap: () {
                                                      setState(() {
                                                        x = 1;
                                                        Navigator.pop(context);
                                                      });
                                                      print('done');
                                                      print(x);
                                                    },
                                                  ),
                                                ]),
                                              ),
/////////////////////////////////////////////////////////////////////////////////////////////////////////
     /*                                          PopupMenuItem(
                                                  child: Column(
                                                children: <Widget>[
                                                  InkWell(
                                                    child: Row(
                                                      children: <Widget>[
                                                        Text(
                                                          'Security',
                                                          style: TextStyle(
                                                            color:
                                                                Colors.blueGrey,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    onTap: () {
                                                      setState(() {
                                                        x = 2;
                                                        Navigator.pop(context);
                                                      });
                                                      print('done2');
                                                      print(x);
                                                    },
                                                  ),
                                                ],
                                              )),
              */                                 /* PopupMenuItem(
                                                  child: Column(
                                                children: <Widget>[
                                                  InkWell(
                                                    child: Row(
                                                      children: <Widget>[
                                                        Text(
                                                          'Block',
                                                          style: TextStyle(
                                                            color:
                                                                Colors.blueGrey,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    onTap: () {},
                                                  ),
                                                ],
                                              )), */
                                        /*       PopupMenuItem(
                                                child: Column(
                                                  children: <Widget>[
                                                    InkWell(
                                                      child: Row(
                                                        children: <Widget>[
                                                          Icon(
                                                            Icons.https,
                                                            size: 25,
                                                            color:
                                                                Colors.blueGrey,
                                                          ),
                                                          Text(
                                                            'Lock',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.blueGrey,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      onTap: () {},
                                                    ),
                                                  ],
                                                ),
                                              ), */
/////////////////////////////////////////////////////////////////////////////////////////////////////////
                                            ],
                                          ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 5, left: 70),
                              child: Container(
                                margin: EdgeInsets.only(top: 5),
                                //  turns: new AlwaysStoppedAnimation(0/ 360),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Container(
                                      // padding: EdgeInsets.only(left:10),
                                      child: Column(
                                        children: <Widget>[
                                          CounterAnimation(
                                              begin: 0,
                                              end: this.following,
                                              duration: 5,
                                              curve: Curves.easeIn,
                                              textStyle: TextStyle(
                                                  color: Colors.purple[100],
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w200)),
                                          //   Text('123',style: TextStyle(color: Colors.purple[100],fontSize: 20,fontWeight: FontWeight.w200),),
                                          Text(
                                            'Following',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      // padding: EdgeInsets.only(left:10),
                                      child: Column(
                                        children: <Widget>[
                                          CounterAnimation(
                                              begin: 0,
                                              end: this.trips,
                                              duration: 4,
                                              curve: Curves.easeIn,
                                              textStyle: TextStyle(
                                                  color: Colors.purple[100],
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w200)),
                                          Text(
                                            'Trips',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      //  padding: EdgeInsets.only(left:10),
                                      child: Column(
                                        children: <Widget>[
                                          CounterAnimation(
                                              begin: 0,
                                              end: this.followers,
                                              duration: 5,
                                              curve: Curves.easeIn,
                                              textStyle: TextStyle(
                                                  color: Colors.purple[100],
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w200)),
                                          Text(
                                            'Followers',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ],
                                      ),
                                    ),
                              
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    (x == 1)
                        ? Container(
                            color: Colors.white,
                            height: MediaQuery.of(context).size.height / 1.8,
                            child: Form(
                              key: formkey1,
                              child: ListView(
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: 35,
                                      right: 35,
                                      top: 20,
                                    ),
                                    child: TextFormField(
                                      initialValue: _user.firstName,
                                      cursorWidth: 1.2,
                                      obscureText: false,
                                      autocorrect: true,
                                      onSaved: (val) {
                                        _user.firstName = val;
                                      },
                                      // controller:userObject.firstName,
                                      textAlign: TextAlign.left,
                                      //     textDirection: TextDirection.ltr,
                                      autofocus: false,
                                      cursorColor: Colors.black,
                                      keyboardType: TextInputType.text,

                                      style: TextStyle(
                                        color: Colors.black,
                                        letterSpacing: .5,
                                        wordSpacing: 1.5,
                                        decorationStyle:
                                            TextDecorationStyle.solid,
                                        decorationColor: Colors.red,
                                      ),

                                      decoration: InputDecoration(
                                        hintText: "Enter your first Name",
                                        contentPadding: EdgeInsets.all(10),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: 35,
                                      right: 35,
                                      top: 10,
                                    ),
                                    child: TextFormField(
                                      cursorWidth: 1.2,
                                      obscureText: false,
                                      autocorrect: true,
                                      onSaved: (val) {
                                        _user.lastName = val;
                                      },
                                      initialValue: _user.lastName,
                                      // controller: userObject.lastName,
                                      textAlign: TextAlign.left,
                                      //      textDirection: TextDirection.ltr,
                                      autofocus: false,
                                      cursorColor: Colors.black,
                                      keyboardType: TextInputType.text,

                                      style: TextStyle(
                                        color: Colors.black,
                                        letterSpacing: .5,
                                        wordSpacing: 1.5,
                                        decorationStyle:
                                            TextDecorationStyle.solid,
                                        decorationColor: Colors.red,
                                      ),

                                      decoration: InputDecoration(
                                        hintText: "Enter your last name",
                                        contentPadding: EdgeInsets.all(10),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: 35,
                                      right: 35,
                                      top: 10,
                                    ),
                                    child: DropdownButtonFormField(
                                      //isDense: true,isExpanded: true,
                                      decoration: InputDecoration(

                                          //  icon: Icon(Icons.keyboard_arrow_down),
                                          //     iconEnabledColor: Colors.blue,
                                          ),

                                      value: _user.hometown,
                                      onChanged: (val) {
                                      
                                        _user.hometown = val;
                                      },
                                      hint: Text("Country ..."),
                                      // disabledHint: Text("Travel with ...."),
                                      /*  validator: (val){
        
        if(val==null)return "Country is Required !!!";
        
        }, */
                                      onSaved: (val) {
                                        _user.hometown = val;
                                        //   new_city.Country=val;
                                      },

                                      items: countries
                                          .map<DropdownMenuItem<String>>(
                                              (String value) {
                                        return DropdownMenuItem<String>(
                                          child: Text(value),
                                          value: value,
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: 35,
                                      right: 35,
                                      top: 0,
                                    ),
                                    child: DateTimeField(
                                      initialValue:
                                          snap.data["birthday"].toDate(),
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(5),
                                        filled: true,
                                        fillColor: Colors.white54,
                                        // focusColor: Colors.black,
                                        labelText: 'Birthday',
                                      ),
                                      format: DateFormat("yyyy-MM-dd"),
                                      onSaved: (val) {
                                        _user.birthday = val;
                                      },
                                      onChanged: (val) {
                                      
                                      },
                                      onShowPicker: (context, currentValue) {
                                        return showDatePicker(
                                            context: context,
                                            firstDate: DateTime(1900),
                                            initialDate: currentValue,
                                            lastDate: DateTime.now());
                                      },
                                    ),
                                  ),
                                  Container(
                                    height: 80,
                                    width: 150,
                                    padding: EdgeInsets.only(
                                        top: 20, left: 5, right: 5, bottom: 10),
                                    child: RaisedButton(
                                      child: Text(
                                        "Save Changes",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black,
                                            fontSize: 14.0),
                                      ),
                                      onPressed: () async {
                                        if (formkey1.currentState.validate()) {
                                          formkey1.currentState.save();
                                          bottomSheet(
                                              context,
                                              Center(
                                                  child: SpinKitRipple(
                                                color: Colors.blue,
                                                size: 150,
                                              )));
                                          await Firestore.instance
                                              .collection('Users')
                                              .document(Provider.of<FirebaseUser>(
                                                      context,listen: false)
                                                  .uid)
                                              .updateData({
                                            'firstName': _user.firstName,
                                            'lastName': _user.lastName,
                                            'hometown': _user.hometown,
                                            'birthday': _user.birthday,
                                          }).then((data) {
                                            setState(() {
                                              x = 0;
                                            });
                                            Navigator.pop(context);
                                            setState(() {
                                              print('edit');
                                            });
                                            // Navigator.of(context).pop();
                                          });
                                        }
                                      },
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20.0),
                                        //      side: BorderSide(color: Colors.red,width: 1)
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : (x == 2)
                            ? Container(
                                color: Colors.white,
                                height: MediaQuery.of(context).size.height / 1.8,
                                child: Form(
                                  key: formkey2,
                                  child: ListView(
                                    children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.only(
                                          left: 35,
                                          right: 35,
                                          top: 10,
                                        ),
                                        child: TextFormField(
                                          cursorWidth: 1.2,
                                          obscureText: true,
                                          autocorrect: true,

                                          // controller:userObject.firstName,
                                          textAlign: TextAlign.left,
                                          //    textDirection: TextDirection.ltr,
                                          autofocus: false,
                                          cursorColor: Colors.black,
                                          keyboardType: TextInputType.text,

                                          style: TextStyle(
                                            color: Colors.black,
                                            letterSpacing: .5,
                                            wordSpacing: 1.5,
                                            decorationStyle:
                                                TextDecorationStyle.solid,
                                            decorationColor: Colors.red,
                                          ),

                                          decoration: InputDecoration(
                                            hintText: 'Current password ',
                                            contentPadding: EdgeInsets.all(20),
                                          ),
                                          validator: (val) {},

                                          onSaved: (val) {
                                            _currentPassword = val;
                                          },
                                          onChanged: (val) async {
                                      /*       await FirebaseAuth.instance
                                                .currentUser()
                                                .then((user) async {
                                              await user.updateEmail(
                                                  "khaledkiko2222@gmail.com");
                                            }); */
                                          },
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                          left: 35,
                                          right: 35,
                                          top: 10,
                                        ),
                                        child: TextFormField(
                                          cursorWidth: 1.2,
                                          obscureText: true,
                                          autocorrect: true,

                                          textAlign: TextAlign.left,
                                          //        textDirection: TextDirection.ltr,
                                          autofocus: false,
                                          cursorColor: Colors.black,
                                          keyboardType: TextInputType.text,

                                          style: TextStyle(
                                            color: Colors.black,
                                            letterSpacing: .5,
                                            wordSpacing: 1.5,
                                            decorationStyle:
                                                TextDecorationStyle.solid,
                                            decorationColor: Colors.red,
                                          ),

                                          decoration: InputDecoration(
                                            hintText: 'New password ',
                                            contentPadding: EdgeInsets.all(20),
                                          ),
                                          onSaved: (val) {
                                            _newPassword = val;
                                          },
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                          left: 35,
                                          right: 35,
                                          top: 10,
                                        ),
                                        child: TextFormField(
                                          cursorWidth: 1.2,
                                          obscureText: true,
                                          autocorrect: true,

                                          onSaved: (val) {
                                            _confirmNewPassword = val;
                                          },

                                          textAlign: TextAlign.left,
                                          //        textDirection: TextDirection.ltr,
                                          autofocus: false,
                                          cursorColor: Colors.black,
                                          keyboardType: TextInputType.text,

                                          style: TextStyle(
                                            color: Colors.black,
                                            letterSpacing: .5,
                                            wordSpacing: 1.5,
                                            decorationStyle:
                                                TextDecorationStyle.solid,
                                            decorationColor: Colors.red,
                                          ),

                                          decoration: InputDecoration(
                                            hintText: 'Confirm password ',
                                            contentPadding: EdgeInsets.all(20),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 80,
                                        width: 150,
                                        padding: EdgeInsets.only(
                                            top: 20,
                                            left: 10,
                                            right: 10,
                                            bottom: 10),
                                        child: RaisedButton(
                                          child: Text(
                                            "Edit",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                color: Colors.white,
                                                fontSize: 18.0),
                                          ),
                                          onPressed: () async {},
                                          color: Colors.deepPurple,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(21.0),
                                              side: BorderSide(
                                                  color: Colors.deepPurple,
                                                  width: 1.2)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            : Container(
                              height: MediaQuery.of(context).size.height / 1.7,
                           color: Colors.red,
                                //      child:hm.homePage(),
                              margin: EdgeInsets.all(0),
                              padding: EdgeInsets.all(0),
                              child: myExperince()
                                ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}

class LogoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.color = Colors.red[400];

    //paint.blendMode=BlendMode.luminosity;
    var path = Path();

    path.lineTo(0, size.height * 0.78);
    path.lineTo(size.width / 1.25, size.height * 0.98);

    // path.relativeQuadraticBezierTo(15,3, 23, -5);
    path.relativeQuadraticBezierTo(10, 2, 22, -4);

    path.lineTo(size.width, size.height * 0.78);
    path.lineTo(size.width, 0);

    path.close();
    canvas.drawPath(path, paint);
  }

  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
