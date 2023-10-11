import 'dart:core';

import 'package:raon_trip/info.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class Page4 extends StatelessWidget {
  int page;
  final int lang;
  final String keyword;
  final String mobileOS;

  Page4(this.page, this.lang, this.keyword, this.mobileOS, {super.key});

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
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(this.page, this.lang, this.keyword, this.mobileOS, title: '라온 트립'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  int page;
  final int lang;
  final String keyword;
  final String mobileOS;

  MyHomePage(this.page, this.lang, this.keyword, this.mobileOS, {super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState(this.page, this.lang, this.keyword, this.mobileOS);
}

class _MyHomePageState extends State<MyHomePage> {
  int page;
  final int lang;
  final String keyword;
  final String mobileOS;

  _MyHomePageState(this.page, this.lang, this.keyword, this.mobileOS);

  List<dynamic> places = [];

  @override
  void initState() {
    super.initState();
    fetchAPI(4, this.page, 5, this.keyword, this.lang, this.mobileOS);
  }

  Future<void> fetchAPI(int type, int page, int size, String keyword, int lang, String mobileOS) async {
    String url = 'http://13.124.208.42:8080/places?type=$type&page=$page&size=$size&keyword=$keyword&lang=$lang&mobileOS=$mobileOS';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      dynamic body = jsonDecode(utf8.decode(response.bodyBytes));
      setState(() {
        places.addAll(body['data']);
      });
    } else {
      print("fail");
    }
  }

  // Future<void> fetchAPI() async {
  //   String url = 'http://13.124.208.42:8080/places?type=４&page=1&size=5&keyword=서울&lang=82&mobileOS=ETC';
  //   final response = await http.get(Uri.parse(url));
  //
  //   if (response.statusCode == 200) {
  //     dynamic body = jsonDecode(utf8.decode(response.bodyBytes));
  //     setState(() {
  //       places.addAll(body['data']);
  //     });
  //   } else {
  //     print("fail");
  //   }
  // }

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
        title: Text('$keyword 검색결과'),
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.w700,
        ),
        backgroundColor: Colors.white,
        //centerTitle: true, // 중앙 정렬
        elevation: 0.0,
      ),
      body: ListView.builder(
        itemExtent: 120.0,
        itemCount: places.length,
        itemBuilder: (context, index) {
          dynamic place = places[index];
          return GestureDetector(
            onTap: () {
              // 아이템을 눌렀을 때 다른 페이지로 이동하는 코드를 작성
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => InfoPage(place['title'], place['contentId'], 82, 'ETC'), // DetailPage는 상세 페이지의 위젯입니다.
                ),
              );
            },
            child: buildPlaceCard(place),
          );
        },
      ),
    );
  }

  Widget buildPlaceCard(dynamic place) {
    return Positioned(
        left: 32,
        top: places.indexOf(place) * 120.0 + 28,
        child: SizedBox(
          width: 303,
          height: 100,
          child: Stack(
            children: [
              Positioned(
                  left: 0,
                  top: 0,
                  child: CachedNetworkImage(
                    imageUrl: place['thumbnailImg'],
                    fit: BoxFit.fill,
                    errorWidget: (context, url, error) {
                      return ClipRRect(
                        child: Image.asset(
                          'assets/images/raontrip.jpg',
                          width: 100,
                          height: 100,
                          fit: BoxFit.fill,
                        ),
                        //shape: BoxShape.circle,
                      );
                    },
                    //placeholder: (context, url) => CircularProgressIndicator(), // 로딩 중에 표시할 위젯
                    width: 100,
                    height: 100,
                    imageBuilder: (context, imageProvider) => Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.fill,
                        ),
                        shape: BoxShape.circle,
                      ),
                    ),
                    cacheManager: CacheManager(Config(
                      "fluttercampus",
                      stalePeriod: const Duration(seconds: 1), //cache로 저장되는 기간 1초로 설정
                      //one week cache period
                    )),
                  ),
              ),
              Positioned(
                left: 113,
                top: 11,
                child: Text(
                  place['title'],
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'Noto Sans',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Positioned(
                left: 113,
                top: 43,
                child: Row(
                  children: place['tag'].map<Widget>((tag) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Text(
                        '# $tag',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Noto Sans',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              Positioned(
                left: 113,
                top: 67,
                child: Text(
                  place['addr'],
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                    fontFamily: 'Noto Sans',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }
}
