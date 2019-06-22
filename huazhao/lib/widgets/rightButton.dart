import 'package:flutter/material.dart';

class RightButton extends StatefulWidget {
  IconData icon;
  double size;
  int count;
  VoidCallback onTap;
  RightButton({
    this.size=32.0,
    this.count,
    this.icon,
    this.onTap
  });
  @override
  _RightButtonState createState() => _RightButtonState();
}

class _RightButtonState extends State<RightButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Column(
        children: <Widget>[
          Container(
            width: widget.size,
            height: widget.size,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color.fromRGBO(255, 255, 255, 0.2)
            ),
            child: Icon(widget.icon,size: widget.size-12.0,color: Colors.white,),
          ),
          Text(widget.count==null?"":widget.count.toString(),style: TextStyle(fontSize: 12.0,color: Colors.white),)
        ],
      )
    );
  }
}