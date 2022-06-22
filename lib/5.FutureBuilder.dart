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
  var map = {'name': 'john', 'age': 20};
  var data = [];

  getData() async {
    var result = await http
        .get(Uri.parse('https://codingapple1.github.io/app/data.json'));
    var result2 = jsonDecode(result.body);
    setState(() {
      data = result2; //data변수에 get 방식으로 받아온 Json 값을 저장.
    });
  }

  @override
  void initState() {
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
      body: Home2(data: data),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false,
        showSelectedLabels: false,
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




class Home2 extends StatelessWidget {
  const Home2({Key? key, this.data}) : super(key: key);

  final data;

  @override
  Widget build(BuildContext context) {
    if (data.isNotEmpty) {
      return ListView.builder(
        itemCount: data.length,
        itemBuilder: (c, i) {
          return Column(
            children: [
              Container(
                constraints: BoxConstraints(maxWidth: 600),
                padding: EdgeInsets.all(20),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(data[i]['image']),
                    Text('좋아요'),
                    Text('글쓴이'),
                    Text('글내용')
                  ],
                ),
              )
            ],
          );
        },
      );
    } else {
      return Text('Loading');
    }
  }
}
