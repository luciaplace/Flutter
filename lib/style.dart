import 'package:flutter/material.dart';

/* 이 dart 파일 안에서만 쓰고싶은 변수가 있는 경우에는 변수명 앞에 _를 붙여준다. */

var _age = 20;
var _data = 'john';

var theme = ThemeData(
    iconTheme: IconThemeData(color: Colors.red, size: 60 //모든 아이콘에 대한 스타일
        ),
    elevatedButtonTheme: ElevatedButtonThemeData(style: ButtonStyle()),
    appBarTheme: AppBarTheme(
        // 앱바에 대한 스타일
        color: Colors.grey),
    textTheme: TextTheme(bodyText2: TextStyle(color: Colors.blue)),
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
            primary: Colors.black, backgroundColor: Colors.orange)),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        elevation: 2,
        selectedItemColor: Colors.black
    )
    ); // 위젯의 스타일을 넣을 수 있는 공간.
