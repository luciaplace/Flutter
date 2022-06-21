import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'style.dart' as style;
import 'dart:convert'; //Json 파일을 일반 자료형으로 변환을 도와준다.
/*스타일의 경우 중복이 발생한 경우 물리적으로 가까운 스타일을 먼저 적용한다. */

void main() {
  runApp(MaterialApp(theme: style.theme, home: MyApp()));
}
//Get요청 보내기


class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var tab = 0;
  var map ={'name':'john','age':20};

  getData() async{
    var result = await http.get( Uri.parse('https://codingapple1.github.io/app/data.json'));
    var result2 = jsonDecode(result.body);
    if(result.statusCode == 200){
      print(result2);
    }else{
      throw Exception('Connection Failed');
    }
  }

  @override
  void initState(){
    super.initState();
    getData();

  }

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
      body: Home(),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false,
        showSelectedLabels: false,
        currentIndex: tab,
        onTap: (i) {
          setState(() {
            print(i);
            tab = i;
          });
        },
        items: [
          BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home)),
          BottomNavigationBarItem(
              label: 'Shop',
              icon: Icon(Icons.shopping_bag_outlined),
              activeIcon: Icon(Icons.shopping_bag))
        ],
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount: 3, itemBuilder: (c, i) {
      return Column(
        children: [
          Image.network('https://codingapple1.github.io/kona.jpg'),
          Container(
            constraints: BoxConstraints(maxWidth: 600),
            padding: EdgeInsets.all(20),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('좋아요'),
                Text('글쓴이'),
                Text('글내용')

              ],
            ),
          )
        ],
      );
    },);
  }
}
