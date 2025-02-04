import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

// 1. 부모 클래스 생성 - SF(stateful)로 만들기
// 2. 부모 클래스가 Top - Bottom을 가지기
// 3. HomePage를 Stateless로 변경

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("HomePage");
    return Container(
      color: Colors.yellow,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Header(),
            Parent(),
          ],
        ),
      ),
    );
  }
}

class Parent extends StatefulWidget {
  const Parent({super.key});

  @override
  State<Parent> createState() => _ParentState();
}

class _ParentState extends State<Parent> {
  int num = 1;

  void add() {
    num++;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    print("----Top, Bottom의 공통부모----번호${num}-------");
    return Expanded(
      child: Column(
        children: [
          Expanded(child: Top(num: num)),
          Expanded(child: Bottom(add: add)),
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    print("Header");
    return Container(
      color: Colors.green,
      height: 200,
    );
  }
}

class Bottom extends StatelessWidget {
  // 행위
  Function add;

  Bottom({required this.add});

  @override
  Widget build(BuildContext context) {
    print("Bottom");
    return buildContainer();
  }

  Container buildContainer() {
    return Container(
      color: Colors.blue,
      child: Align(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
          onPressed: () {
            add();
          },
          child: Text(
            "증가",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 100,
            ),
          ),
        ),
      ),
    );
  }
}

class Top extends StatelessWidget {
  const Top({
    super.key,
    required this.num,
  });

  final int num;

  @override
  Widget build(BuildContext context) {
    print("Top");
    return Container(
      color: Colors.red,
      child: Align(
        child: Text(
          "${num}",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 100,
              decoration: TextDecoration.none),
        ),
      ),
    );
  }
}
