import 'package:flutter/painting.dart';
import'package:flutter/material.dart';



class newpaint2 extends StatefulWidget {


  @override
  newpaint2State createState() => newpaint2State();
}

class  newpaint2State extends State<newpaint2> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AppBar(
          iconTheme: new IconThemeData(color: Colors.green),


          title: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text("Traveliano",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                      fontFamily: 'Comfortaa')),
              Text(
                "Add New Resturant ",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 10,
                    fontWeight: FontWeight.w300,
                    fontFamily: 'Comfortaa'),
              ),
            ],
          ),

          centerTitle: true, backgroundColor: Colors.white,
        ),
        preferredSize: Size.fromHeight(80),
      ),
      body: Column(
        children: <Widget>[
          CustomPaint(



            painter: GreyPainter(),

            child: Container(),

          ),
      
      
      
      
      
      
      
        ],
      ),


    );
  }

}





class GreyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final height = size.height;
    final width = size.width;
    Paint paint = Paint();

    Path mainBackground = Path();
    mainBackground.addRect(Rect.fromLTWH(0,0,width,height));
    paint.color = Colors.grey[300];
    canvas.drawPath(mainBackground, paint);

    Path ovalPath = Path();
    ovalPath.moveTo(width * 0.6, 0);

    ovalPath.quadraticBezierTo(
        width * 0.45, height * 0.25, width , height * 0.3);

    ovalPath.quadraticBezierTo(width * 0.58, height * 0.8, width * 0.1, height);

    ovalPath.lineTo(0, height);

    ovalPath.close();

    paint.color = Colors.blueGrey[200];

    canvas.drawPath(ovalPath, paint);
    /*******************************************************/
    Path ovalPath2 = Path();
    ovalPath2.moveTo(width * 0.5, 0);

    ovalPath2.quadraticBezierTo(
        width * 0.45, height * 0.25, width , height * 0.2);

    ovalPath2.quadraticBezierTo(width * 0.58, height * 0.8, width * 0.1, height);

    ovalPath2.lineTo(0, height);

    ovalPath2.close();

    paint.color = Colors.blue;

    canvas.drawPath(ovalPath2, paint);


    /****************************************************/
    Path ovalPath3 = Path();
    ovalPath3.moveTo(width * 0.4, 0);

    ovalPath3.quadraticBezierTo(
        width * 0.45, height * 0.25, width , height * 0.1);

    ovalPath3.quadraticBezierTo(width * 0.58, height * 0.8, width * 0.1, height);

    ovalPath3.lineTo(0, height);

    ovalPath3.close();

    paint.color = Colors.blueGrey[200];

    canvas.drawPath(ovalPath3, paint);

    /********************************************/
    Path ovalPath4 = Path();
    ovalPath4.moveTo(width * 0.3, 0);

    ovalPath4.quadraticBezierTo(
        width * 0.45, height * 0.25, width , height * 0);

    ovalPath4.quadraticBezierTo(width * 0.58, height * 0.8, width * 0.1, height);

    ovalPath4.lineTo(0, height);

    ovalPath4.close();

    paint.color = Colors.blueGrey[100];

    canvas.drawPath(ovalPath4, paint);

    /********************************************/
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}