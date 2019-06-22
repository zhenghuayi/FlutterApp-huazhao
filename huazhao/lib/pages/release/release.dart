import 'package:flutter/material.dart';
import 'dart:async';
import 'package:huazhao/widgets/option.dart';

class Release extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF8E54E9),Color(0xFF4776E6)]
          )
        ),
        child: Column(
          children: <Widget>[
            MyAppBar(context),
            Padding(
              padding: EdgeInsets.only(left: 20.0,right: 20.0),
              child: Column(
                children: <Widget>[
                  TextField(),
                  SizedBox(height: 15.0,),
                  Wrap(
                    alignment: WrapAlignment.spaceBetween,
                    crossAxisAlignment: WrapCrossAlignment.start,
                    spacing: 25.0,
                    runSpacing: 10.0,
                    children: <Widget>[
                      new Container(width:45.0, height: 60.0, color: Colors.yellow,),
                      new Container(width:45.0, height: 60.0, color: Colors.green,),
                      new Container(width:45.0, height: 60.0, color: Colors.red,),
                      new Container(width:45.0, height: 60.0, color: Colors.black,),
                      new Container(width:45.0, height: 60.0, color: Colors.blue,),
                      new Container(width:45.0, height: 60.0, color: Colors.lightGreenAccent,),
                      new Container(width:45.0, height: 60.0, color: Colors.red,),
                      new Container(width:45.0, height: 60.0, color: Colors.black,),
                      new Container(width:45.0, height: 60.0, color: Colors.blue,),
                      new Container(width:45.0, height: 60.0, color: Colors.lightGreenAccent,),
                    ],
                  ),
                  MyOption(
                    currentIndex: 0,
                    items:[
                      OptionItem(label: "线上",value: '999'),
                      OptionItem(label: "线下",value: '666'),
                      OptionItem(label: "线中",value: '333')
                    ],
                    onTap: (i){
                      print(i);
                    },
                  ),
                  GestureDetector(
                    child:Container(
                      color: Colors.grey,
                      child: Text("2018/12/21"),
                    ),
                    onTap: (){
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now().subtract(new Duration(days: 30)),
                        lastDate: DateTime.now().add(new Duration(days: 30)),
                      ).then((DateTime val){
                          print(val);   // 2018-07-12 00:00:00.000
                          showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          ).then((val){
                            print(val);
                          }).catchError((err){
                            print(err);
                          });
                      }).catchError((err){
                          print(err);
                      });
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Flexible(
                        child: MyOption(
                          items:[
                            OptionItem(label: "线上",value: '999'),
                            OptionItem(label: "线中",value: '333')
                          ],
                          onTap: (i){
                            print(i);
                          },
                        ),
                      ),
                      SizedBox(
                        width: 40.0,
                      ),
                      Flexible(
                        child: MyOption(
                          items:[
                            OptionItem(label: "线上",value: '999'),
                            OptionItem(label: "线中",value: '333')
                          ],
                          onTap: (i){
                            print(i);
                          },
                        ),
                      )
                    ],
                  )
                  
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget MyAppBar(context){
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0.0,
    actions: <Widget>[
      Align(
        child: Padding(
          padding: EdgeInsets.only(right: 15.0),
          child:GestureDetector(
            child: Text("玩法规则"),
            onTap: (){
              showDialog(
                context: context,
                builder: (BuildContext context)=> RuleDialog(context)
              );
              // showModalBottomSheet(
              //   context: context,
              //   builder: (BuildContext context){
              //     return Column(
              //       children: <Widget>[
              //         Text('data'),
              //         Image.asset('images/ic_tab_profile_active.png')
              //       ],
              //     );
              //   }
              // );
            },
          ),
        ),
      )
    ],
  );
}
Widget RuleDialog(context){
  return GestureDetector(
    onTap: (){
      Navigator.pop(context);
    },
    child: AlertDialog(
      title: Text('玩法规则介绍'),
      content: SingleChildScrollView(
          child: ListBody(
              children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    color: Colors.red,
                    child: Text('data'),
                  ),
                  Text('内容 2'),
                  Text('内容 1'),
                  Text('内容 2'),
                  Text('内容 1'),
                  Text('内容 2'),Text('内容 1'),
                  Text('内容 2'),Text('内容 1'),
                  Text('内容 2'),Text('内容 1'),
                  Text('内容 2'),Text('内容 1'),
                  Text('内容 2'),Text('内容 1'),
                  Text('内容 2'),Text('内容 1'),
              ],
          ),
      )
    ),
  );
}
