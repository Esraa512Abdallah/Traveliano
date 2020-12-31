import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:traveliano/adminScreens/users.dart';
import 'package:traveliano/services/admin.dart';

class Rates extends StatefulWidget {

 List<int> users = List<int>();

double height =300;
Rates({this.users});
  @override
  _RatesState createState() => _RatesState();
}

class _RatesState extends State<Rates> {
  List<charts.Series> seriesList;
 /* static */  List<charts.Series<Rate, String>> _createRandomData() {
 
 

    var data = [
      Rate("1",widget.users.elementAt(0)),
      Rate("2",widget.users.elementAt(1)),
      Rate("3",widget.users.elementAt(2)),
      Rate("4",widget.users.elementAt(3)),
      Rate("5",widget.users.elementAt(4))
    ];
    return [
      charts.Series<Rate, String>(
     
       
        id: "RAte",
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
        labelAccessorFn: (Rate rate, _) =>('👤${rate.userscount.toString()}'),
        domainFn: (Rate rate, _) => rate.star,
        measureFn: (Rate rate, _) => rate.userscount,
        data: data,
      )
    ];
  }

  barChart() {
    return charts.BarChart(
    
      seriesList,
    flipVerticalAxis: true,
      animate: true,
      vertical:false,
     
      animationDuration: Duration(seconds:2),
      barRendererDecorator: new charts.BarLabelDecorator<String>(),
       
    );
  }


  @override
  Future initState()  {

     seriesList = _createRandomData();
  
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(padding: EdgeInsets.all(5),margin: EdgeInsets.all(0),
        decoration: BoxDecoration(
color: Colors.white,
borderRadius: BorderRadius.circular(50)

        ),
          height: widget.height,
          child: barChart(),
        ),
      );
   
  }
}

class Rate {
  final String star;
  final int userscount;

  Rate(this.star, this.userscount);
}
