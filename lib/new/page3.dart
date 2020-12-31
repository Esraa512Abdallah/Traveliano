import 'package:flutter/material.dart';
import './page4.dart';

class Page3 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Page3State();
  }
}

class Page3State extends State<Page3> {
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
            decoration: BoxDecoration(color: Colors.green),
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
                focusColor: Colors.black,
                labelText: 'Name3',
                labelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 24,
                ),
                hintText: 'Adriana',
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
                          MaterialPageRoute(builder: (context) => Page4()));
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
