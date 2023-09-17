// import 'dart:js';
import 'package:flutter/material.dart';
import 'package:raon_trip/page2.dart';
import 'package:raon_trip/info.dart';
import 'package:raon_trip/page4.dart';
import 'package:raon_trip/page6.dart';
import 'main.dart';
// import 'package:raon_trip/test.dart';
import 'package:kakao_map_plugin/kakao_map_plugin.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

// 내국인 인기 지역 리스트
// 이미지 받아오기
final List<String> imagePaths = [
  'assets/images/everland.png',
  'assets/images/jongro.png',
  'assets/images/everland.png',
  'assets/images/jongro.png',
  'assets/images/everland.png',
];

// 지역 이름 받아오기
final List<String> regionNames = [
  '#경기도 용인시',
  '#서울특별시 종로구',
  '#울산광역시 북구 강동동',
  '#4',
  '#5',
];

// 외국인 인기 지역 리스트
// 이미지 받아오기
final List<String> imagePathsf = [
  'assets/images/everland.png',
  'assets/images/jongro.png',
  'assets/images/everland.png',
  'assets/images/jongro.png',
  'assets/images/everland.png',
];

// 지역 이름 받아오기
final List<String> regionNamesf = [
  '#경기도 수원시',
  '#서울특별시 마포구',
  '#3',
  '#4',
  '#5',
];

void main() async {
  await dotenv.load(fileName: 'assets/env/.env');
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
      home: Scaffold(
        appBar: AppBar(
          title: Text('라온트립',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 24,
              )),
          backgroundColor: Colors.white,
          elevation: 0,

          // foregroundColor: Colors.white,
        ),
        body: Iphone1313Pro1(),
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "search"),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "mypage")
          ],
          backgroundColor: Colors.white,
          fixedColor: Colors.black,
          unselectedItemColor: Colors.black,
          elevation: 0,
        ),
      ),
    );
  }
}

class Iphone1313Pro1 extends StatefulWidget {
  @override
  _Iphone1313Pro1State createState() => _Iphone1313Pro1State();
}

class _Iphone1313Pro1State extends State<Iphone1313Pro1> {
  bool isPopupVisible = true;

  int _selectedIndex = 0;

  final List<Widget> pages = <Widget>[Page2(), MainPage(), Page2()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          // width: 390,
          // height: 844,
          // clipBehavior: Clip.antiAlias,
          // decoration: BoxDecoration(color: Colors.white),
          child: Stack(
            children: [
              Positioned(
                left: 32,
                top: 48,
                child: Text(
                  '외국인 인기 명소',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'Noto Sans',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Positioned(
                left: 32,
                top: 347,
                child: Text(
                  '내국인 인기 명소',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'Noto Sans',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Positioned(
                left: 30,
                top: 93,
                child: Container(
                  //width: 360,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(imagePathsf.length, (index) {
                        return Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: _buildButtonWithImagef(
                              imagePathsf[index], regionNamesf[index]),
                        );
                      }),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 30,
                top: 392,
                child: Container(
                  //width: 360,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(imagePaths.length, (index) {
                        return Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: _buildButtonWithImage(
                              imagePaths[index], regionNames[index]),
                        );
                      }),
                    ),
                  ),
                ),
              ),
              if (isPopupVisible)
                PopupWidget(
                  onClose: () {
                    setState(() {
                      isPopupVisible = false;
                    });
                  },
                ),
            ],
          ),
        ),
      ],
    );
  }
}

// 내국인
Widget _buildButtonWithImage(String imagePath, String regionName) {
  return Container(
    width: 200,
    height: 200,
    child: Stack(
      children: [
        Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        Positioned(
          left: 0,
          top: 0,
          child: Container(
            width: 200,
            height: 200,
            decoration: ShapeDecoration(
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.fill,
                colorFilter: ColorFilter.mode(
                  Colors.white.withOpacity(0.5), // 투명도
                  BlendMode.dstATop,
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
        Positioned(
          left: 0,
          top: 0,
          right: 0,
          bottom: 0,
          child: Center(
            child: Text(
              regionName,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontFamily: 'Noto Sans',
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

// 외국인
Widget _buildButtonWithImagef(String imagePathf, String regionNamef) {
  return Container(
    width: 200,
    height: 200,
    child: Stack(
      children: [
        Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        Positioned(
          left: 0,
          top: 0,
          child: Container(
            width: 200,
            height: 200,
            decoration: ShapeDecoration(
              image: DecorationImage(
                image: AssetImage(imagePathf),
                fit: BoxFit.fill,
                colorFilter: ColorFilter.mode(
                  Colors.white.withOpacity(0.5), // 투명도
                  BlendMode.dstATop,
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
        Positioned(
          left: 0,
          top: 0,
          right: 0,
          bottom: 0,
          child: Center(
            child: Text(
              regionNamef,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontFamily: 'Noto Sans',
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

class PopupWidget extends StatelessWidget {
  final VoidCallback onClose;

  PopupWidget({required this.onClose});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Color.fromRGBO(0, 0, 0, 0.5), // 반투명한 배경색
      child: Center(
        child: Container(
          width: 200,
          height: 150,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "언어 선택",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: 'Noto Sans',
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // 첫 번째 버튼에 대한 동작 수행
                  onClose(); // 팝업 닫기
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.green, // Change the button color here
                  onPrimary: Colors.white, // Change the text color here
                ),
                child: Text(
                  "English",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Noto Sans',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => InfoPage()), // 마이페이지로 바꿀 것
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.green, // Change the button color here
                  onPrimary: Colors.white, // Change the text color here
                ),
                child: Text(
                  "한국어",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Noto Sans',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
