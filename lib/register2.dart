//import 'package:firebase_auth/firebase_auth.dart';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:traveliano/services/user.dart';

import 'globals.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import 'package:traveliano/load.dart' as load;
import 'adminScreens/dialog.dart';
import 'package:traveliano/HOMEPAGE/home.dart' as Home;
import './adminScreens/home.dart' as adminhome;
import 'models/city.dart';
import 'animation/fadeAnimmation.dart';
import 'models/user.dart';
//import 'package:Anim';
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'global.dart' as globals;
class register extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return registerState();
  }
}

class registerState extends State<register> {
bool loadimg=false;
  String confirmPass;
bool isSeen=true;
  bool loadd=false;

User _user=new User();

  //final db=Firestore.instance;
  
  int Active=0;

  final GlobalKey<FormState> formState1 = GlobalKey<FormState>();
  final GlobalKey<FormState> formState2 = GlobalKey<FormState>();
  final GlobalKey<FormState> formState3 = GlobalKey<FormState>();




///////////////////////////////////////////
////////////////////Image Section//////////////////////
///
 File _image ;
 final FirebaseStorage _storage =FirebaseStorage(storageBucket: 'gs://traveliano-eefe4.appspot.com');
StorageUploadTask _uploadTask;
Future uploadFile() async {   
   String filePath = 'usersImages/${_user.email}.png'; 
   StorageReference storageReference = FirebaseStorage.instance    
       .ref()    
       .child('${filePath}');    
   StorageUploadTask uploadTask = storageReference.putFile(_image);    
   await uploadTask.onComplete;    
   print('File Uploaded');    
   storageReference.getDownloadURL().then((fileURL) {    
setState(() {
  _user.Photo=fileURL;

});


   });    
 } 












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

 uploadFile();
  }

  
  
  
  
  
  
  
  
  





/////////////////////////////////////////////




  @override
  Widget build(BuildContext context) {
   
     
    
    return loadd? load.load("Signing in ..."):Scaffold(
   backgroundColor: Colors.white,
      body: SingleChildScrollView(

                  child: Column(
          children: <Widget>[
            Container(
              height: 295,
       // margin: EdgeInsets.all(15),
      decoration:BoxDecoration(
color: Colors.white,
  //gradient: LinearGradient(colors: [Colors.blue[300],Colors.blue[90]]),
//border: Border.all(width: 2.0,color: Colors.blue),
//boxShadow: [BoxShadow(color: Colors.blue,blurRadius: 5,spreadRadius:5)],
//image: DecorationImage(
//image: AssetImage("images/back2.png"),
///fit: BoxFit.cover

//)
      ),
          child: Stack(
            children: <Widget>[

    FadeAnimation(2, Image.asset("images/back2.png",fit: BoxFit.fill,width: double.infinity))

      ,       
        Align(
          alignment: Alignment.topLeft,
   child: FadeAnimation(2,Padding(
     padding: const EdgeInsets.only(top:80.0,left:50.0),
     child:Text("Traveliano", style: TextStyle(color: Colors.white,
     fontFamily: "Pacifico",fontWeight: FontWeight.w700,fontSize: 30)),
   
   )
   )
   )
,
        FadeAnimation(3, Align(alignment: Alignment.bottomRight,child: SvgPicture.asset("images/travelgirl.svg",height: 150,)))
        
            ],
          ),
          //    margin: EdgeInsets.only(
         //         top: MediaQuery.of(context).size.height /25,
       //           bottom: 0),
            ),
       
       
       
       
            Active==0?Container(
              
              child: Form(

key: formState1,


                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 10,left:10),
                                    child: FadeAnimation(
                                      1,
                              ListView(

                  children: <Widget>[

           TextFormField(
      initialValue: _user.firstName,
             onSaved: (val) {
          _user.firstName=val;
             },
             validator: (val) {
                 if (val == '')
            return 'Your First Name is Required';
                
             },
             cursorWidth: 2.0,
             obscureText: false,
             autocorrect: true,
             controller: null,
             textAlign: TextAlign.left,
       
             autofocus: false,
             cursorColor: Colors.brown,
             keyboardType: TextInputType.text,
             style: TextStyle(
                 color: Colors.brown,
                 letterSpacing: .5,
                 wordSpacing: 1.5,
                 decorationStyle: TextDecorationStyle.solid,
                 decorationColor: Colors.red,
             ),
             decoration: InputDecoration(
             prefixIcon: Icon(Icons.person_outline),
                 focusedErrorBorder: UnderlineInputBorder(

             borderSide: BorderSide(width: 2.0)
                 ),
                 errorBorder:UnderlineInputBorder(

             borderSide: BorderSide(width: 2.0,color: Colors.red)
                 ),
                 labelText: 'First Name',
                 hintText: "Enter Your First Name.....",
                 filled: false,
                 contentPadding: EdgeInsets.all(6),
                 enabledBorder: UnderlineInputBorder(

             borderSide: BorderSide(width: 2.0,color: Colors.black12)
                 ),
             
             ),
           ),
                 TextFormField(
                   initialValue: _user.lastName,
            onSaved: (val) {
            
            setState(() {
                 _user.lastName = val;
            
            });
             
            },
            validator: (val) {
                if (val == '')
                  return 'Your last Name is Required';
            },
            cursorWidth: 2.0,
       //     obscureText: true,

            autocorrect: true,
        //    controller: null,
            textAlign: TextAlign.left,
      
            autofocus: false,
            cursorColor: Colors.brown,
            keyboardType: TextInputType.text,
            style: TextStyle(
                color: Colors.brown,
                letterSpacing: .5,
                wordSpacing: 1.5,
                decorationStyle: TextDecorationStyle.solid,
                decorationColor: Colors.red,
            ),
            decoration: InputDecoration(
           prefixIcon: Icon(Icons.person_outline),
                focusedErrorBorder: UnderlineInputBorder(

                   borderSide: BorderSide(width: 2.0)
                ),
                errorBorder:UnderlineInputBorder(

                   borderSide: BorderSide(width: 2.0,color: Colors.red)
                ),
                labelText: 'Last Name',
                hintText: "Enter Your Last Name.....",
                filled: false,
                
                contentPadding: EdgeInsets.all(6),
                enabledBorder: UnderlineInputBorder(

                   borderSide: BorderSide(width: 2.0,color: Colors.black12)
                ),
             
            ),),

     DateTimeField(
       initialValue: _user.birthday,
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black12,)
                ),
                prefixIcon: Icon(Icons.calendar_today,color: Colors.teal,),
                
       contentPadding: EdgeInsets.all(6),
          //      filled: true,
           //     fillColor: Colors.white54,
                // focusColor: Colors.black,
                labelText: 'Birthday',
                labelStyle: TextStyle(
             //     fontWeight: FontWeight.w800,
            //      color: Colors.black,
             //     fontSize: 18,
                ),
              ),
              format: DateFormat("yyyy-MM-dd"),
              onSaved: (value) {
               this._user.birthday = value;
              
              },validator: (val){if(val==null)return "Birthday is required !!!";},
              onShowPicker: (context, currentValue) {
                return showDatePicker(
                    context: context,
                    firstDate: DateTime(1900),
                    initialDate: currentValue ?? DateTime.now(),
                    lastDate: DateTime.now());

              },
            ),
           
  
 DropdownButtonFormField(//isDense: true,isExpanded: true,


 onSaved: (val){this._user.hometown=val;},
    decoration: InputDecoration(
 contentPadding: EdgeInsets.all(10),
    prefixIcon: Icon(Icons.public,size: 30,),
    
enabledBorder: UnderlineInputBorder(
borderSide: BorderSide(width: 0,color: Colors.white)

)
       //  icon: Icon(Icons.keyboard_arrow_down),
     //     iconEnabledColor: Colors.blue,
    ),
    
                   value: this._user.hometown,
       
                hint: Text("Country"),
               // disabledHint: Text("Travel with ...."), 
    validator: (val){
      if(val==null){return "Country is Required !!!";}
      },onChanged: (val){
setState(() {
  this._user.hometown=val;
});


      },
                   
    items: countries.map<DropdownMenuItem<String>>((String value){
    
    return DropdownMenuItem<String>(child: Text(value,overflow: TextOverflow.clip,style: TextStyle(fontWeight: FontWeight.w400),),value: value,);
    
    }).toList(),
                           ),
  

                 



                  ],
                ),
                                    ),
                                  ),
              ),
            margin: EdgeInsets.only(left:8.0,right:8.0),
             height: MediaQuery.of(context).size.height / 2.36,
              width: MediaQuery.of(context).size.width,
          //   color: Colors.white,
             decoration: BoxDecoration(
//boxShadow: [BoxShadow(blurRadius: 5.0,color: Colors.blue[90],spreadRadius: 8)],
color: Colors.white


             ),
            )
            
            :Active==1?
            ///Second Container
      Container(
              
              child: Form(

key: formState2,


         child: FadeAnimation(
                    1, ListView(

                    children: <Widget>[

             TextFormField(
    initialValue: _user.email,
               onSaved: (val) {
                  this._user.email = val;
               },
               validator: (val) {
                   if (val == '')
              return 'Your Email is Required';
              if(!val.toString().contains("@")
                    ||
                 !val.toString().contains(".")   
              ||
                 !val.toString().contains("com") 
              )
              
              return "Invalid Email !!!";
                  
               },
               cursorWidth: 2.0,
               obscureText: false,
               autocorrect: true,
               controller: null,
               textAlign: TextAlign.left,
       
               autofocus: false,
               cursorColor: Colors.brown,
               keyboardType: TextInputType.text,
               style: TextStyle(
                   color: Colors.brown,
                   letterSpacing: .5,
                   wordSpacing: 1.5,
                   decorationStyle: TextDecorationStyle.solid,
                   decorationColor: Colors.red,
               ),
               decoration: InputDecoration(

                 prefixIcon: Icon(Icons.alternate_email,color: Colors.green,),
                   focusedErrorBorder: UnderlineInputBorder(

               borderSide: BorderSide(width: 2.0)
                   ),
                   errorBorder:UnderlineInputBorder(

               borderSide: BorderSide(width: 2.0,color: Colors.red)
                   ),
                   labelText: 'Email',
                   hintText: "Enter Your Email.....",
                   filled: false,
                   contentPadding: EdgeInsets.all(6),
                   enabledBorder: UnderlineInputBorder(

               borderSide: BorderSide(width: 2.0,color: Colors.black12)
                   ),
               
               ),
             ),
      
      
      
      
      
                   TextFormField(
     initialValue: _user.password,
              onSaved: (val) {
       setState(() {
              this._user.password = val;
              
    
       });     
    
               
              },
              onChanged: (val){

this._user.password=val;

              },
              validator: (val) {
                  if (val == ''){  return 'Your Password is Required';}
                  
              if(val.length<4){return "Password Must be more than 4 digits";}
              
              },
              cursorWidth: 2.0,
              obscureText: isSeen,

              autocorrect: true,
              controller: null,
              textAlign: TextAlign.left,
      
              autofocus: false,
              cursorColor: Colors.brown,
              keyboardType: TextInputType.text,
              style: TextStyle(
                  color: Colors.brown,
                  letterSpacing: .5,
                  wordSpacing: 1.5,
                  decorationStyle: TextDecorationStyle.solid,
                  decorationColor: Colors.red,
              ),
              decoration: InputDecoration(
            //    suffix: Icon(Icons.remove_red_eye,color: Colors.teal,),
   
   prefixIcon: Icon(Icons.security,color: Colors.blue,),
   suffixIcon: InkWell(onTap: (){

setState(() {
  isSeen=!isSeen;
});

   },child: Icon(Icons.remove_red_eye,color:Colors.teal,)),
                  focusedErrorBorder: UnderlineInputBorder(

                     borderSide: BorderSide(width: 2.0)
                  ),
                  errorBorder:UnderlineInputBorder(

                     borderSide: BorderSide(width: 2.0,color: Colors.red)
                  ),
                  labelText: 'Password',
                  hintText: "Enter Your Password.....",
                  filled: false,
                  
                  contentPadding: EdgeInsets.all(6),
                  enabledBorder: UnderlineInputBorder(

                     borderSide: BorderSide(width: 2.0,color: Colors.black12)
                  ),
               
              ),),

    




  

        TextFormField(
           
           initialValue: confirmPass,
              onSaved: (val) {
       
               confirmPass = val;
    
              },
              validator: (val) {
                  if (val == ''){return 'Your Password is Required';}
              
       if(this._user.password!=val)
       {return "Passwords Do Not match !!!";}
              },
              cursorWidth: 2.0,
              obscureText: true,

              autocorrect: true,
              controller: null,
              textAlign: TextAlign.left,
      
              autofocus: false,
              cursorColor: Colors.brown,
              keyboardType: TextInputType.text,
              style: TextStyle(
                  color: Colors.brown,
                  letterSpacing: .5,
                  wordSpacing: 1.5,
                  decorationStyle: TextDecorationStyle.solid,
                  decorationColor: Colors.red,
              ),
              decoration: InputDecoration(
            prefixIcon: Icon(Icons.verified_user,color: Colors.blue,),
                  focusedErrorBorder: UnderlineInputBorder(

                     borderSide: BorderSide(width: 2.0)
                  ),
                  errorBorder:UnderlineInputBorder(

                     borderSide: BorderSide(width: 2.0,color: Colors.red)
                  ),
                  labelText: 'Confirm-Password',
                  hintText: "Enter Your Password Again.....",
                  filled: false,
                  
                  contentPadding: EdgeInsets.all(6),
                  enabledBorder: UnderlineInputBorder(

                     borderSide: BorderSide(width: 2.0,color: Colors.black12)
                  ),
               
              ),),


                   



                    ],
                  ),
         ),
              ),
            margin: EdgeInsets.only(left:8.0,right:8.0),
             height: MediaQuery.of(context).size.height / 2.4,
              width: MediaQuery.of(context).size.width,
          //   color: Colors.white,
             decoration: BoxDecoration(
//boxShadow: [BoxShadow(blurRadius: 5.0,color: Colors.blue[90],spreadRadius: 8)],
color: Colors.white


             ),
            ):   Container(
              
              child: ListView(

                       children: <Widget>[

      
                               Align(
                        //       alignment: Alignment.bottomLeft,
                                child: InkWell(

onTap: (){

return showDialog(
  
  barrierDismissible: true,
  context: context,child: FadeAnimation(
      1, AlertDialog(

    title: Text("Continue Using.."),
content: Container(
    height: 100,
    child:   ListView(
    
    children: <Widget>[
    
    ListTile(
      onTap:(){getImage(false);},
      title: Text("Galary"),leading: Icon(Icons.image,size: 40,),),                                           
    
    
    
    ListTile(
      onTap:  (){getImage(true);},
      
      title: Text("Camara"),leading: Icon(Icons.camera_alt,size: 40,),),
    
    
    
    
    
    ],
    
    
    
    ),
),
),
  )

);



},

                                                            child: Container
                                  (
    
width: MediaQuery.of(context).size.width/2.6,
height: MediaQuery.of(context).size.height/4.5,
    decoration: BoxDecoration(
border: Border.all(width: 1.0,color: Colors.white),
      color: Colors.blueGrey[200],
      borderRadius: BorderRadius.circular(300.0),
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
      Icon(Icons.image,size: 100,color:Colors.white,)


)
    ),

                                  ),
                                ),
                   ), 


Padding(
  padding: const EdgeInsets.all(8.0),
    
    child: loadimg==true? Padding(
    padding: const EdgeInsets.only(left: 120,right: 120),
   child: CircularProgressIndicator(semanticsLabel: "Uploading..",)):
    Text("Click on the image to upload \nYour profile picture ",textAlign: TextAlign.center,),
  
)
  
                  

                       ],
                     ),
            margin: EdgeInsets.only(left:8.0,right:8.0),
             height: MediaQuery.of(context).size.height / 2.4,
              width: MediaQuery.of(context).size.width,
          //   color: Colors.white,
             decoration: BoxDecoration(
//boxShadow: [BoxShadow(blurRadius: 5.0,color: Colors.blue[90],spreadRadius: 8)],
color: Colors.white


             ),
            )
       
       
       
       
       
       
       
       ,
       
        Container(//color: Colors.white,
   //  height: 50,
          child: Row(
//crossAxisAlignment: CrossAxisAlignment.center,
                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                       children: <Widget>[
    Active!=0? InkWell(child: Text("Back",
                         style: TextStyle(color: Colors.deepPurple,fontWeight: FontWeight.w400),),
                         
                         
                         onTap: (){
                           
                             setState(() {
                               Active--;
                             });
                         },):Container(),






                         FlatButton(color: Colors.blue,child: Text("Next",
                         style: TextStyle(color: Colors.white,
                         fontWeight: FontWeight.w400),),
                         
                         
                         onPressed: () async {
                           if(Active==0){
if(formState1.currentState.validate()){

formState1.currentState.save();
   setState(() {
                             Active=1;
                           });
}


                           }else               
                             if(Active==1){
if(formState2.currentState.validate()){

formState2.currentState.save();
   setState(() {
                             Active=2;
                           });
}


                           }
else               
                             if(Active==2){
/* if(formState1.currentState.validate()){

formState1.currentState.save();
   setState(() {
                         //    Active++;

                        
                           }); print("Done Img re");
} */






    AuthResult result= await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: this._user.email, password: this._user.password);
   if(result!=null){
    _user.Id=result.user.uid;
    _user.registrationDate=DateTime.now();
    await user_services().signup_user(_user);
    Navigator.pushNamed(context, "Login");
   }else 
   {
    // Navigator.pushNamed(context, "Register");

   }
   
    }
    else print("#####################Error########");
    
    






                         



                        
                         
                         },),
                       ],
                     ),
        ), 
       
       
       
       
          ],
        ),
      ),
    );
  }
}
