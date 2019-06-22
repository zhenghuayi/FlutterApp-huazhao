import 'package:flutter/material.dart';

class MinePage extends StatefulWidget {
  MinePage({Key key}) : super(key: key);

  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
       child: Text('Mine',style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold),),
    );
  }
}