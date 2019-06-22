import 'package:flutter/material.dart';

class IconTwinkle extends StatefulWidget {
  bool status;
  VoidCallback onTap;
  double size;
  IconTwinkle({
    Key key,
    this.status=false,
    this.onTap,
    IconData icon=Icons.favorite,
    this.size=36.0
  });
  @override
  _IconTwinkleState createState() => _IconTwinkleState();
}

class _IconTwinkleState extends State<IconTwinkle> with TickerProviderStateMixin{
  List<Widget> _initWidget=[];

  AnimationController _animationController1;
  Animation animationStep1;
  Animation animationStep1Opacity;
  bool animationStep1Show=false;

  AnimationController _animationController2;
  Animation animationStep2;

  AnimationController _animationControllerBall;
  Animation animationBall;
  bool ballShow=false;

  AnimationController _animationControllerSmallBall;
  Animation animationSmallBall;

  AnimationController _animationController3;
  Animation animationStep3;
  int jumpTimes=0;

  // AnimationController _animationController3;
  // Animation animationStep3;
  CurvedAnimation curve;

  void resetAnimate(){
    _animationController1=AnimationController(
      duration: Duration( milliseconds: 200),
      vsync: this
    );
    curve=CurvedAnimation(parent:_animationController1, curve:Curves.easeOut);
    animationStep1=Tween(begin: 15.0, end: 60.0).animate(_animationController1);
    animationStep1Opacity=Tween(begin: 1.0,end:0.0).animate(_animationController1);
    _animationController1.addListener((){
      setState(() {
        animationStep1Show=true;
        if(_animationController1.status==AnimationStatus.completed){
          // Future.delayed( Duration(milliseconds: 200),(){
            animationStep1Show=false;
            ballShow=true;
            _animationController2.forward();
            _animationControllerBall.forward();
            _animationControllerSmallBall.forward();
          // });
        }
      });
    });

    _animationController2=AnimationController(
      duration: Duration( milliseconds: 250),
      vsync: this
    );
    animationStep2=Tween(begin: 10.0, end: 40.0).animate(_animationController2)
    ..addListener((){
      setState(() {
        widget.size=animationStep2.value;
        if(_animationController2.status==AnimationStatus.completed){
          _animationController3.forward();
        }
      });
    });

    _animationController3=AnimationController(
      duration: Duration( milliseconds: 250),
      vsync: this
    );
    animationStep3=Tween(begin: 40.0, end: 36.0).animate(_animationController3)
    ..addListener((){
      setState(() {
        widget.size=animationStep3.value;
        if(_animationController3.status==AnimationStatus.completed && jumpTimes<1){
          _animationController3.reverse();
          jumpTimes++;
        }else if(_animationController3.status==AnimationStatus.dismissed && jumpTimes<1){
          _animationController3.forward();
          jumpTimes++;
        }
      });
    });
    _animationControllerBall=AnimationController(
      duration: Duration( milliseconds: 1100),
      vsync: this
    );
    animationBall=Tween(begin: 14.0, end: 0.0).animate(_animationControllerBall)
    ..addListener((){
      setState(() {
        
      });
    });
    

    _animationControllerSmallBall=AnimationController(
      duration: Duration( milliseconds: 1100),
      vsync: this
    );
    animationSmallBall=Tween(begin: 8.0, end: 0.0).animate(_animationControllerSmallBall)
    ..addListener((){
      setState(() {
        
      });
    });
  }

  void resetIcon(){
    _initWidget.add(FavoriteIcon(
      size:widget.size,
      status:widget.status
    ));
    for(int i=1;i<9;i++){
      _initWidget.add(BorderBall(
        i:i,
        animationBall: animationBall,
        ballShow: ballShow,
      ));
      _initWidget.add(BorderMiniBall(
        i:i,
        animationSmallBall:animationSmallBall,
        ballShow: ballShow,
      ));
      if(i==8){
        _initWidget.add(IconCover(
          animationStep1: animationStep1,
          animationStep1Show: animationStep1Show,
        ));
      }
    }
  }
  @override
  void initState() {
    resetIcon();
    resetAnimate();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        print(jumpTimes);
        if(jumpTimes!=0){
          print('动画还原');
          print(animationStep1Show);
          setState(() {
            _animationController1.reset();
            _animationController2.reset();
            _animationController3.reset();
            _animationControllerBall.reset();
            _animationControllerSmallBall.reset();
            ballShow=false;
            jumpTimes=0;
            animationStep1Show=false;
          });
        }else{
          _animationController1.forward();
        }
      },
      child:Stack(
        alignment: Alignment.center,
        children:_initWidget
      )
    );
  }
}
class FavoriteIcon extends StatelessWidget {
  final bool status;
  final double size;
  const FavoriteIcon({
    this.status,
    this.size
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.0,
      height: 80.0,
      child:Icon(
        Icons.favorite,
        color:status? Colors.pinkAccent:Colors.white,
        size:size,
      ),
    );
  }
}
class BorderBall extends StatelessWidget {
  final int i;
  final Animation animationBall;
  final bool ballShow;
  const BorderBall({
    this.i,
    this.animationBall,
    this.ballShow
  });
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left:i==7?0.0:i==1 ?40-animationBall.value/2:i==6 || i==8?10.0:null,
      top:i==1?0.0:i==2 || i==8?10.0:i==7?40-animationBall.value/2:null,
      bottom: i==5?0.0:i==4 || i==6?10.0:i==3?40-animationBall.value/2:null,
      right: i==3?0.0:i==2 || i==4?10.0:i==5?40-animationBall.value/2:null,
      child:Container(
        width:animationBall.value,
        height:animationBall.value,
        decoration: BoxDecoration(
          color: ballShow==true? Colors.pink[300]:Colors.pink[300].withOpacity(0.0),
          borderRadius: BorderRadius.circular(50.0)
        ),
      )
    );
  }
}
class BorderMiniBall extends StatelessWidget {
  final int i;
  final Animation animationSmallBall;
  final bool ballShow;
  const BorderMiniBall({
    this.i,
    this.animationSmallBall,
    this.ballShow
  });
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left:i==1 || i==6?24.0:i==7 ||i==8?8.0:null,
      top:i==1 || i==2?8.0:i==3 ||i==8?24.0:null,
      bottom: i==5 || i==6?8.0:i==4 || i==7?24.0:null,
      right: i==2 ||i==5?24.0:i==3 || i==4?8.0:null,
      child:Container(
        width:animationSmallBall.value,
        height:animationSmallBall.value,
        decoration: BoxDecoration(
          color: ballShow==true? Colors.purple[100]:Colors.purple[100].withOpacity(0.0),
          borderRadius: BorderRadius.circular(50.0)
        ),
      )
    );
  }
}
class IconCover extends StatelessWidget {
  final bool animationStep1Show;
  final Animation animationStep1;
  const IconCover({
    this.animationStep1Show,
    this.animationStep1
  });
  @override
  Widget build(BuildContext context) {
    return Offstage(
      offstage:!animationStep1Show,
      child:Container(
        width:animationStep1.value,
        height:animationStep1.value,
        decoration: BoxDecoration(
          borderRadius:BorderRadius.all(Radius.circular(50.0)),
          color:Colors.white,
          border: Border.all(width:1.0,color:Colors.pink),
        ),
      )
    );
  }
}



   
