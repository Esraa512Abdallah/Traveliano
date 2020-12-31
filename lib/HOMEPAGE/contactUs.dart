import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
//import 'package:mailer/mailer.dart';
//import 'package:mailer/smtp_server/gmail.dart';

class contact extends StatefulWidget {
  contact({Key key}) : super(key: key);

  @override
  _contactState createState() => _contactState();
}

class _contactState extends State<contact> {
GlobalKey<FormState> _key=GlobalKey<FormState>();
GlobalKey<ScaffoldState> _keyy=GlobalKey<ScaffoldState>();
String title,des;
bool load=false;



  bool error=false;


  @override
  Widget build(BuildContext context) {


    return Scaffold(
key: _keyy,
     appBar: AppBar(title: Text("Contact Us"),
      backgroundColor: Colors.indigo[200],
      
      ),
floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
floatingActionButton:load==false? FloatingActionButton(
  
  
  
  child: Icon(Icons.send),
  
  
  
  
  onPressed: ()
  async {

if(_key.currentState.validate()){
/* 
_key.currentState.save();




String username = 'khaledkiki2222@gmail.com';
  String password = '9988770000';
  final smtpServer = gmail(username, password);
  final message = Message()
    ..from = Address("khaledkiko2222@gmail.com", 'khaled')
    ..subject = "fffffffffffffffff"
    ..text = "kkkkkkkkkkkkkkkkkkkkkkkkkk";
setState(() {
  load=true;
});



 try {
    final sendReport = await send(message, smtpServer);
    print('Message sent: ' + sendReport.toString());
    setState(() {
  load=false;
});

_keyy.currentState.showSnackBar(
  
SnackBar(content: Text("Thanks for contacting us, Traveliano team is reviewing  your problems ,you will be answered soon "),duration: Duration(seconds: 8),), 


);
  } on MailerException catch (e) {
        setState(() {
  load=false;

});
_keyy.currentState.showSnackBar(
  
SnackBar(content: Text("Oops, Sending Failed . try again later"),duration: Duration(seconds: 4),), 


);
    print('Message not sent.');
    for (var p in e.problems) {
      print('Problem: ${p.code}: ${p.msg}');
    }
  }


} */



}
}
  
  
  ,):null,

          body: Container(
         child: load==false?Form(key: _key,
                    child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: <Widget>[



    Text(" What problems do you face ? ",
                      
                          textAlign: TextAlign.center,
                      
                          style:TextStyle(color:Colors.black,
                      
                          
                      
                          fontSize: 20,
                      
                          
                      
                          fontWeight: FontWeight.w800)
                          ),



                              Padding(
                      padding: const EdgeInsets.only(bottom: 15,top:50,left: 10,right: 10),
                      child: TextFormField(
                   //     initialValue: new_city.Name,
                        validator: (val) {
                          if (val.length == 0) return "Title is required !!!";
                        },
    
                        onSaved: (val) {
        //       new_city.Name = val;
        title=val;
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
    
                          labelText: 'Title',
    
                          hintText: "Enter your problem title.....",
    
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
                      padding: const EdgeInsets.only(bottom: 15,top:0,left: 10,right: 10),
                      child: TextFormField(
                   //     initialValue: new_city.Name,
                        validator: (val) {
                          if (val.length == 0) return "Description is required !!!";
                        },
    
                        onSaved: (val) {
        //       new_city.Name = val;
        des=val;
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
    maxLines: 6,
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
    
                          hintText: "Enter your problem description.....",
    
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

],



             
           ),
         ):Container(
child: Center(child: 
SpinKitFadingCircle(color: Colors.blue, size: 100,)),

         ),
      ),
    );
  }
} 