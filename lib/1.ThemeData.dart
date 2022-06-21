import 'package:flutter/material.dart';

/*스타일의 경우 중복이 발생한 경우 물리적으로 가까운 스타일을 먼저 적용한다. */

void main() {
  runApp(MaterialApp(
      theme: ThemeData(
        iconTheme: IconThemeData(color: Colors.red, size: 60 //모든 아이콘에 대한 스타일
        ),
        appBarTheme: AppBarTheme( // 앱바에 대한 스타일
          color: Colors.grey
        ),
        textTheme: TextTheme(
          bodyText2: TextStyle(
            color: Colors.blue
          )
        )
      ), // 위젯의 스타일을 넣을 수 있는 공간.
      home: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  var text1 = TextStyle(color:Colors.red);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Text('글자', style: text1,),
      bottomNavigationBar: BottomAppBar(),
    );
  }
}
