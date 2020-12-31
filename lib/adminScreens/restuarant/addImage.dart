


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:file_picker/file_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:traveliano/adminScreens/restuarant/newRestuarant2.dart';

import 'package:traveliano/models/city.dart';
import 'package:traveliano/models/hotel.dart';
import 'package:traveliano/adminScreens/addNewCity3.dart' as ci3;
import 'package:traveliano/load.dart' as load;
import 'package:traveliano/models/restuarant.dart';
import 'package:traveliano/services/admin.dart' as adminServies;

 









class UploadImage extends StatefulWidget {
 
City _city=new City();
Restuarant _restuarant = new Restuarant();
 UploadImage(City _city,Restuarant _restuarant){

this._city=_city;
this._restuarant=_restuarant;

 } 
 
  @override
UploadImageState createState() => UploadImageState( this._city,this._restuarant);
}
 
class UploadImageState extends State<UploadImage>  {

 City _city=new City();
Restuarant _restuarant=new Restuarant();
UploadImageState(City _city,Restuarant _restuarant){

this._city=_city;
this._restuarant=_restuarant;

 } 
 bool isload =false;



  bool visible=true;



   File _image ;
  Future getImage() async {
   File image;
      image = await( ImagePicker.pickImage(source:ImageSource.gallery));
 
setState(() {
  _image=image;
});

  }

   
  final FirebaseStorage _storage =FirebaseStorage(storageBucket: 'gs://traveliano-eefe4.appspot.com');

  StorageUploadTask _uploadTask;
Future uploadFile() async {   
  setState(() {
    visible=false;
  });
   String filePath = 'RestaurantsImages/${this._restuarant.Name}.png'; 
   StorageReference storageReference = FirebaseStorage.instance    
       .ref()    
       .child('${filePath}');    
   StorageUploadTask uploadTask = storageReference.putFile(_image);    
   await uploadTask.onComplete;    
   print('File Uploaded');    
   storageReference.getDownloadURL().then((fileURL) {    
     setState(() {
       visible=true;    
       this._restuarant.photo = fileURL;    
     });    
   });    
 }  












  @override
  Widget build(BuildContext context) {

 
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
     /*   
      appBar: PreferredSize(
        child: AppBar(
          iconTheme: new IconThemeData(color: Colors.green),
          //   leading: Icon(Icons.filter_list,color: Colors.green,) ,

          title: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text("Traveliano",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 30,
                      fontWeight: FontWeight.w900)),
              Text(
                this._restuarant.Name,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 10,
                    fontWeight: FontWeight.w300),
              ),
            ],
          ),

          centerTitle: true, backgroundColor: Colors.white,
        ),
        preferredSize: Size.fromHeight(75),
      ), */
        body: isload==true?load.load("Saving Hotel/Hostel ... please wait!"): Container(
          padding: EdgeInsets.all(20.0),
        
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
           
         

              SizedBox(
                height: 20.0,
              ),




 Container(
  padding: EdgeInsets.all(8.05),
  margin: EdgeInsets.only(top: MediaQuery.of(context).size.width/6),
  child: 
Column(
  children: <Widget>[
    this._restuarant.photo!=null? Container(

height: MediaQuery.of(context).size.width/1.4,width:MediaQuery.of(context).size.width/1.4,
child: Image.network(this._restuarant.photo,fit: BoxFit.cover,),

       ):  _image==null? Icon(Icons.image,size: 150,color: Colors.teal[100]):Container(

height: MediaQuery.of(context).size.width/1.4,width:MediaQuery.of(context).size.width/1.4,child: Image.file(_image,fit: BoxFit.cover,),

       ),
 Text("To upload image for hotel "+this._restuarant.Name+" Open your galary and select an Image,then Click save button to save hotel/hostel.",textAlign: TextAlign.center,),
      ],
)),
 

 
   

    Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Column(
                    children: <Widget>[
                      OutlineButton(
               //   focusColor: Colors.amber,
                        onPressed : () async {
                          await getImage();
                  
             await   this.uploadFile();



                        },
                        child: new Text("Open Galary",style: TextStyle(color: Colors.amber),),

                      ),
          
          




Padding(
  padding: const EdgeInsets.only(top: 10,bottom: 0,left: 90,right: 90),
  child:  
  
  
  visible?
   RaisedButton(
  
  
  
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      
      
      Text("Save",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w300),),
   Icon(Icons.save_alt,color: Colors.white,),
   
   
    ],
  ),
  
  color: Colors.green,
  
  elevation: 8.0,
  
  
  
  shape: RoundedRectangleBorder(  
  
    borderRadius: BorderRadius.circular(120.0),  
  
    side: BorderSide(color: Colors.green[300],width: 1.2)
  
       ),
  
      
  
     padding: EdgeInsets.only(top:MediaQuery.of(context).size.height/40,
  
      
  
            bottom: MediaQuery.of(context).size.height/30,
  
      
  
            left: MediaQuery.of(context).size.width/11,
  
      
  
            right: MediaQuery.of(context).size.width/11,
  
      
  
                            ),
  
  
  
  onPressed: ()async{ 
             

if(_city!=null){


  setState(() {
      this.isload=!this.isload;
    });
     this._restuarant.rate=0.0;
adminServies.admin_ser().addRestuarant(this._restuarant);

    setState(() {
      this.isload=!this.isload;
    });
    if(this._city.info!=null){
Navigator.pushReplacement(context,
      MaterialPageRoute(builder: (context){return ci3.newCity(this._city);}));
     
    }else{

      
Navigator.pushReplacement(context,
      MaterialPageRoute(builder: (context){return NewRestaurant();}));
     
    }


}else{


Firestore.instance.collection("Restaurants").document(this._restuarant.Id).updateData(

{

"photo":this._restuarant.photo


}

);

Navigator.pop(context);

}



  },
  
  
  
  ):CircularProgressIndicator(),
),


          
          
          
          
          
                    ],
                  ),
                ),
              ),
 
            ],
          ),
        ),



      ),
    );
  }}
 







/**    setState(() {
      this.isload=!this.isload;
    });
     this._restuarant.rate=0.0;
adminServies.admin_ser().addRestuarant(this._restuarant);

    setState(() {
      this.isload=!this.isload;
    });
    if(this._city.info!=null){
Navigator.pushReplacement(context,
      MaterialPageRoute(builder: (context){return ci3.newCity(this._city);}));
     
    }else{

      
Navigator.pushReplacement(context,
      MaterialPageRoute(builder: (context){return newRes.NewRestaurant();}));
     
    } */