import 'package:flutter/material.dart';
import 'package:huazhao/pages/release/release.dart';

class MyBottomBar extends StatefulWidget {
  int currentIndex;
  final onTap;
  MyBottomBar({
    this.currentIndex=0,
    this.onTap
  });
  @override
  _MyBottomBarState createState() => _MyBottomBarState();
}

class _MyBottomBarState extends State<MyBottomBar> {
  @override
  Widget build(BuildContext context) {
    return 
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
          width: 80.0,
          height: 80.0,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100.0),
            color: Colors.white
          ),
          child: Container(
            width: 70.0,
            height: 70.0,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100.0),
              color: Color.fromARGB(1, 250, 122, 163).withOpacity(0.1)
            ),
            child: Container(
              width: 60.0,
              height: 60.0,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100.0),
                color: Color.fromARGB(1, 250, 122, 163).withOpacity(0.2)
              ),
              child:Container(
                width: 50.0,
                height: 50.0,
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