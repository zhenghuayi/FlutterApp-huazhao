import 'package:flutter/material.dart';

class MyAvatar extends StatelessWidget {
  double size;
  String url;
  EdgeInsetsGeometry margin;
  MyAvatar({
    this.size=24.0,
    this.url,
    this.margin
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      margin: margin,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white,width: 2.0),
        image: DecorationImage(
          image: NetworkImage(
            url
          )
        ),
      ),
    );
  }
}