import 'package:flutter/material.dart';

class MessagePage extends StatefulWidget {
  MessagePage({Key key}) : super(key: key);

  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
       child: Text('Message',style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold),),
    );
  }
}