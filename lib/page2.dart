import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RaonTrip',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primaryColor: Colors.white,
      ),
      home: const MyHomePage(title: '라온 트립'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
          title: Text('    검색'),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
          backgroundColor: Colors.white,
          //centerTitle: true, // 중앙 정렬
          elevation: 0.0,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search), // 검색 아이콘 생성
              onPressed: () {
                // 아이콘 버튼 실행
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Page2()));
                // print('Shopping cart button is clicked');
              },
            ),
            IconButton(
              icon: Icon(Icons.menu), // 햄버거버튼 아이콘 생성
              onPressed: () {
                // 아이콘 버튼 실행
                // print('Search button is clicked');
              },
            ),
          ],
        ),
        body: Container(
          //width: 390,
          //height: 844,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(color: Colors.white),
          child: Stack(
            children: [
              // Positioned(
              //   left: 32,
              //   top: 80,
              //   child: Text(
              //     '검색',
              //     style: TextStyle(
              //       color: Colors.black,
              //       fontSize: 24,
              //       fontFamily: 'Inter',
              //       fontWeight: FontWeight.w700,
              //     ),
              //   ),
              // ),
              Positioned(
                left: 34,
                top: 0,
                child: Text(
                  '해시태그',
                  style: TextStyle(
                    color: Color(0xFF979797),
                    fontSize: 16,
                    fontFamily: 'Noto Sans',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Positioned(
                left: 111,
                top: 0,
                child: Text(
                  '지역/장소명',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'Noto Sans',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Positioned(
                left: 55,
                top: 193,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/fourth');
                  },
                  child: const Text('에버랜드'),
                ),
                // child: Text(
                //   '에버랜드',
                //   style: TextStyle(
                //     color: Color(0xFF979797),
                //     fontSize: 16,
                //     fontFamily: 'Noto Sans',
                //     fontWeight: FontWeight.w400,
                //   ),
                // ),
              ),
              Positioned(
                left: 110,
                top: 24,
                child: Container(
                  width: 82,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        strokeAlign: BorderSide.strokeAlignCenter,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 32,
                top: 43,
                child: SizedBox(
                  width: 327,
                  height: 42,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 276.24,
                          height: 42,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  width: 0.50, color: Color(0xFF979797)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 281.12,
                        top: 0,
                        child: Container(
                          width: 45.88,
                          height: 42,
                          decoration: ShapeDecoration(
                            color: Color(0xFFD9D9D9),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 124,
                top: 95,
                child: Text(
                  '#놀이공원',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: 'Noto Sans',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Positioned(
                left: 204,
                top: 95,
                child: Text(
                  '#놀이공원',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: 'Noto Sans',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Positioned(
                left: 284,
                top: 95,
                child: Text(
                  '#놀이공원',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: 'Noto Sans',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Positioned(
                left: 44,
                top: 95,
                child: Text(
                  '#놀이공원',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: 'Noto Sans',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Positioned(
                left: 31,
                top: 173,
                child: Container(
                  width: 328,
                  height: 454,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 0.50, color: Color(0xFFD9D9D9)),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 44,
                top: 144,
                child: Text(
                  '최근 검색 기록',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Positioned(
                left: 124,
                top: 193,
                child: Text(
                  'X',
                  style: TextStyle(
                    color: Color(0xFF979797),
                    fontSize: 16,
                    fontFamily: 'Noto Sans',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Positioned(
                left: 323,
                top: 52,
                child: Container(
                  width: 25,
                  height: 25,
                  decoration: ShapeDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://via.placeholder.com/25x25"),
                      fit: BoxFit.fill,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}