//import 'package:firebase_auth/firebase_auth.dart';
import 'package:charts_flutter/flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter/rendering.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:traveliano/globals.dart';
//import 'package:multi_image_picker/multi_image_picker.dart';
//import 'package:traveliano/load.dart' as load;
import 'adminScreens/dialog.dart';
import 'package:traveliano/HOMEPAGE/home.dart' as Home;
import './adminScreens/home.dart' as adminhome;
import 'load.dart';
import 'package:traveliano/services/user.dart';
import 'models/city.dart';
import 'animation/fadeAnimmation.dart';
//import 'package:Anim';
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'global.dart' as globals;
class login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return loginState();
  }
}

class loginState extends State<login> {

  String email;
  String pass;
  bool loadd=false;
  //final db=Firestore.instance;
   GlobalKey<ScaffoldState> scaffoldState = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> formState = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var x;
    if(MediaQuery.of(context).size.height>MediaQuery.of(context).size.width){
setState(() {
 x=7.29; 
});



    }else setState(() {
     x=20; 
    }); 
    
    
    
    
    
    
    
    
    
    return /* loadd? load.load("Signing in ..."): */Scaffold(
   key: scaffoldState,
      body: Form(
        key: formState,
        child: Container(
          color: Colors.white,
          child: SingleChildScrollView(
                      child: Column(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.width/1.30,
       // margin: EdgeInsets.all(15),
        decoration:BoxDecoration(
color: Colors.white,
  //gradient: LinearGradient(colors: [Colors.blue[300],Colors.blue[100]]),
//border: Border.all(width: 2.0,color: Colors.blue),
//boxShadow: [BoxShadow(color: Colors.blue,blurRadius: 5,spreadRadius:5)],
//image: DecorationImage(
//image: AssetImage("images/back2.png"),
///fit: BoxFit.cover

//)
        ),
              child: Stack(
                children: <Widget>[

    FadeAnimation(4, Image.asset("images/back2.png",fit: BoxFit.fill,width: double.infinity))

        ,       
            Align(
              alignment: Alignment.topLeft,
   child: FadeAnimation(6,Padding(
     padding: const EdgeInsets.all(50.0),
     child: RichText(

text:new TextSpan(
  
children: <TextSpan>[
TextSpan(text: "Traveliano", style: TextStyle(color: Colors.white,
     fontFamily: "Pacifico",fontWeight: FontWeight.w700,fontSize: 35)),


//TextSpan(text: "vel"),


]
)


          
     //Text("Traveliano",style: TextStyle(color: Colors.white,
     //fontFamily: "",fontSize: 30,fontWeight: FontWeight.w300),
     
     ),
   
   )
   )
   )
,
            FadeAnimation(6, Align(alignment: Alignment.bottomRight,child: SvgPicture.asset("images/travelgirl.svg",height: 150,)))
            
                ],
              ),
              //    margin: EdgeInsets.only(
             //         top: MediaQuery.of(context).size.height /25,
         //           bottom: 0),
                ),
         
         
         
         
             loadd?Container(
               
                      height: MediaQuery.of(context).size.height / 1.96,
               
               child: Center(child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: <Widget>[
                   SpinKitDualRing(size: 60,color: Colors.blue,),
                   Padding(
                     padding: const EdgeInsets.only(top:70.0),
                     child: Text("Logging in"),
                   ),
                 ],
               ))) : Container(
                  
                  child: ListView(
                    children: <Widget>[

               Container(
               //  decoration: BoxDecoration(boxShadow: [BoxShadow()])
                 //,
                        margin: EdgeInsets.only(
                            left: 20, right: 20, top: 0, bottom: 0),
                        child: Container(height: MediaQuery.of(context).size.width/2.2,
                          child: ListView(
                            children: <Widget>[
                              TextFormField(
                          onSaved: (val) {
                            email = val;
                          },onChanged: (val){    email = val;},
                          validator: (val) {
                            if (val == '')
                               return 'Your Email is Required';
                            else if (!val.contains("@") ||
                                 !val.contains("."))
                               return "Invalid Email !!";
                          },
                          cursorWidth: 2.0,
                          obscureText: false,
                          autocorrect: true,
                          controller: null,
                          textAlign: TextAlign.left,
                          textDirection: TextDirection.ltr,
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
                      suffixIcon: Icon(Icons.alternate_email),
                      
                            focusedErrorBorder: UnderlineInputBorder(

                                borderSide: BorderSide(width: 2.0)
                            ),
                            errorBorder:UnderlineInputBorder(

                                borderSide: BorderSide(width: 2.0,color: Colors.red)
                            ),
                            labelText: 'Email',
                            hintText: "Enter Your Email.....",
                            filled: false,
                            contentPadding: EdgeInsets.all(12),
                            enabledBorder: UnderlineInputBorder(

                                borderSide: BorderSide(width: 2.0,color: Colors.black12)
                            ),
                      
                          ),
                        ),
                           
                                    TextFormField(
                           onSaved: (val) {
                           
                           setState(() {
                              pass = val;
                           
                           });
                            
                           },
                           validator: (val) {
                             if (val == '')
                               return 'Your Password is Required';
                           },
                           cursorWidth: 2.0,
                           obscureText: true,

                           autocorrect: true,
                           controller: null,
                           textAlign: TextAlign.left,
                           textDirection: TextDirection.ltr,
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
                        suffixIcon: Icon(Icons.vpn_key),
                      
                             focusedErrorBorder: UnderlineInputBorder(

                                borderSide: BorderSide(width: 2.0)
                             ),
                             errorBorder:UnderlineInputBorder(

                                borderSide: BorderSide(width: 2.0,color: Colors.red)
                             ),
                             labelText: 'Password',
                             hintText: "Enter Your Password.....",
                             filled: false,
                             
                             contentPadding: EdgeInsets.all(12),
                             enabledBorder: UnderlineInputBorder(

                                borderSide: BorderSide(width: 2.0,color: Colors.white)
                             ),
                      
                           ),),
                   
                           
                            ],
                          ),
                        ),
                      ),

                      Row(mainAxisAlignment: MainAxisAlignment.center,
                     children: <Widget>[
               
                       InkWell(child: Text("Forget Password?",
                       style: TextStyle(color: Colors.deepPurple,fontWeight: FontWeight.w300),),
                       
                       
                       onTap: (){

if (email == null){
  
  scaffoldState.currentState.showSnackBar(
  SnackBar(duration: Duration(seconds: 2),content: Text("Email is required to reset password")), 


);}
                            else if (!email.contains("@") ||
                                 !email.contains("."))
                               {scaffoldState.currentState.showSnackBar(
  
SnackBar(duration: Duration(seconds: 2),content: Text("Invalid Email")), 


);}else{

/*
import dartio http pathprovider

void downloadimage(imgurl)async{

http.Response response=http.get(imgurl);
Directory tempdic=await getTemporaryDirectory();
String filepath=tempdic.path+'/temimg.jpg'
File imgFile= File(filepath);
await imgFile.writeByte(response.bodyBytes);
uploadtofirestore(imgFile);

}

uploadtofirestore(File file){

  //code to upload
}


 */

user_services().resetPassword(email).then((val){

if(val==1){

scaffoldState.currentState.showSnackBar(
  
SnackBar(duration: Duration(seconds: 2),content: Text("An Email has been sent to you to reset your password")), 


);

}else{

scaffoldState.currentState.showSnackBar(
  
SnackBar(duration: Duration(seconds: 2),content: Text("This Email is not found or invalid")), 


);

}



});
  

}

 
                     },)
                     ,  
                       ],
                            
                          ),


                       Container(
                         margin: EdgeInsets.only(top:7 ,bottom: 10,right: 90,left: 90),
                         child: FadeAnimation(5,
                                                            RaisedButton(


                                                              
                              child: Text(
                                "Login",
                                style: TextStyle( 
//fontSize: 20,
  //                            
    //                             fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ),
                             /*  onPressed: () {
                                //setState(() {loadd=true;});
                             final formdata =formState.currentState;
                             formdata.save();    
      if(email=="1"){                           
  Navigator.pushReplacement(context,
      MaterialPageRoute(builder: (context){return adminhome.home();}));
      } else {Navigator.pushReplacement(context,
      MaterialPageRoute(builder: (context){return Home.Home();}));
     }
                            
                            
                            
                              }
                            , */
onPressed: () async{


//Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);


                  final formdata =formState.currentState;
               if(formdata.validate()){
                    formdata.save();
setState(() {
  loadd=true;
});
 DocumentSnapshot usr;
try{

//bottomSheet(context, SpinKitChasingDots(size: 30,));
  AuthResult Fireauth= await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email, password: pass);

    //  Fireauth.additionalUserInfo.profile.
//globals.LoggedStu={"email":email,"pass":pass,"id":Fireauth.uid};
      if(Fireauth.user.uid=="ktXwLhNqcQMVlTEcI7L88C0dIkA2")
      {
  Navigator.pushReplacement(context,
      MaterialPageRoute(builder: (context){return adminhome.home(); }));

      }else{


Navigator.pushReplacement(context,
      MaterialPageRoute(builder: (context){return Home.Home(); }));


}



      setState(() {
  loadd=false;
});
   

      }

//print(Fireauth.email);

catch(error){

setState(() {
  loadd=false;
});

scaffoldState.currentState.showSnackBar(
  
SnackBar(duration: Duration(seconds: 2),content: Text("Login Failed")), 


);
}
}

                  

               },
                      color: Colors.deepPurple,    
                              padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height /
                                    40,
                                bottom:
                                    MediaQuery.of(context).size.height /
                                        35,
             
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(40.0),
                                  side: BorderSide(
                                      //color: Colors.deepPurple,
                                      width: 0
                                      
                                      )),
                            ),
                         ),
                       ),

    
  
                       Center(
                         child: Padding(
                           padding: const EdgeInsets.only(top:2.0),
                           child: InkWell(child: Text("Create New Account",
                           style: TextStyle(color: Colors.deepPurple,fontWeight: FontWeight.w400),),
                           
                           
                           onTap: (){
                             
                               Navigator.pushNamed(context, "Register");
                           
                           },),
                         ),
                       ),

  

                       
                      
Divider(thickness: 2.5,),


/*
  Wrap(children: <Widget>[     Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      
      Text("By clicking Login you agree to \nour terms&conditions."),
     InkWell(child: Text("Learn more",style: TextStyle(color: Colors.indigoAccent)),)
    
  ],
  ),
  
   
   
    ],
  )*/
                    ],
                  ),
                  margin: EdgeInsets.all(8.0),
                  height: MediaQuery.of(context).size.height / 1.96,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                ),
              ],
            ),
          ),

          height: MediaQuery.of(context).size.height,
         

          // border: Border.all(width: 1),
        ),
      ),
    );
  }
}
