import 'package:flutter/material.dart';
import 'package:raon_trip/main_test.dart';
import 'package:raon_trip/page2.dart';
import 'package:raon_trip/info.dart';
import 'package:raon_trip/page4.dart';
import 'package:raon_trip/page6.dart';
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
  // await dotenv.load(fileName: 'assets/env/.env.sample');
  // AuthRepository.initialize(appKey: dotenv.env['APP_KEY'] ?? '');
  AuthRepository.initialize(appKey: '7decdea914383cf8fb08fd059df86520');
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
  bool isPopupVisible = true;

  int currentIndex = 0;

  final screens = [
    //이게 하나하나의 화면이되고, Text등을 사용하거나, dart파일에 있는 class를 넣는다.
    Page2(),
    MainTest(),
    InfoPage(),
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

        items: [
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "search"),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "mypage")
        ],
      ),
    );
  }
}

// class PopupWidget extends StatelessWidget {
//   final VoidCallback onClose;
//
//   PopupWidget({required this.onClose});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       height: double.infinity,
//       color: const Color.fromRGBO(0, 0, 0, 0.5), // 반투명한 배경색
//       child: Center(
//         child: Container(
//           width: 200,
//           height: 200,
//           color: Colors.white,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const Text(
//                 "언어 선택",
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 20,
//                   fontFamily: 'Noto Sans',
//                   fontWeight: FontWeight.w700,
//                 ),
//               ),
//               const SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   // 첫 번째 버튼에 대한 동작 수행
//                   onClose(); // 팝업 닫기
//                 },
//                 style: ElevatedButton.styleFrom(
//                   primary: Colors.green, // Change the button color here
//                   onPrimary: Colors.white, // Change the text color here
//                 ),
//                 child: const Text(
//                   "English",
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 16,
//                     fontFamily: 'Noto Sans',
//                     fontWeight: FontWeight.w400,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 10),
//               ElevatedButton(
//                 onPressed: () {
//                   // Navigator.push(
//                   //   context,
//                   //   MaterialPageRoute(
//                   //       builder: (context) => Page2()), // 마이페이지로 바꿀 것
//                   // );
//                   onClose(); // 팝업 닫기
//                 },
//                 style: ElevatedButton.styleFrom(
//                   primary: Colors.green, // Change the button color here
//                   onPrimary: Colors.white, // Change the text color here
//                 ),
//                 child: const Text(
//                   "한국어",
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 16,
//                     fontFamily: 'Noto Sans',
//                     fontWeight: FontWeight.w400,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
