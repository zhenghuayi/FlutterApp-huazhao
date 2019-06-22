import 'package:flutter/material.dart';

class MyAppbar extends StatefulWidget {
  Color backgroundColor;
  Widget leading;
  Widget title;
  List<Widget> actions;
  MyAppbar({
    this.backgroundColor=Colors.white,
    this.leading,
    this.title,
    this.actions
  });
  @override
  _MyAppbarState createState() => _MyAppbarState();
}

class _MyAppbarState extends State<MyAppbar> {
  @override
  void initState() {
    Navigator.canPop(context)?widget.leading=Icon(Icons.arrow_back_ios):null;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 56.0,
      color: widget.backgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: 56.0,
            height: 56.0,
            alignment: Alignment.center,
            child: widget.leading,
          ),
          Container(
            child: widget.title,
          ),
          OverflowBox(
            minWidth: 56.0,
            child: Row(
              children: widget.actions??[Container()],
            ),
          )
        ],
      ),
    );
  }
}
