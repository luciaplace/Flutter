import 'package:flutter/material.dart';
import 'style.dart' as style;
/*스타일의 경우 중복이 발생한 경우 물리적으로 가까운 스타일을 먼저 적용한다. */

void main() {
  runApp(MaterialApp(theme: style.theme, home: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  var text1 = TextStyle(color: Colors.red);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Instagram'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.add_box_outlined),
              iconSize: 30,
            )
          ],
        ),
        body:Text('Hi'),
        /*
        Theme 안의 textTheme을 가져다가 쓰기

        Text('Hi', style: Theme.of(context).textTheme.bodyText2,),

         하기와 같은 코드는 해당 컨테이너 내의 테마를 지정한다.

        Theme(data: ThemeData(
            textTheme: TextTheme(bodyText2: TextStyle(color: Colors.blue))),
          child: Container(
            child: Text('Hi'),
          ),
        ),*/
        bottomNavigationBar: BottomAppBar(),);
  }
}
