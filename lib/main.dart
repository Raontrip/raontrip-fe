import 'package:flutter/material.dart';
import 'search.dart'; // search.dart 파일을 임포트합니다.
import 'info.dart';
//import 'package:flutter_kakao_map/flutter_kakao_map.dart';
//import 'package:flutter_kakao_map/kakao_maps_flutter_platform_interface.dart';

// 내국인 인기 지역 리스트
final List<String> imagePaths = [
  'assets/images/everland.png',
  'assets/images/jongro.png',
  'assets/images/everland.png',
  'assets/images/jongro.png',
  'assets/images/everland.png',
];

final List<String> regionNames = [
  '#경기도 용인시',
  '#서울특별시 종로구',
  '#3',
  '#4',
  '#5',
];

// 외국인 인기 지역 리스트
final List<String> imagePathsf = [
  'assets/images/everland.png',
  'assets/images/jongro.png',
  'assets/images/everland.png',
  'assets/images/jongro.png',
  'assets/images/everland.png',
];

final List<String> regionNamesf = [
  '#경기도 용인시',
  '#서울특별시 종로구',
  '#3',
  '#4',
  '#5',
];

class MyThreeLayerScreen extends StatefulWidget {
  @override
  _MyThreeLayerScreenState createState() => _MyThreeLayerScreenState();
}

class _MyThreeLayerScreenState extends State<MyThreeLayerScreen> {
  Future<bool> _onWillPop() async {
    return (await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Align(
          alignment: AlignmentDirectional.topEnd,
          child: IconButton(
            icon: Image.asset('assets/images/close.png'), // 종료 아이콘
            onPressed: () => Navigator.of(context).pop(false),
          ),
        ),

        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 200, // Adjust the height of the photo container
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/ads.jpg'), // 광고 사진
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Text('라온트립을 종료하시겠습니까?', style: TextStyle(fontSize: 16, fontFamily: 'Nanum', fontWeight: FontWeight.w700),),
          ],
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text('종료', style: TextStyle(fontSize: 16, fontFamily: 'Nanum', fontWeight: FontWeight.w700),),
          ),
        ],
      ),
    )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 첫 번째 레이어: 타이틀과 아이콘
            Padding(
              padding: EdgeInsets.only(left: 25.0, top: 25.0, right: 25.0, bottom: 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '라온트립',
                    style: TextStyle(fontSize: 26, fontFamily: 'Nanum', fontWeight: FontWeight.w800),
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: Image.asset('assets/images/search.png'), // 아이콘1의 이미자
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SearchPage()),
                          );
                        },
                      ),
                      IconButton(
                        icon: Image.asset('assets/images/menu.png'), // 아이콘2 이미지
                        onPressed: () {
                          // 메뉴로 이동
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // 두 번째 레이어: 외국인 인기 지역
            Padding(
              padding: EdgeInsets.only(left: 25.0, top: 25.0, right: 0.0, bottom: 0.0),
              child: Text(
                '외국인 인기 지역',
                style: TextStyle(fontSize: 20, fontFamily: 'Nanum', fontWeight: FontWeight.w800),
              ),
            ),
            // 외국인 인기 지역에 대한 가로 스크롤 가능한 사진들
            Container(
              height: 215, // height as needed
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: imagePaths.length, // number of photos
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => InfoPage()),
                      );
                    },
                    child: Container(
                      width: 215, // width as needed
                      margin: EdgeInsets.only(left: 25.0, top: 16.0, right: 0.0, bottom: 0.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0), // round the image
                        image: DecorationImage(
                          image: AssetImage(imagePaths[index]), // use the image from the list
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Colors.white.withOpacity(0.6),
                        ),
                        child: Center(
                          child: Text(
                            regionNames[index], // use the region name from the list
                            style: TextStyle(fontSize: 18, fontFamily: 'Nanum', fontWeight: FontWeight.w800),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            // 세 번째 레이어: 내국인 인기 지역
            Padding(
              padding: EdgeInsets.only(left: 25.0, top: 80.0, right: 0.0, bottom: 0.0),
              child: Text(
                '내국인 인기 지역',
                style: TextStyle(fontSize: 20, fontFamily: 'Nanum', fontWeight: FontWeight.w800),
              ),
            ),
            SizedBox(height: 8.0),

            // 내국인 인기 명소에 대한 가로 스크롤 가능한 사진들
            Container(
              height: 215, // height as needed
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: imagePathsf.length, // number of photos
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => InfoPage()),
                      );
                    },
                    child: Container(
                      width: 215, // width as needed
                      margin: EdgeInsets.only(left: 25.0, top: 16.0, right: 0.0, bottom: 0.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0), // round the image
                        image: DecorationImage(
                          image: AssetImage(imagePathsf[index]), // use the image from the list
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Colors.white.withOpacity(0.6),
                        ),
                        child: Center(
                          child: Text(
                            regionNamesf[index], // use the region name from the list
                            style: TextStyle(fontSize: 18, fontFamily: 'Nanum', fontWeight: FontWeight.w800),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: MyThreeLayerScreen(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
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
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
