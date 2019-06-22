import 'package:flutter/material.dart';
import 'package:huazhao/widgets/shine_icon.dart';
import '../activityDetail/activityDetail_page.dart';

class ActivityCard extends StatefulWidget {
  @override
  _ActivityCardState createState() => _ActivityCardState();
}

class _ActivityCardState extends State<ActivityCard> {
  List<Widget> _cardList=[];
  double distance=0.0;
  void returnDistance(val){
    setState(() {
      if(val>0)distance=val;
      else{
        distance=-val;
      }
      resetSecond();
    });
  }
  void nextCard(val){
    distance=0.0;
    images.removeAt(0);
    resetWidget();
    
  }
  List images=[
    "http://5b0988e595225.cdn.sohucs.com/images/20190112/05a890f6d5de4a10b62f3bae966bbaa4.png",
    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1560168426866&di=7ad6cb4cbb9473cc78869d747c66a61e&imgtype=0&src=http%3A%2F%2Fimg.mp.sohu.com%2Fq_mini%2Cc_zoom%2Cw_640%2Fupload%2F20170811%2Fd79fa636c88d4c46ba52151cc2c3d48a_th.jpg",
    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1560168447832&di=6a7767049130b1de41e4ee1b1d2b8534&imgtype=0&src=http%3A%2F%2Fmmbiz.qpic.cn%2Fmmbiz_jpg%2FYWyNMtoMxndfRvnaRNfRUVG3Bj0Kn6ZsN6Eoam1crmReDxibKC9bW0UPnH5LUUPiasGmHib4jGVJArMlib7C5VSa2g%2F640%3Fwx_fmt%3Djpeg",
    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1560168465223&di=7ed191ad4ad56c738d398474f1f02fa8&imgtype=0&src=http%3A%2F%2Fimg.mp.itc.cn%2Fq_mini%2Cc_zoom%2Cw_640%2Fupload%2F20170706%2Fd0d1ffcda3d142d790249c1911fbe4d0_th.jpg"
  ];
  void resetWidget(){
    print('执行reset');
    _cardList=[];
    // setState(() {
      if(images.length>0){
          _cardList.insert(0,MyCard(
            activeUrl: images[0],
            callbackDistance: (value)=>returnDistance(value),
            callbackNextCard:(value)=>nextCard(value)
          ));
          _cardList.insert(0, MyCard(
            activeUrl: images[1],
            sizePadding: distance,
            callbackDistance: (value)=>returnDistance(value),
            callbackNextCard:(value)=>nextCard(value)
          ));
          // _cardList.insert(0,Padding(
          //   padding: EdgeInsets.all(distance>100?15.0:distance==0?100.0:100.0/distance+15.0),
          //   child: Image.network(
          //     images[1],
          //     fit: BoxFit.cover,
          //     width: double.infinity,
          //     height: double.infinity,
          //   ),
          // ));
      }
      print(_cardList);
    // });
  }
  void resetSecond(){
    setState(() {
      if(_cardList.length==2){
        // _cardList[0]=Padding(
        //   padding: EdgeInsets.all(distance>85.0?15.0:distance==0?85.0:100.0-distance),
        //   child: Image.network(
        //     images[1],
        //     fit: BoxFit.cover,
        //     width: double.infinity,
        //     height: double.infinity,
        //   ),
        // )
        _cardList[0]=MyCard(
          activeUrl: images[1],
          sizePadding: distance,
          callbackDistance: (value)=>returnDistance(value),
          callbackNextCard:(value)=>nextCard(value)
        );
      }
    });
  }
  // void resetNext(){
  //   _cardList.insert(0,MyCard(
  //     activeUrl: images[0],
  //     callbackDistance: (value)=>returnDistance(value),
  //     callbackNextCard:(value)=>nextCard(value)
  //   ));
  //   _cardList.insert(0,MyCard(
  //     activeUrl: images[1],
  //     callbackDistance: (value)=>returnDistance(value),
  //     callbackNextCard:(value)=>nextCard(value)
  //   ));
  // }
  @override
  void initState() {
    // _cardList=images.map((item)=>MyCard(url: item,)).toList();
    resetWidget();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: _cardList,
    );
  }
}
class MyCard extends StatefulWidget {
  String activeUrl;
  double sizePadding;
  final callbackDistance;
  final callbackNextCard;
  MyCard({
    Key key,
    this.activeUrl,
    this.sizePadding,
    this.callbackDistance,
    this.callbackNextCard
  }):super(key:key);
  @override
  _MyCardState createState() => _MyCardState();
}

class _MyCardState extends State<MyCard>  with TickerProviderStateMixin{
  
  double distance=0.0;
  AnimationController _cardLeaveController;
  Animation _cardLeaveAnimation;
  @override
  void initState() {
    _cardLeaveController=AnimationController(
      duration: Duration( milliseconds: 5000),
      vsync: this
    );
    _cardLeaveAnimation=Tween(begin: distance,end: distance+100.0).animate(_cardLeaveController);
    _cardLeaveAnimation.addListener((){
      setState(() {
        distance=_cardLeaveAnimation.value;
      });
    });
    _cardLeaveController.addListener(() {
      if(_cardLeaveController.status==AnimationStatus.completed){
        setState((){
          widget.callbackNextCard('111');
        });
      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (context)=>ActivityDetail()
        ));
      },
      onHorizontalDragStart: (value){
        setState(() {
          print(distance);
          distance=0;
        });
      },
      onHorizontalDragUpdate: (value){
        setState(() {
          distance+=value.delta.dx;
          widget.callbackDistance(distance);
        });
      },
      onHorizontalDragEnd: (value){
        setState(() {
          if(distance > -100.0 && distance < 100.0)distance=0.0;
          else{
            _cardLeaveAnimation=Tween(begin: distance,end: distance>0?distance+1000.0:distance-1000).animate(_cardLeaveController);
            _cardLeaveController..forward(from: 0.0);
          }
        });
      },
      child: Transform.rotate(
        angle:distance/1800.0,
        alignment:Alignment(0.0, 5.5),
        child: Padding(
          padding: EdgeInsets.all(widget.sizePadding==null?15.0:widget.sizePadding>85.0?15.0:widget.sizePadding==0?85.0:100.0-widget.sizePadding),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child:Container(
              alignment: Alignment.center,
              width:double.infinity,
              height:double.infinity,
              decoration: BoxDecoration(
                border: Border.all(width: 2.0),
                image: DecorationImage(
                  image: NetworkImage(widget.activeUrl),
                  fit: BoxFit.cover
                ),
                color: Colors.black
              ),
              child: Container(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text('一起看电影',style:TextStyle(color: Colors.white)),
                    ShineIcon(
                      onTap: (status){
                        print(status);
                      },
                    ),
                  ],
                )
              ),
            )
          ),
        ),
      ),
    );
  }
}

class TestNotification extends Notification {
TestNotification({
  @required this.status,
});

final bool status;
}