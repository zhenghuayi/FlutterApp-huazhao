import 'package:flutter/material.dart';
import 'dart:math';
import 'package:huazhao/pages/activityDetail/activity_detail_page.dart';

typedef OnSwipeEnd = void Function(SwipeDirection direction);
typedef GenerateWidget = Widget Function();

enum SwipeDirection { left, right }

class SwipeCard extends StatefulWidget {
  
  /// 初始组件列表
  final List<Widget> initItems;
  final GenerateWidget generateWidget;
  final double maxAngle;

  SwipeCard({
    Key key,
    @required this.initItems,
    @required this.generateWidget,
    this.maxAngle = pi / 3
  }) : super(key: key);

  @override
  _SwipeCardState createState() => _SwipeCardState();
}

class _SwipeCardState extends State<SwipeCard> with SingleTickerProviderStateMixin{
  
  List<Widget> get initItems => widget.initItems;
  GenerateWidget get generateWidget => widget.generateWidget;
  double get maxAngle => widget.maxAngle; 

  double _distance = 0.0;
  double _endDistatnce = 0.0;
  double _radius = 0.0;
  double _scale = 0.8;
  Offset _translation = Offset(0, 0.05);
  AnimationController _controller;
  SwipeDirection _direction;
  List<Widget> _widgets;

  @override
  void initState() {
    super.initState();
    _widgets = List.from(initItems);
    _controller = AnimationController(
      vsync: this,
      lowerBound: 0.0,
      upperBound: 1.0,
    )..addListener(() => _autoRotate())
     ..addStatusListener((AnimationStatus status) {
       if (status == AnimationStatus.completed) {
         _onTransitionComplete();
       }
     });
  }

  void _autoRotate() {
    if (_radius == null || _radius == 0.0 || _radius == 0) return;

    double maxDistance = maxAngle * _radius - _endDistatnce.abs();
    int sign = _direction == SwipeDirection.right ? 1 : -1;
    setState(() {
      _distance = sign * _controller.value * maxDistance + _endDistatnce;
      _onSwipe();
    });
  }

  void _onTransitionComplete() {
    _widgets?.add(generateWidget?.call());
    if (_widgets.length > 0) {
      _widgets.removeAt(0);
    }
    _reset();
  }

  void _reset() {
    _distance = 0.0;
  }
  

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double maxWidth = constraints.biggest.width;
        double maxHeight = constraints.biggest.height;
        Offset origin = Offset(0, maxHeight * 1.4);
        _radius = origin.dy;

        return GestureDetector(
          onHorizontalDragStart: _onHorizontalDragStart,
          onHorizontalDragUpdate: (DragUpdateDetails details) {
            _onHorizontalDragUpdate(details, origin);
          },
          onHorizontalDragEnd: (DragEndDetails details) {
            _onHorizontalDragEnd(details, origin);
          },
          child: Stack(
            children: [
              Transform.scale(
                scale: _scale,
                child: FractionalTranslation(
                  translation: _translation,
                  child: _widgets[1] ?? Container(),
                ),
              ),
              Transform.rotate(
                origin: origin,
                angle: _distance / maxHeight / 1.4,
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context)=>ActivityDetail()
                    ));
                  },
                  child: Hero(
                    tag: 'activity',
                    child: _widgets.first ?? Container(),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  _onHorizontalDragStart(DragStartDetails details) {
    _endDistatnce = 0.0;
  }

  _onHorizontalDragUpdate(DragUpdateDetails details, Offset origin) {
    setState(() {
      _distance = _distance + details.delta.dx;
      _onSwipe();
    });
  }

  _onHorizontalDragEnd(DragEndDetails details, Offset origin) {
    if (_distance.abs() / origin.dy <= pi / 15) {
      setState(() {
        _reset();
      });
      return;
    }
    _endDistatnce = _distance;
    _controller.reset();
    if (_distance < 0) {
      _direction = SwipeDirection.left;
    }
    if (_distance > 0) {
      _direction = SwipeDirection.right;
    }
    _controller.fling(
      velocity: details.velocity.pixelsPerSecond.dx.abs() / 100
    );
  }

  void _onSwipe() {
    if (_radius == null || _radius == 0.0 || _radius == 0) return;
    double angle = _distance.abs() / _radius;
    double ratio = angle / maxAngle;
    _scale = 0.8 + ratio * 0.2;
    _translation = Offset(0, 0.05* (1-ratio));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}