import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class PersonalDetail extends StatefulWidget {
  @override
  _PersonalDetailState createState() => _PersonalDetailState();
}

class _PersonalDetailState extends State<PersonalDetail> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    super.initState();
  }

  final List images=[
    'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1555481308968&di=e71ff66e841a2728f3d150adb6a37233&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201805%2F29%2F20180529014237_eYsZ4.thumb.700_0.jpeg',
    'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1555759500495&di=1b4fa64d9643c7c14f7e71023b1563a8&imgtype=0&src=http%3A%2F%2Fn.sinaimg.cn%2Fsinacn20113%2F291%2Fw1076h1615%2F20190329%2Fdd7d-huxwryv7129057.jpg',
    'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1555759565223&di=b3d1d345f43b8e2601a4dd72732d583a&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201805%2F14%2F20180514205117_S4YdB.jpeg'
  ];
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
  List tags=["线下","双人","电影","红包200","发起者请","邀请男性"];
  @override
  Widget build(BuildContext context) {
    List<Widget> tagList=[];
    for (var item in tags) {
      tagList.add(
        Container(
          padding: EdgeInsets.fromLTRB(5.0, 0, 5.0, 0),
          margin: EdgeInsets.fromLTRB(5.0, 0, 0, 0),
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.horizontal(left:Radius.circular(8.0), right:Radius.circular(8.0)),
          ),
          child:Text(item,style: TextStyle(color: Colors.white,fontSize:14.0,decoration: TextDecoration.none))
        )
      );
    }
    return Stack(
      alignment: FractionalOffset.topCenter,
      children: <Widget>[
        Container(
          color: Colors.white,
          child:ListView(
            children: <Widget>[
              // 轮播图部分
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height-MediaQuery.of(context).padding.top,
                decoration: BoxDecoration(
                  borderRadius:BorderRadius.circular(15.0)
                ),
                child:Hero(
                  tag:'photo',
                  child: Swiper(
                    viewportFraction: 1,
                    scale: 1,
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
                    onTap: (index){},
                  )
                )
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Wrap(
                          spacing: 10.0,
                          crossAxisAlignment: WrapCrossAlignment.end,
                          children: <Widget>[
                            Text('Mona',style: TextStyle(color:Colors.black,fontSize:22.0,decoration: TextDecoration.none,fontWeight:FontWeight.normal),),
                            Text('年龄',style: TextStyle(color:Colors.black,fontSize:14.0,decoration: TextDecoration.none,fontWeight:FontWeight.normal),),
                            Text('认证',style: TextStyle(color:Colors.black,fontSize:14.0,decoration: TextDecoration.none,fontWeight:FontWeight.normal),),
                            Text('独角兽',style: TextStyle(color:Colors.black,fontSize:14.0,decoration: TextDecoration.none,fontWeight:FontWeight.normal),),
                          ]
                        ),
                        Icon(Icons.favorite,size: 32.0,)
                      ]
                    ),
                    
                    Wrap(
                      spacing: 10.0,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: <Widget>[
                        Text('2天前',style: TextStyle(color:Colors.black,fontSize:14.0,decoration: TextDecoration.none,fontWeight:FontWeight.normal),),
                        Text('3km',style: TextStyle(color:Colors.black,fontSize:14.0,decoration: TextDecoration.none,fontWeight:FontWeight.normal),),
                      ]
                    ),
                    Container(
                      margin: EdgeInsets.only(top:5.0),
                      child:Text('发布20 | 参加30',style: TextStyle(color:Colors.black,fontSize:14.0,decoration: TextDecoration.none,fontWeight:FontWeight.normal))
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0,5.0,0,10),
                      child:Text('签名：啦啦啦的撒贾师傅骄傲了啦啦啦的撒贾师傅骄傲了啦啦啦的撒贾师傅骄傲了啦啦啦的撒贾师傅骄傲了啦啦啦的撒贾师傅骄傲了',style: TextStyle(color:Colors.black,fontSize:14.0,decoration: TextDecoration.none,fontWeight:FontWeight.normal))
                    ),
                    Wrap(
                      spacing: 10.0,
                      runSpacing: 10.0,
                      children:tagList
                    ),
                    new Divider()
                  ],
                )
              )
            ]
          ),
        ),
        Container(
          height: 56.0+MediaQuery.of(context).padding.top,
          padding: EdgeInsets.only(top:MediaQuery.of(context).padding.top),
          child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              GestureDetector(
                child:Container(
                  width: 56.0,
                  child:Icon(Icons.arrow_back_ios),
                ),
                onTap: (){
                  Navigator.pop(context);
                },
              ),
              Text('我的主页',style: TextStyle(color:Colors.black,fontSize:16.0,decoration: TextDecoration.none,fontWeight:FontWeight.normal)),
              Container(
                width: 56.0,
                child:Icon(Icons.more_horiz),
              )
            ],
          )
        )
    ]);
  }
}