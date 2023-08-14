import 'package:flutter/material.dart';
import 'package:raon_trip/page2.dart';

import 'main.dart';
//import 'package:flutter_kakao_map/flutter_kakao_map.dart';
//import 'package:flutter_kakao_map/kakao_maps_flutter_platform_interface.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: Scaffold(
        body: ListView(children: [
          info(),
        ]),
      ),
    );
  }
}

class info extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 390,
          height: 844,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(color: Colors.white),
          child: Stack(
            children: [
              Positioned(
                left: 151,
                top: 80,
                child: Text(
                  '에버랜드',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontFamily: 'Noto Sans',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Positioned(
                left: 35,
                top: 134,
                child: Container(
                  width: 320,
                  height: 240,
                  decoration: ShapeDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/everland.png"),
                      fit: BoxFit.fill,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 35,
                top: 134,
                child: Container(
                  width: 320,
                  height: 240,
                  decoration: ShapeDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/everland.png"),
                      fit: BoxFit.fill,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),

              Positioned(
                left: 50,
                top: 416,
                child: ElevatedButton(
                  onPressed: () {
                    // 해시태그 누르면 넘어갈 곳
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFE7E7E7),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 10), // 가로 방향 패딩을 추가
                  ),
                  child: Text(
                    '# 놀이공원',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      fontFamily: 'Noto Sans',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 50+30+47,
                top: 416,
                child: ElevatedButton(
                  onPressed: () {
                    // 해시태그 누르면 넘어갈 곳
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFE7E7E7),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 10), // 가로 방향 패딩을 추가
                  ),
                  child: Text(
                    '# 테마파크',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      fontFamily: 'Noto Sans',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),

              Positioned(
                left: 35,
                top: 380,
                child: Row( // '위치'와 텍스트를 나란히 배치하는 Row 위젯
                  children: [
                    Text(
                      '위치 : ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'Noto Sans',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      '경기도 용인시 에버랜드로 199',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'Noto Sans',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),

              Positioned(
                left: 35,
                top: 454,
                child: Container(
                  width: 320,
                  height: 240,
                  decoration: ShapeDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/map.png"),
                      fit: BoxFit.fill,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),

              Positioned(
                left: 35,
                bottom: 32,
                child: Container(
                  width: 324,
                  height: 15,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Page2()),
                          );
                        },
                        icon: Icon(Icons.search),
                        color: Colors.black,
                        iconSize: 20,
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MainPage()),
                          );
                        },
                        icon: Icon(Icons.home),
                        color: Colors.black,
                        iconSize: 20,
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MainPage()), // 마이페이지로 바꿀 것
                          );
                        },
                        icon: Icon(Icons.person),
                        color: Colors.black,
                        iconSize: 20,
                      ),
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      ],
    );
  }
}
