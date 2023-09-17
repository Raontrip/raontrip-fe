import 'package:flutter/material.dart';

import 'package:raon_trip/search_hash.dart';
import 'package:raon_trip/search_name.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RaonTrip',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: const MyHomePage(title: '라온 트립'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController? controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        title: Text('검색'),
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.w700,
        ),
        backgroundColor: Colors.white,
        //centerTitle: true, // 중앙 정렬
        elevation: 0.0,

        bottom: TabBar(
          tabs: <Tab>[
            Tab(
              //icon: Icon(Icons.looks_one, color: Colors.blue),
              text: "해시태그",
            ),
            Tab(
              // icon: Icon(Icons.looks_two, color: Colors.blue),
              text: "지역/장소명",
            )
          ],
          controller: controller,
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: <Widget>[FirstApp(), SecondApp()],
      ),
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
    );

    // Container(
    //   //width: 390,
    //   //height: 844,
    //   clipBehavior: Clip.antiAlias,
    //   decoration: BoxDecoration(color: Colors.white),
    //   child: Stack(
    //     children: [
    //       // Positioned(
    //       //   left: 32,
    //       //   top: 80,
    //       //   child: Text(
    //       //     '검색',
    //       //     style: TextStyle(
    //       //       color: Colors.black,
    //       //       fontSize: 24,
    //       //       fontFamily: 'Inter',
    //       //       fontWeight: FontWeight.w700,
    //       //     ),
    //       //   ),
    //       // ),
    //       Positioned(
    //         left: 34,
    //         top: 0,
    //         child: Text(
    //           '해시태그',
    //           style: TextStyle(
    //             color: Color(0xFF979797),
    //             fontSize: 16,
    //             fontFamily: 'Noto Sans',
    //             fontWeight: FontWeight.w400,
    //           ),
    //         ),
    //       ),
    //       Positioned(
    //         left: 111,
    //         top: 0,
    //         child: Text(
    //           '지역/장소명',
    //           style: TextStyle(
    //             color: Colors.black,
    //             fontSize: 16,
    //             fontFamily: 'Noto Sans',
    //             fontWeight: FontWeight.w400,
    //           ),
    //         ),
    //       ),
    //       Positioned(
    //         left: 55,
    //         top: 193,
    //         child: TextButton(
    //           onPressed: () {
    //             Navigator.pushNamed(context, '/fourth');
    //           },
    //           child: const Text('에버랜드'),
    //         ),
    //         // child: Text(
    //         //   '에버랜드',
    //         //   style: TextStyle(
    //         //     color: Color(0xFF979797),
    //         //     fontSize: 16,
    //         //     fontFamily: 'Noto Sans',
    //         //     fontWeight: FontWeight.w400,
    //         //   ),
    //         // ),
    //       ),
    //       Positioned(
    //         left: 110,
    //         top: 24,
    //         child: Container(
    //           width: 82,
    //           decoration: ShapeDecoration(
    //             shape: RoundedRectangleBorder(
    //               side: BorderSide(
    //                 width: 1,
    //                 strokeAlign: BorderSide.strokeAlignCenter,
    //               ),
    //             ),
    //           ),
    //         ),
    //       ),
    //       Positioned(
    //         left: 32,
    //         top: 43,
    //         child: SizedBox(
    //           width: 327,
    //           height: 42,
    //           child: Stack(
    //             children: [
    //               Positioned(
    //                 left: 0,
    //                 top: 0,
    //                 child: Container(
    //                   width: 276.24,
    //                   height: 42,
    //                   decoration: ShapeDecoration(
    //                     shape: RoundedRectangleBorder(
    //                       side: BorderSide(
    //                           width: 0.50, color: Color(0xFF979797)),
    //                       borderRadius: BorderRadius.circular(10),
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //               Positioned(
    //                 left: 281.12,
    //                 top: 0,
    //                 child: Container(
    //                   width: 45.88,
    //                   height: 42,
    //                   decoration: ShapeDecoration(
    //                     color: Color(0xFFD9D9D9),
    //                     shape: RoundedRectangleBorder(
    //                       borderRadius: BorderRadius.circular(10),
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //       ),
    //       Positioned(
    //         left: 124,
    //         top: 95,
    //         child: Text(
    //           '#놀이공원',
    //           style: TextStyle(
    //             color: Colors.black,
    //             fontSize: 14,
    //             fontFamily: 'Noto Sans',
    //             fontWeight: FontWeight.w400,
    //           ),
    //         ),
    //       ),
    //       Positioned(
    //         left: 204,
    //         top: 95,
    //         child: Text(
    //           '#놀이공원',
    //           style: TextStyle(
    //             color: Colors.black,
    //             fontSize: 14,
    //             fontFamily: 'Noto Sans',
    //             fontWeight: FontWeight.w400,
    //           ),
    //         ),
    //       ),
    //       Positioned(
    //         left: 284,
    //         top: 95,
    //         child: Text(
    //           '#놀이공원',
    //           style: TextStyle(
    //             color: Colors.black,
    //             fontSize: 14,
    //             fontFamily: 'Noto Sans',
    //             fontWeight: FontWeight.w400,
    //           ),
    //         ),
    //       ),
    //       Positioned(
    //         left: 44,
    //         top: 95,
    //         child: Text(
    //           '#놀이공원',
    //           style: TextStyle(
    //             color: Colors.black,
    //             fontSize: 14,
    //             fontFamily: 'Noto Sans',
    //             fontWeight: FontWeight.w400,
    //           ),
    //         ),
    //       ),
    //       Positioned(
    //         left: 31,
    //         top: 173,
    //         child: Container(
    //           width: 328,
    //           height: 454,
    //           decoration: ShapeDecoration(
    //             shape: RoundedRectangleBorder(
    //               side: BorderSide(width: 0.50, color: Color(0xFFD9D9D9)),
    //             ),
    //           ),
    //         ),
    //       ),
    //       Positioned(
    //         left: 44,
    //         top: 144,
    //         child: Text(
    //           '최근 검색 기록',
    //           style: TextStyle(
    //             color: Colors.black,
    //             fontSize: 16,
    //             fontFamily: 'Inter',
    //             fontWeight: FontWeight.w700,
    //           ),
    //         ),
    //       ),
    //       Positioned(
    //         left: 124,
    //         top: 193,
    //         child: Text(
    //           'X',
    //           style: TextStyle(
    //             color: Color(0xFF979797),
    //             fontSize: 16,
    //             fontFamily: 'Noto Sans',
    //             fontWeight: FontWeight.w400,
    //           ),
    //         ),
    //       ),
    //       Positioned(
    //         left: 323,
    //         top: 52,
    //         child: Container(
    //           width: 25,
    //           height: 25,
    //           decoration: ShapeDecoration(
    //             image: DecorationImage(
    //               image: NetworkImage("https://via.placeholder.com/25x25"),
    //               fit: BoxFit.fill,
    //             ),
    //             shape: RoundedRectangleBorder(
    //               borderRadius: BorderRadius.circular(10),
    //             ),
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // ));
  }
}
