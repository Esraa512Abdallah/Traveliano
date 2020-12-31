import 'package:flutter/material.dart';
import './page2.dart';

class Page1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Page1State();
  }
}

class Page1State extends State<Page1> {
  String data;
  bool _btnEnabled = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(color: Colors.white),
          ),
          Container(
            padding: EdgeInsets.all(25),
            alignment: Alignment.center,
            child: TextFormField(
              autofocus: false,
              onChanged: (String txt) {
                if(txt.length > 0)
                {
                  setState(() {
                    _btnEnabled = true;
                  });
                }
                else
                {
                  setState(() {
                    _btnEnabled = false;
                  });
                }
                print(_btnEnabled);
                return;
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white54,
                // focusColor: Colors.black,
                labelText: 'Name',
                labelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 22,
                ),
                hintText: 'Ex: Adriana',
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: RaisedButton(
              padding: EdgeInsets.all(5),
              child: Text(
                'Next',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(22.0),
              ),
              color: Colors.blue,
              onPressed: _btnEnabled
                  ? () {
                      Navigator.push(context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation)=>Page2(),
   transitionDuration: Duration(milliseconds: 700),
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
          
            );
                            }
                  : null,
            ),
            alignment: Alignment.bottomRight,
          )
        ],
      ),
    );
  }
}
