import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:reviews_slider/reviews_slider.dart';
import 'package:traveliano/globals.dart';
import 'package:traveliano/models/experience.dart';
import 'package:traveliano/services/admin.dart';

class editExp extends StatefulWidget {
  
  Experience exp=new Experience();
  editExp({this.exp});

  @override
  _editExpState createState() => _editExpState();
}

class _editExpState extends State<editExp> {
  final _formKey = new GlobalKey<FormState>();

  int radio1=1,radio2=1;



@override
  void initState() {
    // TODO: implement initState
    if(widget.exp.reccommendedWeather=="Winter")radio1=1;
    else if(widget.exp.reccommendedWeather=="Summer")radio1=2;
    else if(widget.exp.reccommendedWeather=="Autumn")radio1=3;
    else if(widget.exp.reccommendedWeather=="Spring")radio1=4;
    

 if(widget.exp.reccommendedType=="Coastal")radio2=1;
    else if(widget.exp.reccommendedType=="Ski")radio2=2;

   else if(widget.exp.reccommendedType=="Honeymoon")radio2=3;
   else if(widget.exp.reccommendedType=="Historic")radio2=4;
   else if(widget.exp.reccommendedType=="Religous")radio2=5;
   else if(widget.exp.reccommendedType=="Discovery")radio2=6;



  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
floatingActionButton: FloatingActionButton(
  heroTag: "kjklj",
  
  child: Icon(Icons.navigate_next,size: 45,),backgroundColor: Colors.red[300],
onPressed: (){

if(_formKey.currentState.validate()){

_formKey.currentState.save();

 bottomSheet(context, SpinKitRipple(color: Colors.indigo,size: 150,));
admin_ser().updateExperience(widget.exp);
Navigator.pop(context);Navigator.pop(context);
//this.dispose();

}


}

),

      
          body: Container(height: MediaQuery.of(context).size.height,
         child: ListView(

children: <Widget>[


   Form(
                    key: _formKey,
                    child: Container(height: 350,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          //Text("Add Exoerince",textAlign: TextAlign.left,style: TextStyle(color: Colors.white,fontSize: 20),),
                          /////////////////////////
                           Container(
                            width: MediaQuery.of(context).size.width / 1.1,
                            child: _SlectCity(),
                          ), 
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 2 - 30,
                                child: DateTimeField(initialValue: widget.exp.From,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(5),
                                    filled: true,
                                    fillColor: Colors.white54,
                                    // focusColor: Colors.black,
                                    labelText: 'From',
                                    labelStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 18,
                                    ),
                                  ),
                                  format: DateFormat("yyyy-MM-dd"),
                                  onSaved: (val) {
                              widget.exp.From = val;
                                  },
                                  onChanged: (val){

  
setState(() {
                                 widget.exp.From = val;
 

});
                                  },
                                  onShowPicker: (context, currentValue) {
                                    return showDatePicker(
                                        context: context,
                             firstDate: DateTime(1900),
              initialDate: widget.exp.To,
                       lastDate: widget.exp.To!=null? widget.exp.To:DateTime.now(),
                                        
                                        );
                                  },
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 2 - 30,
                                child: DateTimeField(initialValue: widget.exp.To,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(5),
                                    filled: true,
                                    fillColor: Colors.white54,
                                    // focusColor: Colors.black,
                                    labelText: 'To',
                                    labelStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 18,
                                    ),
                                  ),
                                  format: DateFormat("yyyy-MM-dd"),
                                  onSaved: (val) {
                        widget.exp.To = val;
                                  },
                                      onChanged: (val){
setState(() {
  
                               widget.exp.To = val;
 
});
  

                                  },
                                  onShowPicker: (context, currentValue) {
                                    return showDatePicker(
                                        context: context,
              firstDate: DateTime(1900),
                                        initialDate:widget.exp.From,
                                        lastDate: DateTime.now());
                                  },
                                ),
                              ),
                            ],
                          ),

                          
                          Container(
                            width: MediaQuery.of(context).size.width / 1.1,
                            height: 50,
                          child:
                           TextFormField(
                             initialValue: widget.exp.budget.toString(),
                              autofocus: false,
                              keyboardType: TextInputType.number,
                              onSaved: (String value) {
                             widget.exp.budget = int.parse(value);
                              },
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(5),
                                filled: true,
                                suffixText: '\$',
                                fillColor: Colors.white54,
                                // focusColor: Colors.black,
                                labelText: 'Budget',
                                labelStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                                hintText: 'Ex: 2500\$',
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 1.1,
                            child: TextFormField(
                              autofocus: false,
                              initialValue: widget.exp.description,
                              keyboardType: TextInputType.multiline,
                              maxLines: 6,
                              onSaved: (val) {
                         widget.exp.description = val;
                              },
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white54,
                                // focusColor: Colors.black,
                                labelText: 'Description',
                                labelStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),

                   
                        ],
                      ),
                    ),
                  )




,


                           Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(width: MediaQuery.of(context).size.width/2.2,
                                          child: RadioListTile(
                              
                              title:Text("Winter",style: TextStyle(fontWeight: FontWeight.w500,color:Colors.cyan)  ) ,
                              value: 1, groupValue: radio1, onChanged: (val){


           setState(() {
             widget.exp.reccommendedWeather="Winter";

                          radio1=val;
                        });

                            }),
                          ),
                      
                               SizedBox(width: MediaQuery.of(context).size.width/2.2,
                                          child: RadioListTile(
                              
                              title:Text("Summer",style: TextStyle(fontWeight: FontWeight.w500,color:Colors.cyan)) ,
                              value: 2, groupValue: radio1, onChanged: (val){ 



                                         setState(() {
                                            widget.exp.reccommendedWeather="Summer";
             
                          radio1=val;
                        });
                              }),
                          ),
                      
                      
                        ],
                      )

        ,    Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(width: MediaQuery.of(context).size.width/2.2,
                                          child: RadioListTile(
                              
                              title:Text("Autumn",style: TextStyle(fontWeight: FontWeight.w500,color:Colors.cyan)  ) ,
                              value: 3, groupValue: radio1, onChanged: (val){


           setState(() {
                          radio1=val;
                           widget.exp.reccommendedWeather="Autumn";
             
                        });

                            }),
                          ),
                      
                               SizedBox(width: MediaQuery.of(context).size.width/2.2,
                                          child: RadioListTile(
                              
                              title:Text("Spring",style: TextStyle(fontWeight: FontWeight.w500,color:Colors.cyan)) ,
                              value: 4, groupValue: radio1, onChanged: (val){ 



                                         setState(() {
                                            widget.exp.reccommendedWeather="Spring";
             
                          radio1=val;
                        });
                              }),
                          ),
                      
                      
                        ],
                      )
,  ReviewSlider(
          onChange: (int val){
           if(val==0){
             widget.exp.status="Terrible";
           }else if(val==1)
           {
      
              widget.exp.status="Bad";
           }else if(val==2){
      
       widget.exp.status="Okay";
      
      
           }else if(val==3){
       widget.exp.status="Good";
      
           }else if(val==4){
      
       widget.exp.status="Great";
      
           }
          },
          options: ['Terrible', 'Bad', 'Okay', 'Good', 'Great'],
          initialValue: 
          
           widget.exp.status=='Terrible'?  0
           :
           widget.exp.status=='Bad'?  1 
           :
           widget.exp.status=='Okay'? 2
           :
           widget.exp.status=='Good'? 3
           :4
          
      
          )
,Divider(height: 2,),

 Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(width: MediaQuery.of(context).size.width/2.2,
                                          child: RadioListTile(
                              
                              title:Text("Coastal",style: TextStyle(fontWeight: FontWeight.w500,color:Colors.cyan)  ) ,
                              value: 1, groupValue: radio2, onChanged: (val){


           setState(() {
              widget.exp.reccommendedType="Coastal";
             
                          radio2=val;
                        });

                            }),
                          ),
                      
                               SizedBox(width: MediaQuery.of(context).size.width/2.2,
                                          child: RadioListTile(
                              
                              title:Text("Ski",style: TextStyle(fontWeight: FontWeight.w500,color:Colors.cyan)) ,
                              value: 2, groupValue: radio2, onChanged: (val){ 



                                         setState(() {
                                                widget.exp.reccommendedType="Ski";
                          radio2=val;
                        });
                              }),
                          ),
                      
                      
                        ],
                      )

, Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(width: MediaQuery.of(context).size.width/1.9,
                                          child: RadioListTile(
                              
                              title:Text("Honeymoon",style: TextStyle(fontWeight: FontWeight.w500,color:Colors.cyan)  ) ,
                              value: 3, groupValue: radio2, onChanged: (val){


           setState(() {
                  widget.exp.reccommendedType="Honeymoon";
                          radio2=val;
                        });

                            }),
                          ),
                      
                               SizedBox(width: MediaQuery.of(context).size.width/2.2,
                                          child: RadioListTile(
                              
                              title:Text("Historic",style: TextStyle(fontWeight: FontWeight.w500,color:Colors.cyan)) ,
                              value: 4, groupValue: radio2, onChanged: (val){ 



                                         setState(() {
                                                widget.exp.reccommendedType="Historic";
                          radio2=val;
                        });
                              }),
                          ),
                      
                      
                        ],
                      ), Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(width: MediaQuery.of(context).size.width/2.2,
                                          child: RadioListTile(
                              
                              title:Text("Religous",style: TextStyle(fontWeight: FontWeight.w500,color:Colors.cyan)  ) ,
                              value: 5, groupValue: radio2, onChanged: (val){


           setState(() {
                  widget.exp.reccommendedType="Religous";
                          radio2=val;
                        });

                            }),
                          ),
                      
                               SizedBox(width: MediaQuery.of(context).size.width/2.1,
                                          child: RadioListTile(
                              
                              title:Text("Discovery",style: TextStyle(fontWeight: FontWeight.w500,color:Colors.cyan)) ,
                              value: 6, groupValue: radio2, onChanged: (val){ 



                                         setState(() {
                                                   widget.exp.reccommendedType="Discovery";
                          radio2=val;
                        });
                              }),
                          ),
                      
                      
                        ],
                      ),






















],

         ),
      ),
    );
  }













Widget _SlectCity() {
    return FutureBuilder(
      //  stream: Firestore.instance.collection('Cities').snapshots(),
      future: Firestore.instance.collection("Cities").getDocuments(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
   
   if(!snapshot.hasData){return Text("Loading...");}
    
         
          
            return DropdownButtonFormField<String>(
                //           icon: Icon(Icons.keyboard_arrow_down),
                //         iconEnabledColor: Colors.blue,

                hint: Text(
                  "Traveled To...",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w700),
                ),
                decoration:
                    InputDecoration(filled: true, fillColor: Colors.white54),
                //       disabledHint: Text("Enter City Name..."),
                //     isExpanded: true,
                //   isDense: true,
                value:  widget.exp.cityId,
                onChanged: (String newvale) {
                  setState(() {
                   widget.exp.cityId = newvale;
                  });
                  print(newvale + "#############NEW VALUE");
                },
                items: snapshot.data.documents.map((DocumentSnapshot document) {
                  return DropdownMenuItem<String>(
                    value: document.documentID,
                    child: Text(document.data['Name'].toString()),
                  );
                }).toList());
        
      },
    );
  }






}