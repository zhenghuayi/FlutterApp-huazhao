import 'package:flutter/material.dart';

class MomentPage extends StatefulWidget {
  MomentPage({Key key}) : super(key: key);

  _MomentPageState createState() => _MomentPageState();
}

class _MomentPageState extends State<MomentPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
       child: Text('Moment',style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold),),
    );
  }
}