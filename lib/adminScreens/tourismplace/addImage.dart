/**
  onPressed: ()async{ 
    setState(() {
      this.isload=!this.isload;
    });
   
    this._tourismPlace.cityId=this._city.Id;
adminServies.admin_ser().addTourismPlace(this._tourismPlace);

    setState(() {
      this.isload=!this.isload;
    });
    


     if(this._city.info!=null){
Navigator.pushReplacement(context,
      MaterialPageRoute(builder: (context){return ci3.newCity(this._city);}));
    }else{
       Navigator.pushReplacement(context,MaterialPageRoute(builder: 
  (context){return newTplace.NewTourismPlace();}));
   
  
  }

  } */


  import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:file_picker/file_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:traveliano/adminScreens/hotel/allHotels.dart';
import 'package:traveliano/adminScreens/tourismplace/allTourismPlaces.dart';
import 'package:traveliano/models/city.dart';
import 'package:traveliano/models/hotel.dart';
import 'package:traveliano/adminScreens/addNewCity3.dart' as ci3;
import 'package:traveliano/load.dart' as load;
import 'package:traveliano/models/tourismplace.dart';
import 'package:traveliano/services/admin.dart' as adminServies;
import 'package:traveliano/adminScreens/hotel/addAccommodation2.dart' as addAcc2;
 









class UploadImage extends StatefulWidget {
 
City _city=new City();
TourismPlace _tourismPlace=new TourismPlace();
 UploadImage(City _city,TourismPlace tourismPlace){

this._city=_city;
this._tourismPlace=tourismPlace;

 } 
 
  @override
UploadImageState createState() => UploadImageState( this._city,this._tourismPlace);
}
 
class UploadImageState extends State<UploadImage>  {



  bool visible=true;
City _city=new City();
TourismPlace _tourismPlace=new TourismPlace();
 UploadImageState(City _city,TourismPlace tourismPlace){

this._city=_city;
this._tourismPlace=tourismPlace;

 } 
 bool isload =false;





   
  Future getImage() async {
   File image;
      image = await( ImagePicker.pickImage(source:ImageSource.gallery));
 
setState(() {
  _image=image;
});

  }


  final FirebaseStorage _storage =FirebaseStorage(storageBucket: 'gs://traveliano-eefe4.appspot.com');

  StorageUploadTask _uploadTask;
   File _image ;
Future uploadFile() async {   

/* if(this._tourismPlace.photo!=null){

await FirebaseStorage.instance.ref().child("TourismPlace").child(this._tourismPlace.Name+".png").delete();


} */
visible=false;
 String filePath = 'TourismPlace/${this._tourismPlace.Name}.png'; 
   StorageReference storageReference = FirebaseStorage.instance    
       .ref()    
       .child('${filePath}');    
   StorageUploadTask uploadTask = storageReference.putFile(_image);    
   await uploadTask.onComplete;    
   print('File Uploaded');    
   storageReference.getDownloadURL().then((fileURL) {    
     setState(() {    
       visible=true;
       this._tourismPlace.photo = fileURL;    
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
                this._tourismPlace.Name,
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
    this._tourismPlace.photo!=null? Container(

height: MediaQuery.of(context).size.width/1.4,width:MediaQuery.of(context).size.width/1.4,
child: Image.network(this._tourismPlace.photo,fit: BoxFit.cover,),

       ):  _image==null? Icon(Icons.image,size: 150,color: Colors.teal[100]):Container(

height: MediaQuery.of(context).size.width/1.4,width:MediaQuery.of(context).size.width/1.4,child: Image.file(_image,fit: BoxFit.cover,),

       ),
 Text("To upload image for hotel "+this._tourismPlace.Name+" Open your galary and select an Image,then Click save button to save hotel/hostel.",textAlign: TextAlign.center,),
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
 await this.uploadFile();


                        },
                        child: new Text("Open Galary",style: TextStyle(color: Colors.amber),),

                      ),
          
          




Padding(
  padding: const EdgeInsets.only(top: 10,bottom: 0,left: 90,right: 90),
  child:  
  
  
  
  visible? RaisedButton(
  
  
  
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


if(this._city==null){

if(this._tourismPlace.photo!=null){

await Firestore.instance.collection("tourismPlaces")
.document(this._tourismPlace.Id).updateData(
  
  {
"photo":this._tourismPlace.photo

  });
}


Navigator.pop(context);
    }

else{
    setState(() {
      this.isload=!this.isload;
    });
    this._tourismPlace.cityId =this._city.Id;
adminServies.admin_ser().addTourismPlace(this._tourismPlace);

    setState(() {
      this.isload=!this.isload;
    });

    if(this._city.info!=null){

Navigator.pushReplacement(context,
      MaterialPageRoute(builder: (context){return ci3.newCity(this._city);}));
     

    }else{
Navigator.pushReplacement(context,
      MaterialPageRoute(builder: (context){return tourismPlace();}));
     


    }}


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
 