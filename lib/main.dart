import 'package:flutter/material.dart';
import 'package:raon_trip/main_test.dart';
import 'package:raon_trip/page2.dart';
import 'package:raon_trip/info.dart';
import 'package:raon_trip/mypage.dart';
import 'package:kakao_map_plugin/kakao_map_plugin.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  AuthRepository.initialize(appKey: dotenv.env['APP_KEY'] ?? '');
  WidgetsFlutterBinding.ensureInitialized(); // 필요한 초기화 부분입니다.
  runApp(const MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
        ),
        home: Iphone1313Pro1());
  }
}

class Iphone1313Pro1 extends StatefulWidget {
  @override
  _Iphone1313Pro1State createState() => _Iphone1313Pro1State();
}

class _Iphone1313Pro1State extends State<Iphone1313Pro1> {
  int currentIndex = 1;
  final screens = [
    //이게 하나하나의 화면이되고, Text등을 사용하거나, dart파일에 있는 class를 넣는다.
    Page2(),
    MainTest(),
    myPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) =>
            setState(() => currentIndex = index), //setState를 써야 바뀐다.

        showSelectedLabels: false,
        showUnselectedLabels: false,

        backgroundColor: Colors.white,
        fixedColor: Colors.black,
        unselectedItemColor: Colors.black,
        elevation: 0,

        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "search"),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "mypage")
        ],
      ),
    );
  }
}
