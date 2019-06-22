import 'package:flutter/material.dart';
import 'dart:async';

import 'package:huazhao/container_page.dart';

class SplashWidget extends StatefulWidget {
  @override
  _SplashWidgetState createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget> {
  bool showAd=false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Offstage(
          offstage: showAd,
          child: ContainerPage()
        ),
        Offstage(
          offstage: !showAd,
          child: Container(
            color: Colors.pinkAccent,
            child: Stack(
              children: <Widget>[
                Center(
                  child: Text('启动页',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),),
                ),
                SafeArea(
                  child: CountDownWidget(
                    onCountDownFinishCallBack: (bool value) {
                      if (value) {
                        setState(() {
                          showAd = false;
                        });
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class CountDownWidget extends StatefulWidget {
  final onCountDownFinishCallBack;

  CountDownWidget({Key key, @required this.onCountDownFinishCallBack})
      : super(key: key);

  @override
  _CountDownWidgetState createState() => _CountDownWidgetState();
}

class _CountDownWidgetState extends State<CountDownWidget> {
  var _seconds = 6;
  Timer _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: Color.fromRGBO(0, 0, 0, .3),
      label: Text(
        '$_seconds s...',
        style: TextStyle(fontSize: 17.0,color: Colors.white),
      ),
    );
  }

  /// 启动倒计时的计时器。
  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
      if (_seconds <= 1) {
        widget.onCountDownFinishCallBack(true);
        _cancelTimer();
        return;
      }
      _seconds--;
    });
  }

  /// 取消倒计时的计时器。
  void _cancelTimer() {
    _timer?.cancel();
  }
}