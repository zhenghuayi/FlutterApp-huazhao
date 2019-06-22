
import 'package:flutter/material.dart';

class MyOption extends StatefulWidget {
  final List<OptionItem> items;
  ValueChanged onTap;
  int currentIndex;
  MyOption({
    Key key,
    @required this.items,
    this.onTap,
    this.currentIndex=0
  }):assert(items!=null),
    assert(items.length >= 2),
    assert(
      items.every((OptionItem item) => item.label != null && item.value != null ) == true,
    ),
    super(key:key);

  @override
  _MyOptionState createState() => _MyOptionState();
}

class _MyOptionState extends State<MyOption> with TickerProviderStateMixin{
  List<Widget> _initWidget;//最顶层文字
  List<Widget> _initCover;//切换的tab
  AnimationController _tabController;
  Animation _tabAnimation;
  double offset;
  void reset(){
    _initCover=List.generate(widget.items.length, (int index){
      if(index==0){
        return Expanded(
          child: FractionalTranslation(
            translation: Offset(offset, 0),
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xffF74981),
                borderRadius: BorderRadius.all(Radius.circular(15.0))
              ),
            ),
          )
        );
      }else{
        return Expanded(child: Container());
      }
    });
    _initWidget=List.generate(widget.items.length, (int index){
      return OptionTile(
        item:widget.items[index],
        onTap:(){
          setState(() {
            _tabAnimation=Tween(begin:widget.currentIndex.toDouble(),end:index.toDouble()).animate(_tabController);
            widget.currentIndex=index;
            if(widget.onTap != null){
              widget.onTap(widget.items[index].value);
              _tabController..forward(from: 0.0);
            }
            reset();
          });
        },
        selected: index == widget.currentIndex
      );
    });
  }
  @override
  void initState() {
    offset=widget.currentIndex.toDouble();
    _tabController=AnimationController(
      duration: Duration( milliseconds: 300),
      vsync: this
    );
    _tabAnimation=Tween(begin: 0.0,end: 3.0).animate(_tabController)
    ..addListener((){
      setState(() {
        offset=_tabAnimation.value;
        reset();
      });
    });
    reset();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
        color: Color(0xffffecf2),
      ),
      child: Stack(
        children: <Widget>[
          Row(children: _initCover),
          Row(children: _initWidget,)
        ],
      ),
    );
  }
}

class OptionTile extends StatelessWidget {
  final OptionItem item;
  final VoidCallback onTap;
  final bool selected;
  // final bool first;
  // final bool end;
  const OptionTile({
    this.item,
    this.onTap,
    this.selected,
    // this.first,
    // this.end
  });
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
      onTap:onTap,
      child:Container(
          alignment: Alignment.center,
          decoration:BoxDecoration(
            borderRadius: BorderRadius.horizontal(left:Radius.circular(15.0), right:Radius.circular(15.0)),
            // color:selected? Color(0xffF74981):Color.fromRGBO(0, 0, 0, 0.0)
          ),
          child:Text(item.label,style:TextStyle(fontSize:16.0,color:selected?Colors.white:Color(0xffF74981)),)
        ), 
      ),
    );
  }
}


class OptionItem{
  final String label;
  final String value;
  const OptionItem({
    @required this.label,
    @required this.value
  });
}