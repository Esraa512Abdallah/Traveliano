import 'package:flutter/painting.dart';
import'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:traveliano/HOMEPAGE/homePage.dart';
import 'package:traveliano/adminScreens/city/citytry.dart';



class newpaint3 extends StatefulWidget {


  @override
  newpaint3State createState() => newpaint3State();
}

class  newpaint3State extends State<newpaint3> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: CustomPaint(



            painter: LogoPainter(),
            size: Size.fromHeight(650),
            

        
          
        ),
//appBar: AppBar(),

    );
  }

}




class LogoPainter extends CustomPainter {
@override
void paint(Canvas canvas, Size size) {

  Paint paint = Paint();
  paint.color = Colors.purpleAccent[100];
  var path = Path();


  path.lineTo(0, size.height*0.3);
  path.lineTo(size.width / 1.2, size.height*0.4);

   path.relativeQuadraticBezierTo(10, 2, 22, -5);

   path.lineTo(size.width, size.height*0.3);
   path.lineTo(size.width, 0);

  path.close();
  canvas.drawPath(path, paint);
}

@override
bool shouldRepaint(CustomPainter oldDelegate) {
  return true;
}
}
