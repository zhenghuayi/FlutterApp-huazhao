import 'package:flutter/material.dart';
import 'package:flutter_range_slider/flutter_range_slider.dart';
import 'dart:async';

class Choose extends StatefulWidget {
  @override
  _ChooseState createState() => _ChooseState();
}

class _ChooseState extends State<Choose> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('人物筛选'),
        centerTitle:true,
        elevation: 0,
        leading: InkWell(
          child:Icon(Icons.arrow_back_ios),
          onTap: (){Navigator.pop(context);},
        ),
      ),
      body: SafeArea(
        child:PersonChoose()
      ),
    );
  }
}


class PersonChoose extends StatefulWidget {
  @override
  _PersonChooseState createState() => _PersonChooseState();
}

class _PersonChooseState extends State<PersonChoose> {
  double _valueDistance=0.0;
  double _valueLowerAge=20.0;
  double _valueUpperAge=28.0;
  int _valueGender=0;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child:Column(
        children: <Widget>[
          // 距离选择
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(top:36.0),
            padding: EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
            child:Text('距离',style: TextStyle(fontSize:16.0),),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
            child:Slider(
              value: _valueDistance,
              min: 0.0,
              max: 10.0,
              divisions: 20,
              activeColor: Colors.black,
              inactiveColor: Colors.grey,
              label: "$_valueDistance km",
              onChanged: (value){
                setState(() {
                  _valueDistance=value;
                });
              },
              onChangeStart: (startValue) {
                print('onChangeStart:$startValue');
              },
              onChangeEnd: (endValue) {
                print('onChangeEnd:$endValue');
              },
            )
          ),
          Container(
            padding: EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(_valueDistance.toString()+'km',style: TextStyle(fontSize:12.0),),
                Text('10.0km',style: TextStyle(fontSize:12.0),),
              ],
            ),
          ),
          // 年龄选择
          Container(
            margin: EdgeInsets.only(top:36.0),
            padding: EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
            alignment: Alignment.centerLeft,
            child:Text('年龄',style: TextStyle(fontSize:16.0),),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
            child:RangeSlider(
              min: 18.0,
              max: 48.0,
              lowerValue: _valueLowerAge,
              upperValue: _valueUpperAge,
              divisions: 30,
              showValueIndicator: true,
              valueIndicatorMaxDecimals: 1, 
              valueIndicatorFormatter: (int index, double value){
                return '${value.toInt()} 岁';
              },
              onChanged: (double newLowerValue, double newUpperValue) {
                setState(() {
                  _valueLowerAge = newLowerValue;
                  _valueUpperAge = newUpperValue;
                });
              },
              onChangeStart:(double startLowerValue, double startUpperValue) {
                print(
                  'Started with values: $startLowerValue and $startUpperValue');
                },
              onChangeEnd: (double newLowerValue, double newUpperValue) {
                print(
                  'Ended with values: $newLowerValue and $newUpperValue');
                },
            )
          ),
          Container(
            padding: EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('18岁',style: TextStyle(fontSize:12.0),),
                Text(_valueLowerAge.toInt().toString()+'岁~'+_valueUpperAge.toInt().toString()+'岁',style: TextStyle(fontSize:12.0),),
                Text('48岁',style: TextStyle(fontSize:12.0),),
              ],
            )
          ),
          // 性别选择
          Container(
            padding: EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
            margin: EdgeInsets.fromLTRB(0,36.0,0,15.0),
            alignment: Alignment.centerLeft,
            child:Text('性别',style: TextStyle(fontSize:16.0),),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
            child:Row(
              children: <Widget>[
                Expanded(
                  child:GestureDetector(
                    onTap: (){
                      setState(() {
                        _valueGender=0;
                      });
                    },
                    child:Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.fromLTRB(5.0, 0, 5.0, 0),
                      padding: EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
                      decoration:new BoxDecoration(
                        border:Border.all(width:1.0,color: Colors.black),
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        color:_valueGender==0? Colors.black:Colors.white
                      ),
                      child:Text('全部',style:TextStyle(fontSize:16.0,color:_valueGender==0?Colors.white:Colors.black),)
                    )
                  )
                ),
                Expanded(
                  child:GestureDetector(
                    onTap: (){
                      setState(() {
                        _valueGender=1;
                      });
                    },
                    child:Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
                      margin: EdgeInsets.fromLTRB(5.0, 0, 5.0, 0),
                      decoration:new BoxDecoration(
                        border:Border.all(width:1.0,color: Colors.black),
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        color:_valueGender==1? Colors.black:Colors.white
                      ),
                      child:Text('男性',style:TextStyle(fontSize:16.0,color:_valueGender==1?Colors.white:Colors.black),)
                    )
                  )
                ),
                Expanded(
                  child:GestureDetector(
                    onTap: (){
                      setState(() {
                        _valueGender=2;
                      });
                    },
                    child:Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.fromLTRB(5.0, 0, 5.0, 0),
                      padding: EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
                      decoration:new BoxDecoration(
                        border:Border.all(width:1.0,color: Colors.black),
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        color:_valueGender==2? Colors.black:Colors.white
                      ),
                      child:Text('女性',style:TextStyle(fontSize:16.0,color:_valueGender==2?Colors.white:Colors.black),)
                    )
                  )
                )
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height:56.0,
            alignment: Alignment.center,
            color:Colors.black,
            margin: EdgeInsets.only(top:36.0),
            child: Text('确定',style:TextStyle(color:Colors.white,fontSize:18.0)),
          )
        ],
      )
    );
  }
}