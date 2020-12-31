import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:traveliano/models/city.dart';
import 'package:traveliano/adminScreens/location.dart' as location;
import 'package:traveliano/adminScreens/locationpreview.dart' as loca;
import 'package:traveliano/services/admin.dart';
enum DialogAction { yes, abort }

class Dialogs {
  static Future<DialogAction> yesAbortDialog(
    BuildContext context,
String x,
String col
  ) async {
    final action = await showDialog(

      context: context,
   // child: Text("Are You Sure ? "+x),
   //   barrierDismissible: false,
      builder: (BuildContext context) {
       
       
       
     //  loca.MyAppState.latitude=snap.data["latitude"];
       
   //    loca.MyAppState.longitude=snap.data["longitude"];
       
       
       
       
               return AlertDialog( 

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          
          ),
        contentPadding: EdgeInsets.all(0.0),
        title: Column(
          children: <Widget>[
            Text("Are you sure ?",style: TextStyle(color: Colors.red),),
         Divider(),
          ],
        ),
        elevation: 8.0,
      //  semanticLabel: "hi",
         
          content: Text("Warning : all related data will be deleted permently and can't be restored ",
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.w500),
          
          ),
          actions: <Widget>[
            FlatButton(
              onPressed: () => Navigator.of(context).pop(DialogAction.abort),
              child: const Text('Close'),
            ),
            RaisedButton(
              color: Colors.red,
              onPressed: () { 
                
                      admin_ser().deleteDocument(x, col);
                
                Navigator.of(context).pop(DialogAction.yes);
              
              },
              child: const Text(
                'Delete',
               style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        );
      },
    );
    return (action != null) ? action : DialogAction.abort;
  }
}