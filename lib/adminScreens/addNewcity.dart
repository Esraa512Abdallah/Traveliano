import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:traveliano/models/city.dart';
import 'package:traveliano/adminScreens/location.dart' as location;

import '../globals.dart';

class newCity extends StatefulWidget {

City _editCity =new City();

  bool isUpdate;
newCity(City city,bool up){
this._editCity=city;
isUpdate=up;

}

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return newCityState(this._editCity,isUpdate);
  }
}

class newCityState extends State<newCity> {


  bool isUpdate;
City new_city=new City() ;

newCityState(City editCity,bool up){
  isUpdate=up;
if(editCity!=null){
   this.new_city=editCity;
print(this.new_city.Country+" #### "+isUpdate.toString()+" #### "+this.new_city.Name+" ######## "+this.new_city.info+" ######## ");

}}
 void fun(){


  
}



var travelwith=["Freinds","Family","Alone","Couple"];

 final GlobalKey<FormState> formState = GlobalKey<FormState>();




File _image;

  //bool _isVisible = true;

  Future getImage(bool isCamera) async {
    File image;

    image = await (ImagePicker.pickImage(source: ImageSource.gallery));

    setState(() {
      _image = image;
    });

    //uploadFile();
  }



  final FirebaseStorage _storage =FirebaseStorage(storageBucket: 'gs://traveliano-eefe4.appspot.com');

  StorageUploadTask _uploadTask;
Future uploadFile() async {   
 
   String filePath = 'CitiesImages/${new_city.Name}.png'; 
   StorageReference storageReference = FirebaseStorage.instance    
       .ref()    
       .child('${filePath}');    
   StorageUploadTask uploadTask = storageReference.putFile(_image);    
   await uploadTask.onComplete;    
   print('File Uploaded');    
   storageReference.getDownloadURL().then((fileURL) {    

 new_city.photo=fileURL;
  
   });    
 } 





  @override
  Widget build(BuildContext context) {
    // TODO: implement build


 RangeValues valuess= RangeValues(1,100);
        return Scaffold(

floatingActionButton: FloatingActionButton(
  onPressed: (){





var formdate=formState.currentState;
new_city.Travelwith="";
if(formdate.validate()){
       this.uploadFile();

formdate.save();
/* print("###############################################***########################################"
+new_city.Country+"//////////"+new_city.info+"////////"+
new_city.Name+"//////"); */





Navigator.pushReplacement(context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation)=> location.MyApp(new_city,isUpdate),
   transitionDuration: Duration(milliseconds: 1000),
   transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
      
      return SlideTransition(

        position: Tween<Offset>(
          begin: const Offset(1.0, 0.0),
          end: Offset.zero,
        ).animate(animation),
        child: SlideTransition(
          position: Tween<Offset>(
            begin: Offset.zero,
            end: const Offset(1.0, 0.0),
          ).animate(secondaryAnimation),
          child: child,
        ),
      );
    
    }
          
          )
          
            );}






  },
child: Icon(Icons.navigate_next,size: 40,),backgroundColor: Colors.blue[300],
),
floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

          appBar: PreferredSize(
            child: AppBar(
              iconTheme: new IconThemeData(color: Colors.blue),
              //   leading: Icon(Icons.filter_list,color: Colors.green,) ,
    
              title: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("New City",
                  //    textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.blue[300],
                          fontSize: 20,
                          fontWeight: FontWeight.w800)),
             /*      Text(
                    "Add New City",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 10,
                        fontWeight: FontWeight.w300),
                  ), */
                ],
              ),
    
             // centerTitle: true, 
              backgroundColor: Colors.white,
            ),
            preferredSize: Size.fromHeight(60),
          ),
          body: Container(
            padding:EdgeInsets.all(10),
            margin: EdgeInsets.only(top: 3),
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                border: Border.all(color: Colors.white10, width: 2)),
            child:Form(
    
              key: formState,
                      child: ListView(
    
    
                children: <Widget>[
    
    
 /*       
    
    
RangeSlider(
values:valuess ,       
onChanged:(val){
setState(() {   
valuess=val;
});
labels: RangeLabels(val.start.toString(), val.end.toString());
},
min: 0,
max: 150,
divisions: 5,
inactiveColor: Colors.grey,

//child: InkWell(
  //child: Icon(Icons.arrow_back,size: 50,color: Colors.green,)
  
  
  
  //),





),
 */
  Padding(
                    padding: const EdgeInsets.only(bottom: 15,top:0),
                    child:InkWell(
                      
                      onTap:(){ 
                        
                        
                        getImage(false);
                      
                      //_startUpload();
               
                      
                      },
                      child:this._image==null?
                      
                      
                      Container(
                        
                        decoration: BoxDecoration(

borderRadius: BorderRadius.circular(20),
color: Colors.black12,
                        ),
                        height: MediaQuery.of(context).size.height/4.5,
                      child: Center(child:Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.image,size: 90,color: Colors.black26,),
                   Text("Click here to Upload Image")
                        ],
                      )),
                      
                      
                      
                      )
                    :Container(height: MediaQuery.of(context).size.height/4,decoration: BoxDecoration(

image:DecorationImage(
  fit: BoxFit.cover,
  image: FileImage(this._image),

)

                    ),),
                    )
                    ),

                  Padding(
                    padding: const EdgeInsets.only(bottom: 15,top:0),
                    child: TextFormField(
                      initialValue: new_city.Name,
                      validator: (val) {
                        if (val.length == 0) return "City name is required !!!";
                      },
    
                      onSaved: (val) {
               new_city.Name = val;
                      },
    
                      cursorWidth: 1.2,   obscureText: false,
    
                      //     autocorrect: true,
    
                      //         controller: null,
    
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
                        // prefixIcon: Icon(Icons.text_format),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
    
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
    
                        errorStyle:
                            TextStyle(color: Colors.red, fontWeight: FontWeight.w500),
    
                        labelText: 'City Name',
    
                        hintText: "Enter City Name.....",
    
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
    
    
    
    
    
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20,left:10,right: 10),
                 
                  child: DropdownButtonFormField(//isDense: true,isExpanded: true,
    decoration: InputDecoration(
    
    
       //  icon: Icon(Icons.keyboard_arrow_down),
     //     iconEnabledColor: Colors.blue,
    ),
    
              value: new_city.Country,
       
           hint: Text("Country ..."),
          // disabledHint: Text("Travel with ...."), 
    validator: (val){
      
      if(val==null)return "Country is Required !!!";
      
      },onSaved: (val){   new_city.Country=val;},
              onChanged: (val){
           
          
                setState(() {    new_city.Country=val;
            
              
                });
                 new_city.Country=val;
           
           
              },
    items: countries.map<DropdownMenuItem<String>>((String value){
    
    return DropdownMenuItem<String>(child: Text(value),value: value,);
    
    }).toList(),
                  ),
                  ),
    
    
    
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: TextFormField(
                       initialValue: new_city.info,
                      validator: (val) {
                        if (val.length == 0) return "City Information is required !!!";
                      },
    
                      onSaved: (val) {
                new_city.info= val;
                      },
    
                      cursorWidth: 1.2,   obscureText: false,
    
                      //     autocorrect: true,
    maxLines: 3,
                      //         controller: null,
    
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
                        // prefixIcon: Icon(Icons.text_format),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
    
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
    
                        errorStyle:
                            TextStyle(color: Colors.red, fontWeight: FontWeight.w500),
    
                        labelText: 'Description',

                        hintText: "Enter City Name.....",
    
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
    
    
    
    
    
    
   /* 
    
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20,left:10,right: 10),
                 
                  child: DropdownButtonFormField(//isDense: true,isExpanded: true,
    decoration: InputDecoration(
    
    
       //  icon: Icon(Icons.keyboard_arrow_down),
     //     iconEnabledColor: Colors.blue,
    ),
              value: new_city.Travelwith,
       
           hint: Text("Travel with ..."),
          // disabledHint: Text("Travel with ...."), 
    validator: (val){
      
      if(val==null)return "this field is Required";
      
      },onSaved: (val){   new_city.Travelwith=val;},
              onChanged: (val){
           
          
                setState(() {   new_city.Travelwith=val;
                 
               
                });
            new_city.Travelwith=val;
           
           
              },
    items: this.travelwith.map<DropdownMenuItem<String>>((String value){
    
    return DropdownMenuItem<String>(child: Text(value),value: value,);
    
    }).toList(),
                  ),
                  ),
    
    
    */
    
    ////////map
    
    
         
    
    /////map///
    
    
    
    
    
    
    
    





   

               
                ],
          ),
        ),
      ),
    );
  }
}



/* DropdownButton(isDense: true,isExpanded: true,

        value: dropval,
        icon: Icon(Icons.keyboard_arrow_down),
        iconEnabledColor: Colors.blue,
       hint: Text("Select Course Major..."),
       disabledHint: Text("Enter Major.."), 
        onChanged: (val){
          setState(() {
            dropval=val;
          });
        },
items: <String>["Desgin","Development","Business"].map<DropdownMenuItem<String>>((String value){

return DropdownMenuItem<String>(child: Text(value),value: value,);

}).toList(),

*/

