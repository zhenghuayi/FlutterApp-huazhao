import 'package:flutter/material.dart';
import 'swipe_card.dart';

class PeopleNearbyPage extends StatefulWidget {
  static const name = 'PeopleNearby page';

  @override
  _PeopleNearbyPageState createState() => _PeopleNearbyPageState();
}

class _PeopleNearbyPageState extends State<PeopleNearbyPage> {
  List images=[
    "http://5b0988e595225.cdn.sohucs.com/images/20190112/05a890f6d5de4a10b62f3bae966bbaa4.png",
    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1560168426866&di=7ad6cb4cbb9473cc78869d747c66a61e&imgtype=0&src=http%3A%2F%2Fimg.mp.sohu.com%2Fq_mini%2Cc_zoom%2Cw_640%2Fupload%2F20170811%2Fd79fa636c88d4c46ba52151cc2c3d48a_th.jpg",
    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1560168447832&di=6a7767049130b1de41e4ee1b1d2b8534&imgtype=0&src=http%3A%2F%2Fmmbiz.qpic.cn%2Fmmbiz_jpg%2FYWyNMtoMxndfRvnaRNfRUVG3Bj0Kn6ZsN6Eoam1crmReDxibKC9bW0UPnH5LUUPiasGmHib4jGVJArMlib7C5VSa2g%2F640%3Fwx_fmt%3Djpeg",
    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1560168465223&di=7ed191ad4ad56c738d398474f1f02fa8&imgtype=0&src=http%3A%2F%2Fimg.mp.itc.cn%2Fq_mini%2Cc_zoom%2Cw_640%2Fupload%2F20170706%2Fd0d1ffcda3d142d790249c1911fbe4d0_th.jpg"
  ];
  List<Widget> _widgets = [];
  int initIndex = 4;
  void initState() {
    super.initState();
    _widgets = _buildWidgets(initIndex);
  }

  List<Widget> _buildWidgets(int count) {
    List<Widget> widgets = [];
    for (int index=0; index < count; index++) {
      widgets.add(
        Padding(
          padding: EdgeInsets.all(20.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(width: 3.0),
                color: Colors.grey[500],
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                image: DecorationImage(
                  image: NetworkImage(images[index]),
                  fit: BoxFit.cover
                )
              ),
              child: Center(
                child: Text('$index', style: TextStyle(fontSize: 40.0),),
              ),
            ),
          ),
        )
      );
    }
    return widgets;     
  }

  Widget _generateWidget() {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: ClipRRect(
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
          child: Center(
            child: Text('${initIndex++}', style: TextStyle(fontSize: 40.0),),
          ),
        ),
      ),
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
