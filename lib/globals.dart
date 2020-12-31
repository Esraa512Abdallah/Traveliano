

 import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';



















Future uploadToStorage(String uid) async {
try {
  final DateTime now = DateTime.now();
  final int millSeconds = now.millisecondsSinceEpoch;
  final String month = now.month.toString();
  final String date = now.day.toString();
  final String storageId = (millSeconds.toString() + uid);
  final String today = ('$month-$date'); 

 final file =  await ImagePicker.pickVideo(source: ImageSource.gallery);
var length = await file.length();;
  StorageReference ref = FirebaseStorage.instance.ref().child("video").child(today).child(storageId);
  StorageUploadTask uploadTask = ref.putFile(file, StorageMetadata(contentType: 'video/mp4'));
  var downloadUrl = (await uploadTask.onComplete).ref.getDownloadURL();
    final String url = downloadUrl.toString();
    

 print(url);

} catch (error) {
  print(error);
  }
}















var countries=["United States", "Canada", "Afghanistan", "Albania", "Algeria", "American Samoa",
 "Andorra", "Angola", "Anguilla", "Antarctica", "Antigua", "Argentina",
  "Armenia", "Aruba", "Australia", "Austria", "Azerbaijan", "Bahamas", "Bahrain",
   "Bangladesh", "Barbados", "Belarus", "Belgium", "Belize", "Benin", "Bermuda",
    "Bhutan", "Bolivia", "Bosnia and Herzegovina", "Botswana", "Bouvet Island", 
    "Brazil", "Brunei Darussalam", "Bulgaria", 
    "Burkina Faso", "Burundi", "Cambodia", "Cameroon", "Cape Verde", "Cayman Islands", 
    "Central African Republic", "Chad", "Chile","Canada", "China", "Christmas Island",
     "Cocos Islands", "Colombia", "Comoros", "Congo", "Cook Islands",
      "Costa Rica", "Croatia", "Cuba", "Cyprus", "Czech Republic",
       "Denmark", "Djibouti", "Dominica", "Dominican Republic", "East Timor", 
       "Ecudaor", "Egypt", "El Salvador", "Equatorial Guinea", "Eritrea",
        "Estonia", "Ethiopia", "Faroe Islands",
         "Fiji", "Finland", "France", "France,Metropolitan", "French Guiana", 
         "French Polynesia", "French Southern", "Gabon", "Gambia", 
         "Georgia", "Germany", "Ghana", "Gibraltar", "Greece", "Greenland", "Grenada",
          "Guadeloupe", "Guam", "Guatemala", "Guinea", "Guinea-Bissau", "Guyana", "Haiti",
           "Honduras", "Hong Kong", "Hungary", "Iceland",
            "India", "Indonesia", "Iran", "Iraq", "Ireland",
             "Italy", "Ivory Coast", "Jamaica", "Japan", "Jordan", "Kazakhstan", "Kenya", 
             "Kiribati", "Korea", 
             "Kuwait", "Kyrgyzstan",  "Latvia", "Lebanon",
              "Lesotho", "Liberia", "Libyan Arab Jamahiriya", "Liechtenstein", "Lithuania",
              "Luxembourg", "Macau", "Macedonia", "Madagascar", "Malawi", "Malaysia", "Maldives", 
              "Mali", "Malta", "Marshall Islands", "Martinique", "Mauritania", "Mauritius", "Mayotte",
               "Mexico", "Moldova", "Monaco", "Mongolia", "Montserrat", "Morocco", "Mozambique", 
               "Myanmar", "Namibia", "Nauru", "Nepal", "Netherlands", "Netherlands Antilles", 
               "New Caledonia", "New Zealand", "Nicaragua", "Niger", "Nigeria", "Niue", 
               "Norfork Island", "Northern Mariana Islands", "Norway", "Oman", "Pakistan", "Palau",
                "Panama", "Papua New Guinea", "Paraguay", "Peru", "Philippines", "Pitcairn", "Poland",
                 "Portugal", "Puerto Rico", "Qatar", "Reunion", "Romania", "Russian Federation",
                  "Rwanda", "Saint Kitts and Nevis", "Saint Lucia", "Samoa", "San Marino", "Sao Tome", "Saudi Arabia", "Senegal", "Seychelles", "Slovakia", "Slovenia", "Solomon Islands", "Somalia", "South Africa", "South Georgia", "Spain", "Sri Lanka", "St. Helena", "Sudan", "Suriname",  "Swaziland", "Sweden", "Switzerland", "Syrian Arab Republic", "Taiwan", "Tajikistan", "Tanzania", "Thailand", "Togo", "Tokelau", "Tonga", "Trinidad and Tobago", "Tunisia", "Turkey", "Turkmenistan", "Tuvalu", "Uganda", "Ukraine", "United Arab Emirates", "United Kingdom", "Uruguay", "Uzbekistan", "Vanuatu", "Vatican City State", "Venezuela", "Vietnam", "Virigan Islands(British)", "Virgin Islands (U.S.)",  "Western Sahara", "Yemen", "Yugoslavia", "Zaire", "Zambia", "Zimbabwe"]
;




void bottomSheet(context,Widget wid) {
    showModalBottomSheet(
    useRootNavigator: true,
    isScrollControlled: true,
    
    backgroundColor: Colors.white,
      context: context,
      builder: (BuildContext bc) {
        return Container(
          decoration: BoxDecoration(
//color: Colors.transparent,
borderRadius: BorderRadius.circular(80)

          ),
        child:wid ,
        
        
        );});
        }



void bottomSheetNoScroll(context,Widget wid) {
    showModalBottomSheet(
    useRootNavigator: true,
    
    isScrollControlled: false,
    
    backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext bc) {
        return Container(
          decoration: BoxDecoration(

borderRadius: BorderRadius.circular(80)

          ),
        child:wid ,
        
        
        );});
        }





void bottomSheethalf(context,Widget wid) {
    showModalBottomSheet(
    useRootNavigator: false,
    isScrollControlled: true,
   // shape: ShapeBorder.lerp(a, b, t),
    
    backgroundColor: Colors.white,
      context: context,
      builder: (BuildContext bc) {
        return Container(
          height: 400,
            decoration: BoxDecoration(

borderRadius: BorderRadius.circular(80)

            ),
          child:wid ,
          
          
          );}
        
        
        
        );
        }



Map<String,bool> types ={

"Coastal" : false,
"Honeymoon" : false,
"Religous" : false,
"Discovery" : false,
"Ancient" : false,
"Ski" : false,





};


