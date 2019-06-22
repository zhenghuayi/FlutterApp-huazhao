import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:huazhao/widgets/appBar.dart';
import 'package:flutter/services.dart';

import 'package:huazhao/widgets/avatar.dart';
import 'package:huazhao/widgets/rightButton.dart';
import 'package:huazhao/widgets/tag.dart';

enum MoreOptions { harder, smarter, selfStarter, tradingCharter }
final List images=[
  "http://5b0988e595225.cdn.sohucs.com/images/20190112/05a890f6d5de4a10b62f3bae966bbaa4.png",
    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1560168426866&di=7ad6cb4cbb9473cc78869d747c66a61e&imgtype=0&src=http%3A%2F%2Fimg.mp.sohu.com%2Fq_mini%2Cc_zoom%2Cw_640%2Fupload%2F20170811%2Fd79fa636c88d4c46ba52151cc2c3d48a_th.jpg",
    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1560168447832&di=6a7767049130b1de41e4ee1b1d2b8534&imgtype=0&src=http%3A%2F%2Fmmbiz.qpic.cn%2Fmmbiz_jpg%2FYWyNMtoMxndfRvnaRNfRUVG3Bj0Kn6ZsN6Eoam1crmReDxibKC9bW0UPnH5LUUPiasGmHib4jGVJArMlib7C5VSa2g%2F640%3Fwx_fmt%3Djpeg",
    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1560168465223&di=7ed191ad4ad56c738d398474f1f02fa8&imgtype=0&src=http%3A%2F%2Fimg.mp.itc.cn%2Fq_mini%2Cc_zoom%2Cw_640%2Fupload%2F20170706%2Fd0d1ffcda3d142d790249c1911fbe4d0_th.jpg"
];

class ActivityDetail extends StatefulWidget {
  @override
  _ActivityDetailState createState() => _ActivityDetailState();
}

class _ActivityDetailState extends State<ActivityDetail> {
  List tags=["线下","双人","电影","红包200","发起者请","邀请男性"];
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
        return Scaffold(
          body: Container(
            child: ListView(
            children: <Widget>[
              // 轮播图部分
              Stack(
                children:<Widget>[
                  buildSwipe(context),
                  HandleAppbar(),
                  Positioned(
                    left: 25.0,
                    bottom: 25.0,
                    child: Row(
                      children: <Widget>[
                        MyAvatar(
                          margin: EdgeInsets.only(right: 15.0),
                          size: 54.0,
                          url: "https://upload.jianshu.io/users/upload_avatars/12224173/ead594d4-28df-4592-b3ef-495976773dc0.png?imageMogr2/auto-orient/strip|imageView2/1/w/96/h/96",
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Mona',style:TextStyle(color:Colors.white,fontSize: 20.0)),
                            Text('女 | 22',style:TextStyle(color:Colors.white,fontSize: 12.0))
                          ],
                        )
                      ],
                    )
                  ),
                  Positioned(
                    right: 25.0,
                    bottom: 25.0,
                    child: Column(
                      children: <Widget>[
                        RightButton(icon: Icons.info,),
                        RightButton(icon: Icons.reply,),
                        RightButton(
                          icon: Icons.favorite,
                          count: 122,
                          onTap: (){
                            print(111);
                          },
                        ),
                        RightButton(icon: Icons.info,count: 154,)
                      ],
                    ),
                  )
                ]
              ),
              ActivityInfo(tags: tags)
            ],
          ),
          )
    );
  }

  Hero buildSwipe(BuildContext context) {
    return Hero(
      tag: "activity",
      child: Container(
        width:double.infinity,
        height: MediaQuery.of(context).size.height,
        color: Colors.black,
        child:Swiper(
          itemCount: images.length,
          itemBuilder: _swiperBuilder,
          pagination: SwiperPagination(
              alignment: Alignment.bottomCenter,
              margin: const EdgeInsets.fromLTRB(0, 0, 20, 10),
              builder: DotSwiperPaginationBuilder(
                  color: Colors.black54,
                  activeColor: Colors.white
              )
          ),
          scrollDirection: Axis.horizontal,
          autoplay: false,
          // onTap: (index) => print(appBar.preferredSize.height),
        )
      ),
    );
  }
  Widget _swiperBuilder(BuildContext context, int index) {
    List<Widget> swipes=[];
    for(var item in images){
      swipes.add(Image.network(
        item,
        fit: BoxFit.cover,
      ));
    }
    return (swipes[index]);
  }
}

class ActivityInfo extends StatelessWidget {
  const ActivityInfo({
    Key key,
    @required this.tags,
  }) : super(key: key);

  final List tags;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(top:10.0,bottom:10.0),
            child:Text('一起看电影',style: TextStyle( fontSize: 24.0,fontWeight: FontWeight.bold),)
          ),
          Row(
            children: <Widget>[
              Icon(Icons.place,color: Color(0xff979797),size: 16.0,),
              SizedBox(width: 10.0,),
              Text("杭州市 西湖区 西溪印象城",style: TextStyle(fontSize: 14.0,color: Color(0xff979797)),)
            ],
          ),
          SizedBox(height: 10.0,),
          Row(
            children: <Widget>[
              Icon(Icons.timer,color: Color(0xff979797),size: 16.0,),
              SizedBox(width: 10.0,),
              Text("2019.04.20 17:00 —— 2019.4.21 01:00",style: TextStyle(fontSize: 14.0,color: Color(0xff979797)),)
            ],
          ),
          SizedBox(height: 10.0,),
          MyTag(items: tags,),
          SizedBox(height: 20.0,),
          Text('活动详情',style:TextStyle(fontSize: 18.0,fontWeight:FontWeight.bold)),
          SizedBox(height: 10.0,),
          Text("次活动以“善待地球·我爱我家”为主题，倡导每一位师生从生活 的小事做起，少制造垃圾、合理处理废弃物，用我们的实际行动 来维护绿色家园。"
          ,style: TextStyle(fontSize: 14.0,color: Color(0xff979797)),),
          SizedBox(height: 10.0,),
          RaisedButton(
            elevation: 4.0,
            onPressed: (){

            },
            shape:RoundedRectangleBorder(
              side: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(50))
            ),
            color: Color(0xffF74981),
            textColor: Colors.white,
            child: SizedBox(
              height: 48.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                Icon(Icons.chat_bubble_outline,size: 18.0,),
                Text('聊解',style: TextStyle(fontSize: 16.0),)
              ]),
            ),
            
          )
        ],
      ),
    );
  }
}

class HandleAppbar extends StatelessWidget {
  const HandleAppbar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.arrow_back_ios,color: Colors.white,),
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onPressed: (){
              Navigator.pop(context);                            
            },
          ),
          IconButton(icon:Icon(Icons.more_horiz,color: Colors.white),onPressed: (){
            showMenu(
              context: context,
              position: RelativeRect.fromLTRB(100.0, 85.0, 0.0, 0.0),
              items: <PopupMenuEntry<MoreOptions>>[
                const PopupMenuItem<MoreOptions>(
                value: MoreOptions.harder,
                child: Text('选项一'),
              ),
              const PopupMenuItem<MoreOptions>(
                value: MoreOptions.smarter,
                child: Text('选项二'),
              ),
              const PopupMenuItem<MoreOptions>(
                value: MoreOptions.selfStarter,
                child: Text('选项三'),
              ),
              const PopupMenuItem<MoreOptions>(
                value: MoreOptions.tradingCharter,
                child: Text('选项四'),
              ),
              ]
            );
          })
        ],
      ),
    );
  }
}
