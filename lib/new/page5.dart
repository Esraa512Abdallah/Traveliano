import 'package:flutter/material.dart';

class Page5 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Page5State();
  }
}

class Page5State extends State<Page5> {
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
                labelText: 'Name',
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
                'Submit',
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
