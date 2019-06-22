import 'package:flutter/material.dart';

class ShineIcon extends StatefulWidget {
  bool status;
  VoidCallback returnStatus;
  ValueChanged onTap;
  IconData icon;
  double size;
  ShineIcon({
    Key key,
    this.status=false,
    this.onTap,
    this.icon=Icons.favorite,
    this.size=36.0
  });
  @override
  _ShineIconState createState() => _ShineIconState();
}

class _ShineIconState extends State<ShineIcon>  with TickerProviderStateMixin{
  AnimationController _animationController1;
  Widget Cover(){
    return Offstage(
      offstage:_animationController1.status==AnimationStatus.completed,
      child:Container(
        width:widget.size*_animationController1.value,
        height:widget.size*_animationController1.value,
        decoration: BoxDecoration(
          borderRadius:BorderRadius.all(Radius.circular(50.0)),
          color:Colors.white,
          border: Border.all(width:1.0,color:Colors.pink),
        ),
      )
    );
  }
  @override
  void initState() {
    _animationController1=AnimationController(
      duration: Duration( milliseconds: 500),
      vsync: this
    );
    _animationController1.addListener((){
      setState(() {
        
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(widget.onTap != null){
          setState(() {
            if(widget.status){
              // _animationController1.reset();
            }else{
              _animationController1.forward();
            }
            widget.status=!widget.status;
          });
          widget.onTap(widget.status);
        }
      },
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Icon(widget.icon,size: widget.size,color: widget.status?Colors.pink:Colors.white,),
          Cover()
        ],
      ),
    );
  }
}