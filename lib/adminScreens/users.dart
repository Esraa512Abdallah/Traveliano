import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class user extends StatefulWidget {
  @override
  _userState createState() => _userState();
}

String searchtxt=null;
class _userState extends State<user> {


  

  @override
  Widget build(BuildContext context) {
    return Scaffold(



  appBar: PreferredSize(
              child: AppBar(
                bottom: PreferredSize(
                  child: TextFormField(
      cursorWidth: 1.2, obscureText: false,
onChanged: (val){
setState(() {
searchtxt=val;
  
});
},
      //        controller:_TourismPlace_Name,

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
        suffixIcon: Icon(Icons.search,color: Colors.green,),
        filled: true,
      fillColor: Colors.white,
        hintText: "Search for User ...",
        contentPadding: EdgeInsets.all(10),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(20.0),
          gapPadding: 40.0,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white10,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
    )
,
                  preferredSize: Size.fromHeight(30),
                ),
                iconTheme: new IconThemeData(color: Colors.green),
                //   leading: Icon(Icons.filter_list,color: Colors.green,) ,
                actions: <Widget>[],
                title: Text("All Users",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 20,
                        fontWeight: FontWeight.w900)),

                centerTitle: true, backgroundColor: Colors.white,
              ),
              preferredSize: Size.fromHeight(90),
            ),
    








          body: Container(
        child:
StreamBuilder(
  stream:searchtxt==null? Firestore.instance.collection("Users").snapshots() 
 // future:Firestore.instance.collection("Users").getDocuments() :
  :Firestore.instance.collection("Users").where("firstName",isGreaterThanOrEqualTo: searchtxt).snapshots(),
  builder: (BuildContext context, AsyncSnapshot snapshot){

if(!snapshot.hasData){
  return Center(child: CircularProgressIndicator());
}

      return ListView.builder(
        itemCount: snapshot.data.documents.length,
        itemBuilder: (BuildContext context, int index) {
DocumentSnapshot doc=snapshot.data.documents[index];

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
ClipOval(child:snapshot.data.documents[index]["photo"]==null? Image.asset("images/defaultuser.png",width: 50,height: 50,fit: BoxFit.cover,):FadeInImage.assetNetwork(height: 50,width: 50,image: 
snapshot.data.documents[index]["photo"], 
placeholder: "images/load2.gif"

,fit: BoxFit.cover,  )),
                  Text(" "+snapshot.data.documents[index]['firstName'],style: TextStyle(fontSize: 20),), 
                     Text(" "+snapshot.data.documents[index]['lastName'],style: TextStyle(fontSize: 20),),
              
              
              
              
              
              
              
              
              
                ],
              ),
        
        
          Text('ID : '+doc.documentID,style: TextStyle(color: Colors.grey,fontSize: 13),),
        
        
      /*     Row(mainAxisAlignment:MainAxisAlignment.spaceAround,
            children: <Widget>[
              RaisedButton(
                color: Colors.indigo,
                child: snapshot.data.documents[index]['active']?
                Text("Deactivate",style: TextStyle(color: Colors.white),):
                Text("Activate",style: TextStyle(color: Colors.white),),
                onPressed: () async {
DocumentSnapshot x=snapshot.data.documents[index];

 if(snapshot.data.documents[index]['active']){
return


showDialog(context: context, child:
    new AlertDialog(
      title: new Text("Deactivate this account for :"),
      content: new DropdownButton<String>(
        hint: Text("Choose a period..."),
      
  items: <String>['one day', 'two days', 'three days', 'two weeks','month','three month'].map((String value) {
    return new DropdownMenuItem<String>(
      value: value,
      child: new Text(value),
    );
  }).toList(),
  onChanged: (val) async {

if(val=='one day')
{

await Firestore.instance.collection("Users").document(x.documentID)
.updateData({


  "activeDate":DateTime.now().add(Duration(days: 1))
    ,"active":false
    ,"blocked":false
});  
}
else if(val=='two days'){

await Firestore.instance.collection("Users").document(x.documentID)
.updateData({


  "activeDate":DateTime.now().add(Duration(days: 2))
      ,"active":false
    ,"blocked":false
}); 


}else if(val=='three days')
{

await Firestore.instance.collection("Users").document(x.documentID)
.updateData({


  "activeDate":DateTime.now().add(Duration(days: 3))
     ,"active":false
    ,"blocked":false
}); 


}

else if(val=='two weeks'){

await Firestore.instance.collection("Users").document(x.documentID)
.updateData({


  "activeDate":DateTime.now().add(Duration(days: 14))
     ,"active":false
    ,"blocked":false
}); 

}else if(val=='month'){
 await Firestore.instance.collection("Users").document(x.documentID)
.updateData({


  "activeDate":DateTime.now().add(Duration(days: 30))
      ,"active":false
    ,"blocked":false
}); 

}else if(val=='month'){
await Firestore.instance.collection("Users").document(x.documentID)
.updateData({


  "activeDate":DateTime.now().add(Duration(days: 90))
     ,"active":false
    ,"blocked":false
}); 

}

Navigator.pop(context);
  },
)
    )
);
 }
else{


 await Firestore.instance.collection("Users").document(x.documentID)
.updateData({

 "active":true,
});


}



                  
                  },),
        
          RaisedButton(
  
            child: snapshot.data.documents[index]['blocked']?
            Text("Unblock"):Text("Block"),
            onPressed: () async { 
DocumentSnapshot x=snapshot.data.documents[index];
snapshot.data.documents[index]['blocked']? 

await Firestore.instance.collection("Users").document(x.documentID)
.updateData({


  "blocked":false,
  "active":true
})
: await Firestore.instance.collection("Users").document(x.documentID)
.updateData({

 "active":true,
  "blocked":true
});




             },),
        
        
            ],
          ), */
        
        Divider(height: 2,),
        
            ],
          ),
        );
       },
      );
  },
),

      ),
    );
  }
}



