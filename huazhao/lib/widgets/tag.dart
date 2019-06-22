import 'package:flutter/material.dart';

class MyTag extends StatelessWidget {
  List items;
  MyTag({
    this.items
  });
  
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      children: List<Widget>.generate(items.length, (item)=>Container(
        padding: EdgeInsets.fromLTRB(6.0, 0, 6.0, 0),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.horizontal(left:Radius.circular(8.0), right:Radius.circular(8.0)),
        ),
        child:Text(items[item],style: TextStyle(fontSize:12.0,color: Color(0xffF6E06A)))
      )),
    );
  }
}