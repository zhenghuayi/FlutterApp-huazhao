import 'package:flutter/material.dart';
import 'swipe_card.dart';
import 'package:huazhao/widgets/tag.dart';
import 'package:huazhao/widgets/rightButton.dart';
import 'package:huazhao/widgets/avatar.dart';

class ActivityCardPage extends StatefulWidget {
  static const name = 'ActivityCard page';

  @override
  _ActivityCardPageState createState() => _ActivityCardPageState();
}

class _ActivityCardPageState extends State<ActivityCardPage> {
  List images=[
    "http://5b0988e595225.cdn.sohucs.com/images/20190112/05a890f6d5de4a10b62f3bae966bbaa4.png",
    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1560168426866&di=7ad6cb4cbb9473cc78869d747c66a61e&imgtype=0&src=http%3A%2F%2Fimg.mp.sohu.com%2Fq_mini%2Cc_zoom%2Cw_640%2Fupload%2F20170811%2Fd79fa636c88d4c46ba52151cc2c3d48a_th.jpg",
    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1560168447832&di=6a7767049130b1de41e4ee1b1d2b8534&imgtype=0&src=http%3A%2F%2Fmmbiz.qpic.cn%2Fmmbiz_jpg%2FYWyNMtoMxndfRvnaRNfRUVG3Bj0Kn6ZsN6Eoam1crmReDxibKC9bW0UPnH5LUUPiasGmHib4jGVJArMlib7C5VSa2g%2F640%3Fwx_fmt%3Djpeg",
    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1560168465223&di=7ed191ad4ad56c738d398474f1f02fa8&imgtype=0&src=http%3A%2F%2Fimg.mp.itc.cn%2Fq_mini%2Cc_zoom%2Cw_640%2Fupload%2F20170706%2Fd0d1ffcda3d142d790249c1911fbe4d0_th.jpg"
  ];
  List<Widget> comments=[];
  List<Widget> _widgets = [];
  int initIndex = 4;
  double _screenWidth=300;
  double _keyDistance=0.0;
  FocusNode _focusNode=FocusNode();
  void initState() {
    super.initState();
    _widgets = _buildWidgets(initIndex);
    _focusNode.addListener((){
      if (_focusNode.hasFocus) {
        setState(() {
          _keyDistance=-300.0;
        });
      }else{
        setState(() {
          _keyDistance=0.0;
        });
      }
    });
    comments=List.generate(20, (int index){
      return ListTile(
        leading: MyAvatar(
          size: 48.0,
          url: "https://avatar-static.segmentfault.com/745/308/745308119-5b7cc24dda899_huge256",
        ),
        title: Text('Mona'),
        subtitle: Text("有人吗？有人一起组团嘛，多人可以？？？？？？.沙发巾理发师阿双方均撒离开家萨迪克拉屎..",style: TextStyle(color:Colors.black),),
        trailing: Text('2天前'),
      );
    });
  }

  List<Widget> _buildWidgets(int count) {
    List<Widget> widgets = [];
    for (int index=0; index < count; index++) {
      widgets.add(
        Padding(
          padding: EdgeInsets.all(20.0),
          child: Stack(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(width: 3.0),
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    image: DecorationImage(
                      image: NetworkImage(images[index]),
                      fit: BoxFit.cover
                    )
                  )
                ),
              ),
              // 认证标识
              Positioned(
                top: 15.0,
                left: 15.0,
                child: Icon(Icons.access_alarms,color: Colors.white,),
              ),
              // 卡片信息
              Positioned(
                bottom: 15.0,
                left: 15.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("电音节组队电音节组队",style: TextStyle(fontSize: 24.0,color: Colors.white),),
                    SizedBox(height: 5.0,),
                    MyTag(
                      items: ["发起者请","双人","电音","奖励200"],
                    ),
                    SizedBox(height: 5.0,),
                    Text("2019.04.20 17:00 — 2019.04.21 01:00",style: TextStyle(fontSize: 12.0,color: Colors.white),),
                    SizedBox(height: 5.0,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(top: 3),
                        child:Icon(Icons.place,color: Colors.white,size: 14.0,),
                      ),
                      Container(
                        width: 110,
                        alignment: Alignment.topLeft,
                        child: Text("杭州,MaoHouse那阿达萨达阿帆发生",
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.white,
                          
                        )),
                      )
                    ],)
                  ],
                ),
              ),
              // 操作按钮
              Positioned(
                right: 15.0,
                bottom: 15.0,
                child: Column(
                  children: <Widget>[
                    RightButton(
                      icon: Icons.favorite,
                      count: 122,
                    ),
                    SizedBox(height: 5.0),
                    RightButton(
                      icon: Icons.message,
                      count: 122,
                      onTap: (){
                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context){
                            return commentModal(context);
                          }
                        );
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        )
      );
    }
    return widgets;     
  }

  Widget commentModal(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom
      ),
      child: GestureDetector(
        onTapDown: (val){
          _focusNode.unfocus();
        },
        child:Stack(
          children: <Widget>[
            Container(
              height: 12,
              width: double.infinity,
              color: Colors.black54,
            ),
            Container(
              height:MediaQuery.of(context).size.height*3/4 - MediaQuery.of(context).viewInsets.bottom,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    height: 36.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('共106条评论',style:TextStyle(color: Color(0xff979797))),
                        Icon(Icons.arrow_drop_down,color:Color(0xff979797))
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      children: comments,
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 20.0),
                    color: Color(0xfff1f1f1),
                    height: 56.0,
                    child: TextField(
                      focusNode: _focusNode,
                      cursorColor: Color(0xffF74981),
                      decoration: InputDecoration(
                        hintText: "活动很火热哦，来说点什么吧~",
                        contentPadding:EdgeInsets.symmetric(vertical: 2.0,horizontal: 10.0),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.send,color: Color(0xffF74981)),
                          onPressed: (){
                            print('发布评论');
                          },
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide.none
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        onTap: ()=>true,
      ),
    );
  }

  Widget _generateWidget() {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Stack(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(width: 3.0),
                color: Colors.grey[500],
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                image: DecorationImage(
                  image: NetworkImage(images[3]),
                  fit: BoxFit.cover
                )
              ),
            ),
          ),
          // 认证标识
          Positioned(
            top: 15.0,
            left: 15.0,
            child: Icon(Icons.access_alarms,color: Colors.white,),
          ),
          // 卡片信息
          Positioned(
            bottom: 15.0,
            left: 15.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("电音节组队电音节组队",style: TextStyle(fontSize: 24.0,color: Colors.white),),
                SizedBox(height: 5.0,),
                MyTag(
                  items: ["发起者请","双人","电音","奖励200"],
                ),
                SizedBox(height: 5.0,),
                Text("2019.04.20 17:00 — 2019.04.21 01:00",style: TextStyle(fontSize: 12.0,color: Colors.white),),
                SizedBox(height: 5.0,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 3),
                    child:Icon(Icons.place,color: Colors.white,size: 14.0,),
                  ),
                  Container(
                    width: 110,
                    alignment: Alignment.topLeft,
                    child: Text("杭州,MaoHouse那阿达萨达阿帆发生",
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.white,
                      
                    )),
                  )
                ],)
              ],
            ),
          ),
          // 操作按钮
          Positioned(
            right: 15.0,
            bottom: 15.0,
            child: Column(
              children: <Widget>[
                RightButton(
                  icon: Icons.favorite,
                  count: 122,
                ),
                SizedBox(height: 5.0),
                RightButton(
                  icon: Icons.message,
                  count: 122,
                )
              ],
            ),
          )
        ],
      )
    );
  }

  Offset translation = Offset(0, 0.05);
  double scale = 0.8;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SwipeCard(
          initItems: _widgets,
          generateWidget: _generateWidget,
        ),
      ),
    );
  }

}
