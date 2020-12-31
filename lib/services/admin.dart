import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:traveliano/adminScreens/tourismPlaces.dart';
import 'package:traveliano/adminScreens/tourismplace/allTourismPlaces.dart';
import 'package:traveliano/models/Comment.dart';
import 'package:traveliano/models/city.dart';
import 'package:traveliano/models/experience.dart';
import 'package:traveliano/models/hotel.dart';
import 'package:traveliano/models/notification.dart';
import 'package:traveliano/models/restuarant.dart';
import 'package:traveliano/models/tourismplace.dart';
import 'package:traveliano/models/user.dart';
import 'package:traveliano/services/user.dart';

class admin_ser {
Comment  convertSnapComment(DocumentSnapshot comment){
Comment _comment=new Comment();
_comment.comment=comment.data["comment"];
Timestamp date =comment.data["timestamp"];
_comment.timestamp=date.toDate();
_comment.userId=comment.data["userId"];

return _comment;
}

City convertSnapToCity(DocumentSnapshot snap)
{
City city=new City();

city.Country=snap.data['country'];
city.Id=snap.documentID;
city.Name=snap.data['Name'];
city.longtude=double.parse(snap.data['longitude'].toString());
city.latitude=double.parse(snap.data['latitude'].toString());
city.maxBudget=snap.data['maxBudget'];
city.minBudget=snap.data['minBudget'];
city.Travelwith=snap.data['travelWith'];
city.info=snap.data['info'];

city.rate=double.parse(snap.data['rate'].toString());


city.Id=snap.documentID;

city.recommended_Type=snap.data['recommendedType'];
city.recommended_Weather=snap.data['recommendedWeather'];

return city;
}

Hotel convertSnapToHotel(DocumentSnapshot snap){
Hotel hotel=new Hotel();

hotel.services= Map<String,bool>.from(snap.data["services"]) ;
hotel.Name= snap.data["Name"];
hotel.rate=snap.data["rate"];
hotel.cityId=snap.data["cityId"];
hotel.latitude=snap.data["latitude"];
hotel.longtude=snap.data["longitude"];
hotel.maxPrice=snap.data["maxPrice"];
hotel.minPrice=snap.data["minPrice"];
hotel.photo=snap.data["photo"];
//hotel.services=Map<String, bool>.from(snap.data["services"] );
hotel.Id=snap.documentID;

return hotel;

}
Hotel convertSnapToHotel2(DocumentSnapshot snap){
Hotel hotel=new Hotel();

hotel.Name= snap.data["Name"];
hotel.rate=snap.data["rate"];
hotel.cityId=snap.data["cityId"];
hotel.latitude=snap.data["latitude"];
hotel.longtude=snap.data["longitude"];
hotel.maxPrice=snap.data["maxPrice"];
hotel.minPrice=snap.data["minPrice"];
hotel.photo=snap.data["photo"];
//hotel.services=Map<String, bool>.from(snap.data["services"] );
hotel.Id=snap.documentID;

return hotel;

}
TourismPlace convertSnapToTourismPlace(DocumentSnapshot snap){
TourismPlace tourismPlace=new TourismPlace();

tourismPlace.Name= snap.data["Name"];
tourismPlace.rate=snap.data["rate"];
tourismPlace.cityId=snap.data["cityId"];
tourismPlace.latitude=snap.data["latitude"];
tourismPlace.longtude=snap.data["longitude"];
tourismPlace.cost=snap.data["Cost"];

tourismPlace.photo=snap.data["photo"];
tourismPlace.description=snap.data["Description"];
tourismPlace.Id=snap.documentID;

return tourismPlace;

}

Restuarant convertSnapToRestaurant(DocumentSnapshot snap){
Restuarant restuarant=new Restuarant();

restuarant.Name= snap.data["Name"];
restuarant.rate=snap.data["rate"];
restuarant.cityId=snap.data["cityId"];
restuarant.latitude=snap.data["latitude"];
restuarant.longtude=snap.data["longitude"];
restuarant.cost=snap.data["Cost"];

restuarant.photo=snap.data["photo"];
restuarant.foodType=snap.data["foodType"];
restuarant.Id=snap.documentID;

return restuarant;

}

User convertSnapToUser(DocumentSnapshot snap)
{
User user=new User();

user.firstName=snap.data["firstName"];
user.lastName=snap.data["lastName"];
user.hometown=snap.data["hometown"];
user.Id=snap.documentID;
user.Photo=snap.data["photo"];

//user.birthday=DateTime.parse(snap.data["birthday"].toString());

//user.age=DateTime.now().year-user.birthday.year;


return user;
}

notification convertSnapToNotification(DocumentSnapshot snap)
{
notification noti= new notification();

noti.visited=snap.data['visited'];
noti.body=snap.data["body"];
noti.type=snap.data["type"];
noti.userModel=User();

noti.userModel.Id=snap.data['userId'];
noti.timestamp=snap.data['timestamp'].toDate();
noti.Id=snap.documentID;
if(noti.type!='follow'){

noti.expId=snap.data["experienceId"];

}

return noti;



}

void changePassword(String password) async{
   //Create an instance of the current user. 
    FirebaseUser user = await FirebaseAuth.instance.currentUser();

    //Pass in the password to updatePassword.
    user.updatePassword(password).then((_){
      print("Succesfull changed password");
    }).catchError((error){
      print("Password can't be changed" + error.toString());
      //This might happen, when the wrong password is in, the user isn't found, or if the user hasn't logged in recently.
    });
  }

Experience convertSnapToExperince(DocumentSnapshot snap)
{
Experience experience =Experience();


experience.Id=snap.documentID;
experience.cityId=snap.data["cityid"];
experience.budget=int.parse(snap.data["budget"].toString());
Timestamp exDate=snap.data["timestamp"];
Timestamp from=snap.data["startdate"];
Timestamp to=snap.data["enddate"];
experience.hide=snap.data["hide"];
experience.status=snap.data["status"];
experience.ExDate=exDate.toDate();
experience.From=from.toDate();
experience.rate=double.parse(snap.data["rate"].toString()).roundToDouble();
experience.To=to.toDate();

experience.userId=snap.data["userid"];
experience.description=snap.data["description"];

experience.reccommendedType=snap.data["reccommendedType"];
experience.reccommendedWeather=snap.data["reccommendeWeather"];

return experience;
}

Future updateExperience(Experience exp)
async {
var doc=await Firestore.instance.collection("Experience").document(exp.Id).get();


if(doc.data['cityid']!=exp.cityId){
//var city=await Firestore.instance.collection("Cities").document(exp.cityId).get();
  Map _list,_list2;
  await Firestore.instance
      .collection("Cities")
         .document(
   doc.data['cityid'])
      .get()
    .then((doc) {
          _list = doc.data["weather"];
          _list2=doc.data["type"];
        });
        _list.forEach((key, value) {
          if (key ==
              doc.data[
                  'reccommendedWeather']) {
            _list[key] =
                _list[key] - 1;
          }
        });
                                       _list2.forEach((key, value) {
          if (key ==
              doc.data['reccommendedType']) {
            _list2[key] =
                _list2[key] - 1;
          }
        });
        Firestore.instance
            .collection("Cities")
            .document(
            doc.data['cityid'])
            .updateData(
                {"weather": _list
                ,
                "type":_list2
                });
////////////////////Add rate to new city



 Map _list3,_list4;
  await Firestore.instance
      .collection("Cities")
         .document(
   exp.cityId)
      .get()
    .then((doc) {
          _list3 = doc.data["weather"];
          _list4=doc.data["type"];
        });
        _list3.forEach((key, value) {
          if (key ==
             exp.reccommendedWeather) {
            _list3[key] =
                _list3[key] + 1;
          }
        });
                                       _list4.forEach((key, value) {
          if (key ==
            exp.reccommendedType) {
            _list4[key] =
                _list4[key] + 1;
          }
        });
        Firestore.instance
            .collection("Cities")
            .document(
           exp.cityId)
            .updateData(
                {"weather": _list3
                ,
                "type":_list4
                });







//await Firestore.instance.collection("Cities").document(exp.cityId)
//.updateData(data);






}else{



if(doc.data["reccommendedWeather"]!=exp.reccommendedWeather)
{
Map _lis;
  await Firestore.instance
      .collection("Cities")
         .document(
   exp.cityId)
      .get()
    .then((doc) {
          _lis = doc.data["weather"];
        });
        _lis.forEach((key, value) {
          if (key == exp.reccommendedWeather) {

            _lis[key] =_lis[key] + 1;
          } 
           if (key == doc.data["reccommendeWeather"].toString()) {

            _lis[key] = _lis[key] - 1;
          }
        });
        
        Firestore.instance
            .collection("Cities")
            .document(
           exp.cityId)
            .updateData(
                {"weather": _lis
                });

}
if(doc.data["reccommendedType"]!=exp.reccommendedType)
{
Map _li5;
  await Firestore.instance
      .collection("Cities")
         .document(
   exp.cityId)
      .get()
    .then((doc) {
          _li5 = doc.data["type"];
        });
        
        _li5.forEach((key, value) {
          if (key == exp.reccommendedType) {

            _li5[key] =_li5[key] + 1;
          } else
           if (key == doc.data["reccommendedType"]) {
             
            _li5[key] = _li5[key] - 1;
          }
        });
        
        Firestore.instance
            .collection("Cities")
            .document(
           exp.cityId)
            .updateData(
                {"type": _li5
                });
}










}
return await Firestore.instance.collection("Experience").document(exp.Id)
.updateData({


"cityid":exp.cityId,

"budget":exp.budget,
"startdate":exp.From,
'enddate':exp.To,
'status':exp.status,
'reccommendedType':exp.reccommendedType,


'reccommendeWeather':exp.reccommendedWeather,

'description':exp.description


});







}

City convertSnapToCityF(DocumentReference docRef)
{
City city=new City();
//DocumentSnapshot snapshot;
docRef.get().then((snapshot){

  
city.Country=snapshot.data['country'];
city.Name=snapshot.data['Name'];
//city.longtude=double.parse(snapshot.data['longitude'].toString());
//city.latitude=double.parse(snapshot.data['latitude'].toString());
/* city.maxBudget=snapshot.data['maxBudget'];
city.minBudget=snapshot.data['minBudget'];
city.Travelwith=snapshot.data['travelWith'];
city.info=snapshot.data['info'];
city.rate=double.parse(snapshot.data['rate'].toString());
city.Id=snapshot.documentID;
city.recommended_Type=snapshot.data['recommendedType'];
city.recommended_Weather=snapshot.data['recommendedWeather'];
 */

});
return city;

}

 Future<DocumentSnapshot> getDocumentSnapshot(String CollectionName,String DocumentId) async {

DocumentSnapshot result;
await Firestore.instance.collection(CollectionName).document(DocumentId).
snapshots().single.then((doc){result=doc;});

return result;
}

getUsersStream() async {


return  Firestore.instance.collection("Users").snapshots();

}

getCitiesStream() async {


return Firestore.instance.collection("Cities").snapshots();

}

getExperienceStream() async {


  return  Firestore.instance.collection("Experience").snapshots();

}

getHotelsStream(){


return Firestore.instance.collection("accommodation").snapshots();

}

getRestaurantsStream(){


return Firestore.instance.collection("Restaurants").snapshots();

}

getTourismPlacesStream(){


return Firestore.instance.collection("tourismPlaces").snapshots();

}

deleteDocument(String id,String collectionName){

Firestore.instance.collection(collectionName).document(id).delete();

}

Future<List<int>> getRateUsers(String collection,String documentId) async {
var count = 0 ;
    var list_rate =[1,2,3,4,5];
    List<int> rates =[] ;
  await  Firestore.instance.collection(collection)
    .document(documentId).collection("Rates").
     getDocuments().then((docs){

      for(int x = 0 ; x < list_rate.length ; x++)
      {

        for(var document in docs.documents)
        {
          if(list_rate[x]== document.data['rate'])
          {
            count++;

          }

        }
        rates.add( count );

        count = 0 ;

      }
    


    });
 return rates;
}

addTourismPlace(TourismPlace tourismplace)async{

await Firestore.instance.collection("tourismPlaces")
.document().setData({
      'Name': tourismplace.Name,
      'Description' :tourismplace.description,
      "cityId":tourismplace.cityId,
      'Cost': tourismplace.cost,
      'rate': 0.0,
      'latitude':tourismplace.latitude,
      'longitude':tourismplace.longtude,
      "photo":tourismplace.photo


 });
                


}

  addRestuarant(Restuarant _restaurant) async {

await Firestore.instance
.collection("Restaurants")
.document().setData({
      'Name': _restaurant.Name,
      'foodType': _restaurant.foodType,
      'cityId': _restaurant.cityId,
      'Cost': _restaurant.cost,
      'rate': _restaurant.rate,
      'latitude': _restaurant.latitude,
      'longitude': _restaurant.longtude,
      "photo":_restaurant.photo
  
    });


  }

  addHotel(Hotel hotel) async {
    hotel.rate = 0;

    
await Firestore.instance
.collection("accommodation")
.document().setData({
      'Name': hotel.Name,
      "cityId":hotel.cityId,
      'minPrice': hotel.minPrice,
      'maxPrice': hotel.maxPrice,
      'rate': hotel.rate,
      'latitude': hotel.latitude,
      'longitude': hotel.longtude,
  'photo':hotel.photo,
  'services':hotel.services
    });

  }

  void addCity(City city) async {


/*
var UserRate =await Firestore.instance.collection("Experince")
.document("ExperienceID")
.collection("Rate").document("Connected user id ").get();


**/


    var data = {
      "longitude": city.longtude,
      "latitude": city.latitude,
      
      "Name": city.Name,
      "maxBudget": city.maxBudget,
      "minBudget": city.minBudget,
      "travelWith": city.Travelwith,
      "recommendedWeather": city.recommended_Weather,
      "recommendedType": city.recommended_Type,

"country": city.Country,
      "info": city.info,
      "rate": city.rate,
      "photo":city.photo,
      "weather":{"Winter":0,"Spring":0,"Summer":0,"Autumn":0}
    ,  'type':{"Coastal":0,"Ski":0,"Honeymoon":0,"Historic":0,"Religous":0,"Discovery":0},
      
  
    };
String id;
    await Firestore.instance
        .collection("Cities")
        .add(data)
        .then((DocumentReference x) {
      id=x.documentID;
    



    });





  
//print(db.uid);
  }

  dynamic addCityID(City city) async {
    var data = {
      "longitude": city.longtude,
      "latitude": city.latitude,

      "Name": city.Name,
      "maxBudget": city.maxBudget,
      "minBudget": city.minBudget,
      "travelWith": city.Travelwith,
      "recommendedWeather": city.recommended_Weather,
      "recommendedType": city.recommended_Type,

      "country": city.Country,
    "photo":city.photo,
    'type':{"Coastal":0,"Ski":0,"Honeymoon":0,"Historic":0,"Religous":0,"Discovery":0},
      "weather":{"Winter":0,"Spring":0,"Summer":0,"Autumn":0},
      "info": city.info,
      "rate": city.rate
    };

    await Firestore.instance
        .collection("Cities")
        .add(data)
        .then((DocumentReference x) {
      city.Id = x.documentID.toString();
    });
//print(db.uid);

    return city.Id;
  }

Future getCity_Places(String CityId,String PlaceCol) async {

return await Firestore.instance.collection(PlaceCol)
.where("cityId",isEqualTo: CityId).getDocuments();


}

SearchStream(dynamic text,String CollectionName,String AttributeName)  {
   return  Firestore.instance.collection(CollectionName).
                where(AttributeName,isGreaterThanOrEqualTo:text).snapshots();

}
}
