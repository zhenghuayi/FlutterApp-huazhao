import 'package:flutter/material.dart';
import 'package:huazhao/widgets/option.dart';
import 'package:huazhao/pages/home/activity/activity_card_page.dart';
import 'package:huazhao/pages/home/people_nearby/people_nearby_page.dart';
import '../choose/choose_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin{
  int current=0;
  List<Widget> _homePages=[];
  PageController _pageController=PageController();
  Widget HomeAppBar(){
    return AppBar(
      centerTitle: true,
      elevation: 0.0,
      title: Container(
        width: 200.0,
        child: MyOption(
          items:[
            OptionItem(label: "活动",value: '0'),
            OptionItem(label: "附近的人",value: '1'),
          ],
          onTap: (i){
            _pageController.jumpToPage(
              int.parse(i),
            );
          },
        ),
      ),
      leading:Container(
        padding: EdgeInsets.only(left: 15.0),
        child: GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(
              builder: (context)=>Choose()
            ));
          },
          child: Row(
            children: <Widget>[
              Text('筛选',style: TextStyle(fontSize: 14.0)),
              Icon(Icons.arrow_drop_down)
            ],
          ),
        ),
      ),
      actions: <Widget>[
        IconButton(icon: Text(''),)
      ],
    );
  }
 
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    _homePages..add(ActivityCardPage())..add(PeopleNearbyPage());

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: HomeAppBar(),
      body:PageView.builder(
        physics: NeverScrollableScrollPhysics(),
        controller:_pageController,
        onPageChanged: _onPageChanged,
        itemCount: 2,
        itemBuilder:(BuildContext context,int index){
          return _homePages[current];
        },
      )
    );
  }
  void _onPageChanged(int index){
    current=index;
  }
}

