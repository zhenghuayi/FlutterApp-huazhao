import 'package:flutter/material.dart';
import 'package:huazhao/pages/home/home_base.dart';
import 'package:huazhao/pages/message/message_page.dart';
import 'package:huazhao/pages/moment/moment_page.dart';
import 'package:huazhao/pages/mine/mine_page.dart';
import 'package:huazhao/pages/release/release.dart';

class ContainerPage extends StatefulWidget {
  ContainerPage({Key key}) : super(key: key);

  _ContainerPageState createState() => _ContainerPageState();
}
class _ContainerPageState extends State<ContainerPage> {

  List<Widget> pages;
  int _currentPage=0;
  @override
  void initState() {
    pages=[HomePage(),MomentPage(),MessagePage(),MinePage()];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: MyFloatActionButton(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      backgroundColor: Color.fromARGB(255, 248, 248, 248),
      body: IndexedStack(
        index: _currentPage,
        children: pages,
      ),
      bottomNavigationBar: MyBottomBar()
    );
  }
  Widget MyBottomBar(){
    return Stack(
      alignment: AlignmentDirectional(0, 1),
      children:<Widget>[
        Container(
          height: 56.0,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              // 首页
              Expanded(
                child:InkWell(
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _currentPage==0?Image.asset('images/ic_tab_home_active.png',width: 32.0,):Image.asset('images/ic_tab_home_normal.png',width: 32.0,),
                      Text('首页',style: TextStyle(fontSize: 10.0,color: _currentPage==0?Colors.black:Colors.black),)
                    ]
                  ),
                  onTap: (){
                    setState(() {
                      _currentPage=0;
                    });
                  },
                )
              ),
              // 动态
              Expanded(
                child:InkWell(
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _currentPage==1?Image.asset('images/ic_tab_subject_active.png',width: 32.0,):Image.asset('images/ic_tab_subject_normal.png',width: 32.0,),
                      Text('动态',style: TextStyle(fontSize: 10.0,color: _currentPage==1?Colors.black:Colors.black),)
                    ]
                  ),
                  onTap: (){
                    setState(() {
                      _currentPage=1;
                    });
                  },
                )
              ),
              
              Expanded(
                child: Container(),
              ),
              // 消息
              Expanded(
                child:InkWell(
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _currentPage==2?Image.asset('images/ic_tab_shiji_active.png',width: 32.0,):Image.asset('images/ic_tab_shiji_normal.png',width: 32.0,),
                      Text('消息',style: TextStyle(fontSize: 10.0,color: _currentPage==2?Colors.black:Colors.black),)
                    ]
                  ),
                  onTap: (){
                    setState(() {
                      _currentPage=2;
                    });
                  },
                )
              ),
              // 我的
              Expanded(
                child:InkWell(
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _currentPage==3?Image.asset('images/ic_tab_profile_active.png',width: 32.0,):Image.asset('images/ic_tab_profile_normal.png',width: 32.0,),
                      Text('我的',style: TextStyle(fontSize: 10.0,color: _currentPage==3?Colors.black:Colors.black),)
                    ]
                  ),
                  onTap: (){
                    setState(() {
                      _currentPage=3;
                    });
                  },
                )
              ),
            ],
          ),
        ),
        
      ]
    );
  }
}

Widget MyFloatActionButton(context){
  return GestureDetector(
    onTap: (){
      Navigator.push(context, MaterialPageRoute(
        builder: (context)=>Release()
      ));
    },
    child: Stack(
      children: <Widget>[
        Container(
          width: 100.0,
          height: 100.0,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100.0),
            color: Colors.white
          ),
          child: Container(
            width: 90.0,
            height: 90.0,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100.0),
              color: Color.fromARGB(1, 250, 122, 163).withOpacity(0.1)
            ),
            child: Container(
              width: 80.0,
              height: 80.0,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100.0),
                color: Color.fromARGB(1, 250, 122, 163).withOpacity(0.2)
              ),
              child:Container(
                width: 70.0,
                height: 70.0,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.0),
                  gradient: LinearGradient(
                    colors: [Color(0xffFA7AA3),Color(0xffF74981)],
                    begin: FractionalOffset(0, 0), 
                    end: FractionalOffset(1, 1)
                  ),
                  color: Color.fromARGB(1, 250, 122, 163).withOpacity(1)
                ),
                child: Icon(Icons.fingerprint,color: Colors.white,),
              )
            ),
          ),
        )
      ],
    )
  );
}