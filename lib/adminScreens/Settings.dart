import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'dart:typed_data';

//import 'package:alpha2_countries/alpha2_countries.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_place/google_place.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:traveliano/globals.dart';
import 'package:traveliano/models/city.dart';
import 'package:traveliano/services/admin.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:path_provider/path_provider.dart';
class settings extends StatefulWidget {
  @override
  _settingsState createState() => _settingsState();
}

class _settingsState extends State<settings> {



  Future<File> getImageFromNetwork(String url) async {

     //var cacheManager = await CacheManager.getInstance();
 File file = await DefaultCacheManager().getSingleFile(url);
    // File file = await cacheManager.getFile(url);
     return file;
   }
    

Future uploadFile(String cityname,File _image) async {   

   String filePath = 'CitiesImages/${cityname}.png'; 
   StorageReference storageReference = FirebaseStorage.instance    
       .ref()    
       .child('${filePath}');    
   StorageUploadTask uploadTask = storageReference.putFile(_image);    
   await uploadTask.onComplete;    
   print('File Uploaded');    
   storageReference.getDownloadURL().then((fileURL) {    
    setState(() {
    cityname=fileURL;
    });
   });    
 } 

 
String chosen_Country;
final String citiesApiUrl="https://raw.githubusercontent.com/russ666/all-countries-and-cities-json/master/countries.json";

  @override
  Widget build(BuildContext context) {

    return Scaffold(
          body: Container(
            child: Column(

mainAxisAlignment: MainAxisAlignment.center,
crossAxisAlignment: CrossAxisAlignment.center,
children: <Widget>[



          Padding(
                    padding: const EdgeInsets.only(bottom: 20,left:10,right: 10),
                 
                  child: DropdownButtonFormField(//isDense: true,isExpanded: true,
    decoration: InputDecoration(
    
    
       //  icon: Icon(Icons.keyboard_arrow_down),
     //     iconEnabledColor: Colors.blue,
    ),
    
              value: this.chosen_Country,
       
           hint: Text("Country ..."),
          // disabledHint: Text("Travel with ...."), 
    validator: (val){
      
      if(val==null)return "Country is Required !!!";
      
      },onSaved: (val){   this.chosen_Country=val;},
              onChanged: (val){
           
          
                setState(() {    this.chosen_Country=val;
            
              
                });
            this.chosen_Country=val;
           
           
              },
    items: countries.map<DropdownMenuItem<String>>((String value){
    
    return DropdownMenuItem<String>(child: Text(value),value: value,);
    
    }).toList(),
                  ),
                  ),
    
    






Center(
  child:   FlatButton(
  
  
  color: Colors.cyan,
  child: Text("Load Cities",style: TextStyle(color: Colors.white),),
  
  
  
    onPressed: () async {
  
  
  
  
  
  //http.get(url)
  
  
  
   //final countries = Countries();
  
      //final code = await countries.resolveCode(this.chosen_Country);
  
  
  
  print("############   Country code = "+chosen_Country.toString()+"   ###############");
  

 Response response= await http.get(citiesApiUrl);
  


  if(response.statusCode==200)
  { //successful response
 
  String res = response.body;
  var json= jsonDecode(res);
Map list=json;

  for (MapEntry entry in list.entries) {
  


//print(entry.toString()+"---");


if(entry.key==chosen_Country)
{


for(dynamic city in entry.value)
{



    Geolocator().placemarkFromAddress(city+" "+chosen_Country).then((result) async {
  
 if(result!=null){
print("===> "+city+"  Latg= "+result[0].position.longitude.toString()+"  Latit= "+result[0].position.latitude.toString());


double citylat=result[0].position.latitude;
double citylong=result[0].position.longitude;
String cityphoto;

//var googlePlace = GooglePlace("AIzaSyBKyLID7e4yuV9QP65kRad_Cn0xjfjR4b8");



var respons= await http.get("https://pixabay.com/api/?key=16816579-70cdc72f1b3f3c4d232aa168f&q="+city+" "+chosen_Country+"&image_type=photo");
var json=jsonDecode(respons.body);
Map images=json;

/* 
for(var entry in images["hits"])
{


print(entry["largeImageURL"].toString()+"---");


}
 */

cityphoto=images["hits"][0]["largeImageURL"].toString();




//pixabay Api Key:   16816579-70cdc72f1b3f3c4d232aa168f


var _city =new City();


_city.latitude=citylat;
_city.longtude=citylong;
_city.Name=city;
_city.photo=cityphoto;
_city.Country=chosen_Country;
_city.maxBudget=0;
_city.minBudget=0;
_city.info="Located in "+chosen_Country+" ";
_city.rate=0;
_city.recommended_Type="";
_city.recommended_Weather="";
_city.Travelwith="family";

admin_ser().addCity(_city);





    }});
    
    
}








}









} 




//print(ListOfImages.length.toString()+"//////////////___");









  print("############  Ended  ############");


















//var googlePlace = GooglePlace("AIzaSyBKyLID7e4yuV9QP65kRad_Cn0xjfjR4b8");

//var resul = await googlePlace.search.getFindPlace("Cairo", InputType.TextQuery,fields: "restaurant");
/* var result = await googlePlace.details.get(resul.candidates[0].placeId,fields: "name,rating,formatted_phone_number");

var ref= result.result.photos[0].photoReference;

//var resu = await googlePlace.photos.get(ref.toString(), 400, 400);

print(ref.toString()); */


/* 
var x= await response.body.toString();
print(x); */

  }else{
//failed response

 print("Error http request");

  }
  
  
    },
  
  ),
)




,

//FadeInImage(placeholder: null, image: null)
/* ListView.builder(
  itemBuilder:(context,index){},
   itemCount:0 ,

  ),
 */






















Padding(
  padding: const EdgeInsets.only(top:40.0),
  child:   FlatButton(onPressed: () async {
  
  
  
  
  
  
  
  
  
  var googlePlace = GooglePlace("AIzaSyBKyLID7e4yuV9QP65kRad_Cn0xjfjR4b8");
  
  Location x=new Location(lng: 50,lat: 14);
  
  
  
  var resul = await googlePlace.search.getNearBySearch(x,500,type: 'restaurant');
  
  
  
  
  
  print(resul.status+"///|||||||");
  
  /* var result = await googlePlace.details.get(resul.candidates[0].placeId,fields: "name,rating,formatted_phone_number");
  
  
  
  */
  
  
  
  
  
  }, child: Text("Load Restaurants")),
),




Padding(
  padding: const EdgeInsets.only(top:40.0),
  child:   FlatButton(
    
    
    
    onPressed: () async {
var doc=await Firestore.instance.collection("Cities").document("BwoHeUFDK2Sj9Q8RarRe").get() ;
var x= doc.data["weather"];
print("Winter Value  ====  "+doc.data["weather"]["Winter"].toString());
print(x["Summer"]);
/* 
await Firestore.instance.collection("Cities").document("BwoHeUFDK2Sj9Q8RarRe")
.updateData({
"
});
 */
  }, child: Text("Load Rate")),
),















],




            ),
        
      ),
    );
  }
}  