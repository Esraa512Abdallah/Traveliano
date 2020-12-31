/* import 'dart:core' as prefix0;
import 'dart:core';

import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:traveliano/load.dart';
import 'package:traveliano/login.dart';
import 'package:image_picker/image_picker.dart';
import "dart:io";
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:traveliano/services/user.dart' as _user;
import 'package:traveliano/models/user.dart';
class register extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return registerState();
  }


}

class registerState extends State<register>{

User user=User();



String confirmpass;

bool isload=false;

 final GlobalKey<FormState> formState = GlobalKey<FormState>();


  /////////////////////Image Function//////////////////////////////////
   File _image ;
   
  final FirebaseStorage _storage =
      FirebaseStorage(storageBucket: 'gs://traveliano-eefe4.appspot.com');

  StorageUploadTask _uploadTask;

  Future getImage(bool isCamera) async {
    File image ;

    if(isCamera)
    {
      image = await( ImagePicker.pickImage(source:ImageSource.camera ));
    }
    else
    {
      image = await( ImagePicker.pickImage(source:ImageSource.gallery));
    }
   setState(() {
     _image = image ;
   });

 
  
  }

  Future _startUpload() async {

    /// Unique file name for the file
    String filePath = 'usersImages/${this.user.Id}.png';

      _uploadTask = await _storage.ref().child(filePath).putFile(this._image);

StorageTaskSnapshot storageTaskSnapshot = await _uploadTask.onComplete;
this.user.Photo = await storageTaskSnapshot.ref.getDownloadURL().toString();
 } 


  @override
  Widget build(BuildContext context) {
    // TODO: implement build





//////////////Landscape//////
   var x,z,y;
    if(MediaQuery.of(context).size.height>MediaQuery.of(context).size.width){
setState(() {
 x=7.29; 
 z=2.5;
 y=4;
});



    }else setState(() {
     x=20; 
     z=3.5;
     y=2.1;
    }); 
    
/////////////







    return Scaffold(



      body:isload?load("Signing up ....please wait"):
    
      Column(

        children: <Widget>[

          Container( //height: 330,
            child: Stack(
              children: <Widget>[
              //  Image.asset("images/back.png"),
 // Image.asset("images/back2.png",fit: BoxFit.fitWidth,),
//SvgPicture.asset("images/travelgirl.svg",height: 150,),
  
 
  
                     Container(
                   //    alignment: Alignment.bottomCenter,
                       child: Row(
                 //        mainAxisAlignment: MainAxisAlignment.spaceAround,
                         children: <Widget>[
                       /*     Column(
                        
                             children: <Widget>[
             FlatButton.icon(
                           label: Text(""),
              icon:Icon(Icons.image ,size: 40,color: Colors.white,),
              onPressed: (){
                             getImage(false);
              }
                                ),
                           
                           
                           
            FlatButton.icon(
              label: Text(""),
                              icon:Icon(Icons.camera_alt,size: 40,color: Colors.white,),
                              onPressed: (){
                                getImage(true);
                              },
                            ),
                           
                             ],
                           ), */
                           Padding(
                         padding: const EdgeInsets.only(bottom: 0),
                         child: Align(
                   //       alignment: Alignment.bottomLeft,
                          child: Container
                          (
    
width: MediaQuery.of(context).size.width/z,
height: MediaQuery.of(context).size.height/y,
    decoration: BoxDecoration(
border: Border.all(width: 1.0,color: Colors.white),
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(150.0),
    ),
    child: Padding(
      padding: const EdgeInsets.all(3.0),
     child:
      ClipRRect(
    borderRadius: new BorderRadius.circular(MediaQuery.of(context).size.height),
    child: _image != null?  
    
     Image.file( _image  ,fit: BoxFit.cover,
     height: MediaQuery.of(context).size.height/4.2,
     width:MediaQuery.of(context).size.width/2.5,):
      Icon(Icons.person,size: 100,color:Colors.white,)


)
    ),

                          ),
              ),
                       ),   ],
                       ),
                     ),




                
              
              ],
            ),
          )
,
          Container(    // second 2 container


          //  margin: EdgeInsets.only(top:MediaQuery.of(context).size.height/x),
            height:MediaQuery.of(context).size.height,
            width:MediaQuery.of(context).size.width ,


            decoration: BoxDecoration( color: Colors.white,
    //        borderRadius:BorderRadius.only(topLeft: Radius.circular(86.0))

            ),

            child: Padding(
          padding: const EdgeInsets.only(top:40),
          child: ListView(
            
            children: <Widget>[







             //     _image == null? Container() :

            
        






Text("khaled................"),




Form(
  key: formState,
  child:   Container(
    child: Column(children: <Widget>[ 
    
    
    
    
    
           ///////FIRST_NAME/////////
    
               Container(  // second 2 container part 1 FIRST_NAME
    
          
    
            margin: EdgeInsets.only(left: 25,right: 20,top: 10,bottom: 0),
    
    
    
    
    
            child:   TextFormField (
  
              validator: (val){
    
                
    
              if(val==null)return "first name is required !!!";
    
    
    
              },
    
              
    
              onSaved: (val){
    
               
    
              this.user.firstName = val;
    
                 
    
                
    
                 
    
            },
    
                
    
              cursorWidth: 1.2,
    
              obscureText: false,
    
             //     autocorrect: true,
    
                 //         controller: null,
    
              textAlign: TextAlign.left,
    
           //         textDirection: TextDirection.ltr,
    
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
                 labelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 20,
                ),
  // prefixIcon: Icon(Icons.text_format),
                  errorBorder: UnderlineInputBorder(
    
    
    
             //   borderRadius: BorderRadius.all(Radius.circular(30)),
     borderSide: BorderSide(color: Colors.red,width: 3.0,),
    
    
    
    
    
    
    
              ),
    
    focusedErrorBorder:UnderlineInputBorder(
    
    
    
             //         borderRadius: BorderRadius.all(Radius.circular(30)),
     borderSide: BorderSide(color: Colors.red,width: 3.0,),
    
    
    
    
    
    
    
              ),
    
    errorStyle: TextStyle(color: Colors.red,fontWeight: FontWeight.w500),
    
                labelText: 'First Name',
    
                
    
                hintText: "Enter Your First Name.....",
    
              //        filled:true,
    
    
    
               //       contentPadding: EdgeInsets.all(20),
    
    
    
                enabledBorder: UnderlineInputBorder(
    
    
    
                  borderSide: BorderSide(color: Colors.black,width: 1.0,),
    
    
    
             //     borderRadius: BorderRadius.circular(30.0),
    
    
    
           //       gapPadding:40.0,
    
    
    
                ),
    
    
    
                focusedBorder: UnderlineInputBorder(
    
    
    
                  borderSide: BorderSide(color: Colors.deepPurple,width: 3.0,),
    
    
    
              //    borderRadius: BorderRadius.circular(30.0),
    
    
    
    
    
                ),
    
    
    
              ),
    
    
    
            ),
    
          ),
    
    
    
 










    
    
          ///////////////LAST_NAME////////////
    
          Container(  // second 2 container part 1 email
    
            margin: EdgeInsets.only(left: 25,right: 20,top: 0,bottom: 0),
    
    
    
            // margin: EdgeInsets.all(18),
    
            child:   TextFormField (
    
    
    
          validator: (val){
    
           if(val==null)return "last name is required !!!";

    
    
            },
    
              onSaved: (val){
    
              this.user.lastName=val;
    
              },
    
    
    
              cursorWidth: 1.02,
    
              obscureText: false,
    
              autocorrect: true,
    
            //  controller: null,
    
              textAlign: TextAlign.left,
    
            //        textDirection: TextDirection.ltr,
    
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
     labelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 20,
                ),
    focusedErrorBorder:UnderlineInputBorder(
    
    
    
             //   borderRadius: BorderRadius.all(Radius.circular(30)),
    
    
    
     borderSide: BorderSide(color: Colors.red,width: 3.0,),
    
    
    
    
              ),
    
    errorStyle: TextStyle(color: Colors.red,fontWeight: FontWeight.w500),
    
      errorBorder: UnderlineInputBorder(
    
    
    
           //    borderRadius: BorderRadius.all(Radius.circular(30)),
    
    
     borderSide: BorderSide(color: Colors.red,width: 3.0,),
    
    
    
    
    
              ),
    
    
    
    
    
                labelText: 'Last Name',
    
                hintText: "Enter Your Last Name.....",
    
            //    filled:true,
    
    
    
                //contentPadding: EdgeInsets.all(20),
    
    
    
                enabledBorder: UnderlineInputBorder(
    
    
    
                  borderSide: BorderSide(color: Colors.black,width: 1.0,),
    
    
    
             //     borderRadius: BorderRadius.circular(30.0),
    
    
    
              //    gapPadding:40.0,
    
    
    
                ),
    
    
    
                focusedBorder: UnderlineInputBorder(
    
    
    
                  borderSide: BorderSide(color: Colors.deepPurple,width: 3.0,),
    
    
    
            //      borderRadius: BorderRadius.circular(30.0),
    
    
    
    
    
                ),
    
    
    
              ),
    
    
    
            ),
    
          ),
    
    
    
    
    
            ////////////EMAIL/////////////
    
          Container(  // second 2 container part 1 email
    
            margin: EdgeInsets.only(left: 25,right: 20,top: 0,bottom: 0),
    
    
    
            // margin: EdgeInsets.all(18),
    
            child:   TextFormField (
    
                    validator: (val){
    
           if(val==null)return "Email is required !!!";

    
    },
    
              onSaved: (val){
    
               this.user.email=val;
    
              },
    
              
    
              
    
              
    
              cursorWidth: 1.2,
    
              obscureText: false,
    
              autocorrect: true,
    
              controller: null,
    
              textAlign: TextAlign.left,
    
           //   textDirection: TextDirection.ltr,
    
              autofocus: false,
    
              cursorColor: Colors.black,
    
              keyboardType: TextInputType.emailAddress,
    
    
    
    
    
              style: TextStyle(
    
                color: Colors.black,
    
                letterSpacing: .5,
    
                wordSpacing: 1.5,
    
                decorationStyle: TextDecorationStyle.solid,
    
                decorationColor: Colors.red,
    
              ),
    
    
    
    
    
              decoration: InputDecoration(
    
     labelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 20,
                ),
    
      errorBorder: UnderlineInputBorder(
    
    
    
               //       borderRadius: BorderRadius.all(Radius.circular(30)),
     borderSide: BorderSide(color: Colors.red,width: 3.0,),
    
    
    
    
    
    
    
              ),focusedErrorBorder:UnderlineInputBorder(
    
    
    
           //     borderRadius: BorderRadius.all(Radius.circular(30)),
     borderSide: BorderSide(color: Colors.red,width: 3.0,),
    
    
    
    
    
    
    
              ),
    
    errorStyle: TextStyle(color: Colors.red,fontWeight: FontWeight.w500),
    
    
    
    
    
                labelText: 'Email',
    
                hintText: "Enter Your Email.....",
    
             //   filled:true,
    
    
    
             //   contentPadding: EdgeInsets.all(20),
    
    
    
                enabledBorder: UnderlineInputBorder(
    
    
    
                  borderSide: BorderSide(color: Colors.black,width: 1.0,),
    
    
    
              //    borderRadius: BorderRadius.circular(30.0),
    
    
    
          //        gapPadding:40.0,
    
    
    
                ),
    
    
    
                focusedBorder: UnderlineInputBorder(
    
    
    
                  borderSide: BorderSide(color: Colors.deepPurple,width: 3.0,),
    
    
    
              //    borderRadius: BorderRadius.circular(30.0),
    
    
    
    
    
                ),
    
    
    
              ),
    
    
    
            ),
    
          ),
    
    
    
          ///////////////////PASS WORD/////////////////
    
    
    
          Container( // second 2 container part 2 pass
    
            margin: EdgeInsets.only(left: 28,right: 20,top: 0,bottom: 0),
    
            child:   TextFormField (
    
    
    
          validator: (val){if(val.length==0)return"password is required !!!";else if(val.length<4){
    
          
    
          return "password can't be lower than 4 digets !!!";}
    
          
    
           return null;
    
          
    
          },
    
           
    
    onSaved: (val){this.user.password=val;},
    
              cursorWidth: 1.2,
    
    
    
              obscureText: true,
    
    
    
              autocorrect: true,
    
    
    
              controller: null,
    
    
    
              textAlign: TextAlign.left,
    
    
    
          //          textDirection: TextDirection.ltr,
    
    
    
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
          labelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 20,
                ),
                labelText: 'Password',
    
                hintText: "Enter Your Password.....",
    
          //      filled:true,
    
    
    
             //   contentPadding: EdgeInsets.all(20),
    
    errorBorder: UnderlineInputBorder(
    
    
    
              //  borderRadius: BorderRadius.all(Radius.circular(30)),
    
    
       borderSide: BorderSide(color: Colors.red,width: 3.0,),
    
    
    
    
    
              ),
    
                enabledBorder: UnderlineInputBorder(
    
    
    
                  borderSide: BorderSide(color: Colors.black,width: 1.0,),
    
    
    
             //     borderRadius: BorderRadius.circular(30.0),
    
    
    
              //    gapPadding:40.0,
    
    
    
                ),
    
    errorStyle: TextStyle(color: Colors.red,fontWeight: FontWeight.w500),
    
    
    
                focusedBorder: UnderlineInputBorder(
    
    
    
                  borderSide: BorderSide(color: Colors.deepPurple,width: 3.0,),
    
    
    
            //      borderRadius: BorderRadius.circular(30.0),
    
    
    
                ),
    
    
    
              ),
    
    
    
            ),
    
    
    
          ),
    
    
    
    
    
    
    
    /////////////////////////////re enter your pass
    
    ///   
    
       Container( // second 2 container part 2 pass
    
            margin: EdgeInsets.only(left: 28,right: 20,top: 0,bottom: 0),
    
            child:   TextFormField (
    
    
    
          validator: (val){
    
        
    
            if(val==null)return" Confirmation password is required !!!";
    
            if (this.user.password!=confirmpass)return"passwords don't match !!!";
    
            
    
            },
    
            
    
              onSaved: (val){setState(() {
    
            
            confirmpass=val;
    
              });},
    
    
    
              cursorWidth: 1.2,
    
    
    
              obscureText: true,
    
    
    
              autocorrect: true,
    
    
    
              controller: null,
    
    
    
              textAlign: TextAlign.left,
    
    
    
             //       textDirection: TextDirection.ltr,
    
    
    
              autofocus: false,
    
    
    
              cursorColor: Colors.black,
    
    
    
              keyboardType: TextInputType.text,
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
              decoration: InputDecoration(
      labelStyle: TextStyle(
               fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 20,
                ),
                labelText: 'Confirm-Password',
    
                hintText: "Enter Your Password.....",
    
              //        filled:true,
    
    
    
              //  contentPadding: EdgeInsets.all(20),
    
    
    
                enabledBorder: UnderlineInputBorder(
    
    
    
                  borderSide: BorderSide(color: Colors.black,width: 1.0,),
    
    
    
               //   borderRadius: BorderRadius.circular(30.0),
    
    
    
                //  gapPadding:40.0,
    
    
    
                ), errorBorder: UnderlineInputBorder(
    
    
    
              //  borderRadius: BorderRadius.all(Radius.circular(30)),
    
    
        borderSide: BorderSide(color: Colors.red,width: 3.0,),
    
    
    
    
    
              ),
    
    focusedErrorBorder:UnderlineInputBorder(
    
    
    
                borderRadius: BorderRadius.all(Radius.circular(30)),
    
    
    
    
    
    
    
              ),
    
    errorStyle: TextStyle(color: Colors.red,fontWeight: FontWeight.w500),
    
                focusedBorder: UnderlineInputBorder(
    
    
    
                  borderSide: BorderSide(color: Colors.deepPurple,width: 3.0,),
    
    
    
          //        borderRadius: BorderRadius.circular(30.0),
    
    
    
                ),
    
    
    
              ),
    
    
    
            ),
    
    
    
          ),
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
          ////////////////////bith///////////////////////////
    
          Container(
    
            margin: EdgeInsets.only(left: 28,right: 20,top: 0,bottom: 0),
    
    
    
            // margin: EdgeInsets.all(18),
    
            child:   DateTimeField(
              decoration: InputDecoration(
          //      filled: true,
           //     fillColor: Colors.white54,
                // focusColor: Colors.black,
                labelText: 'Birthday',
                labelStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
              format: DateFormat("yyyy-MM-dd"),
              onSaved: (value) {
                this.user.birthday = value;
              
              },validator: (val){if(val==null)return "Birthday is required !!!";},
              onShowPicker: (context, currentValue) {
                return showDatePicker(
                    context: context,
                    firstDate: DateTime(1900),
                    initialDate: currentValue ?? DateTime.now(),
                    lastDate: DateTime.now());
              },
            ),
          ),
    
    
    
    
    
    
    
          /////////////////HOMETOWN////////////////
    
          Container(  // second 2 container part 1 email
    
            margin: EdgeInsets.only(left: 28,right: 20,top: 0,bottom: 0),
    
    
    
            // margin: EdgeInsets.all(18),
    
            child:   TextFormField (
    


onSaved: (val){

this.user.hometown=val;


},


              cursorWidth: 1.2,
    
              obscureText: false,
    
          //    autocorrect: true,
    
             //       controller: null,
    
              textAlign: TextAlign.left,
    
             //       textDirection: TextDirection.ltr,
    
              autofocus: false,
    
              cursorColor: Colors.black,
    
              keyboardType: TextInputType.text,
    
    
    
    
    
    
    
    
              decoration: InputDecoration(
      labelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 20,
                ),
                labelText: 'Hometown',
    
                hintText: "Enter Your Hometown.....",
    
            //          filled:true,
    
    
    
          //      contentPadding: EdgeInsets.all(20),
    
    
    
                enabledBorder: UnderlineInputBorder(
    
    
    
                  borderSide: BorderSide(color: Colors.black38,width: 1.0,),
    
    
    
           //       borderRadius: BorderRadius.circular(30.0),
    
    
    
              //    gapPadding:40.0,
    
    
    
                ),
    
    
    
                focusedBorder: UnderlineInputBorder(
    
    
    
                  borderSide: BorderSide(color: Colors.deepPurple,width: 3.0,),
    
    
    
           //       borderRadius: BorderRadius.circular(30.0),
    
    
    
    
    
                ),focusedErrorBorder:UnderlineInputBorder(
    
    
    
             //   borderRadius: BorderRadius.all(Radius.circular(30)),
    
    
    
          borderSide: BorderSide(color: Colors.red,width: 3.0,),
    
    
    
    
              ),
    
    errorStyle: TextStyle(color: Colors.red,fontWeight: FontWeight.w500),
    
    
    
              ),
    
    
    
            ),
    
          ),
    
    
    
    

    
          ///////Photo/////
    
                 
    
            ////////////////////////////////////////
    
    
    
          Container(   // second 2 container part 3 buttom
    
    
    
              margin: EdgeInsets.all(10),
    
              child: Column(
    
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
    
                  children: <Widget>[
    
    
    
                    RaisedButton(
    
    
    
                      child: Text("Sign up",
    
                      style: TextStyle(fontWeight: FontWeight.w400,
    
                      color: Colors.white,
    
          fontSize:18.0),),
    
    
    
                      onPressed: () async {
    
                      

 var formdata=formState.currentState;

    if(formdata.validate()){
  
    
    ////load true
    
     formdata.save();
    
       print("##############SAVED#################"); 
     user.registrationDate=DateTime.now();
        
    setState(() {
      isload=!isload;
     
    });
    
    FirebaseUser result= await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: this.user.email, password: this.user.password);

   


   if(result!=null){
    user.Id=result.uid;
    _startUpload();
    await _user.user_services().signup_user(user);
    Navigator.pushNamed(context, "Login");
   }else 
   {
     Navigator.pushNamed(context, "Register");

   }
   
    }
    else print("#####################Error########");
    
       setState(() {
      isload=!isload;
     
    });
    
    
    
    
    
    
    
    
    
    
    
    /////////////////////////////////////////////////////////////
    
                      },
    
                      color: Colors.green,
    
             padding: EdgeInsets.only(top:MediaQuery.of(context).size.height/40,
    
              bottom: MediaQuery.of(context).size.height/30,
    
              left: MediaQuery.of(context).size.width/9,
    
              right: MediaQuery.of(context).size.width/9,
    
                      ),
    
    
    
                      shape: RoundedRectangleBorder(
    
          borderRadius: BorderRadius.circular(180.0),
    
          side: BorderSide(color: Colors.deepPurple,width: 1.2)
    
    
    
                      ),
    
                    ),
    
    Divider(),
    
    Padding(
      padding: const EdgeInsets.only(top: 15),
      child:  Wrap(children: <Widget>[     Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          
          Text("By clicking sign up you agree to \nour terms&conditions."),
         InkWell(child: Text("Learn more",style: TextStyle(color: Colors.indigoAccent)),)
    
      ],
      ),
      
       
       
        ],
      ),
    
    ),

    
    
    
                   ]
    
              )
    
          )
    
    
    
    
    
    
    
    
    
    
    
       ],),
  ),
),

               //////////////////////////////////////////////////////////////////////////////////////////////////




            ],
          ),
            ),

          ),

        ],

      ),



    );
  }



} */