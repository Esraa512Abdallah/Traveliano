import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:panorama/panorama.dart';
class imagePreview extends StatefulWidget {
  String imageUrl;
  imagePreview({this.imageUrl});

  @override
  _imagePreviewState createState() => _imagePreviewState();
}

class _imagePreviewState extends State<imagePreview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body:
Center(
        child: Panorama(
          maxZoom: 5,
          minZoom: 0.5,
          child: Image.network(widget.imageUrl),
        ),

     
    ));
  }
}