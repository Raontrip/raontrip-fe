import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

import 'package:flutter/material.dart';
import 'package:raon_trip/page2.dart';
import 'main.dart';
import 'package:kakao_map_plugin/kakao_map_plugin.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

// 내국인 인기 지역 리스트
// 이미지 받아오기
List<String> imagePaths = [
  'assets/images/everland.png',
  'assets/images/jongro.png',
  'assets/images/everland.png',
  'assets/images/jongro.png',
  'assets/images/everland.png',
];

// 지역 이름 받아오기
List<String> regionNames = [
  '#경기도 용인시',
  '#서울특별시 종로구',
  '#울산광역시 북구 강동동',
  '#4',
  '#5',
];

// 외국인 인기 지역 리스트
// 이미지 받아오기
List<String> imagePathsf = [
  'assets/images/everland.png',
  'assets/images/jongro.png',
  'assets/images/everland.png',
  'assets/images/jongro.png',
  'assets/images/everland.png',
];

// 지역 이름 받아오기
List<String> regionNamesf = [
  '#경기도 수원시',
  '#서울특별시 마포구',
  '#3',
  '#4',
  '#5',
];

class Rank {
  late String administrativeName;
  late String sggName;
  late String img;

  Rank(
      {required this.administrativeName,
      required this.sggName,
      required this.img});

  Rank.fromMapSgg(Map<String, dynamic>? map) {
    administrativeName = map?['sgg']['administrativeName'] ?? '';
    sggName = map?['sgg']['sggName'] ?? '';
  }
  Rank.fromMapImg(Map<String, dynamic>? map) {
    img = map?['img'] ?? '';
  }
}

class RankProviders {
  // Uri uri = Uri.parse("http://127.0.0.1:8080/places/rank?size=4");
  String mainUrl = "http://13.124.208.42:8080/places/rank?";

  // Future getRank() async {
  getRank() async {
    Uri u = Uri.parse(mainUrl + "size=5");
    final response = await http.get(u);

    if (jsonDecode(response.body)['code'] == 20002) {
      imagePaths = jsonDecode(response.body)['data'].map<String>((place) {
        return Rank.fromMapImg(place).img;
      }).toList();
      // log("?");
      regionNames = jsonDecode(utf8.decode(response.bodyBytes))['data']
          .map<String>((place) {
        var value = Rank.fromMapSgg(place);
        return "#" + value.administrativeName + " " + value.sggName;
      }).toList();
    }
    return 1;
  }

  // Future getEngRank() async {
  getEngRank(int lang) async {
    Uri u = Uri.parse(mainUrl + "lang=$lang&size=5");
    final response = await http.get(u);

    if (jsonDecode(response.body)['code'] == 20002) {
      imagePathsf = jsonDecode(response.body)['data'].map<String>((place) {
        return Rank.fromMapImg(place).img;
      }).toList();

      regionNamesf = jsonDecode(utf8.decode(response.bodyBytes))['data']
          .map<String>((place) {
        var value = Rank.fromMapSgg(place);
        return "#" + value.administrativeName + " " + value.sggName;
      }).toList();
    }
    return 1;
  }
}

void main() async {
  // await dotenv.load(fileName: 'assets/env/.env.sample');
  // AuthRepository.initialize(appKey: dotenv.env['APP_KEY'] ?? '');
  AuthRepository.initialize(appKey: '7decdea914383cf8fb08fd059df86520');
  WidgetsFlutterBinding.ensureInitialized(); // 필요한 초기화 부분입니다.
  runApp(const MainPage());
}

class MainTest extends StatelessWidget {
  const MainTest({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('라온트립',
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
      ),
    );
  }
}

class Iphone1313Pro1 extends StatefulWidget {
  @override
  _Iphone1313Pro1State createState() => _Iphone1313Pro1State();
}

class _Iphone1313Pro1State extends State<Iphone1313Pro1> {
  bool isLoading = true;
  RankProviders rankProviders = RankProviders();
  // Future initNews() async {
  initNews() async {
    await rankProviders.getRank();
    await rankProviders.getEngRank(1);
    log("finish"); //이 아래에 로딩 화면 전환이 있어야할 듯함
    return 1;
  }

  @override
  void initState() {
    super.initState();
    initNews().then((_) {
      setState(() {
        // log("in"); <- 얜 안들어감
        isLoading = false;
      });
    });
  }

  bool isPopupVisible = true;

  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    Page2(),
    MainPage(),
    Page2(),
  ];

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
              const Positioned(
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
              const Positioned(
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
                  width: MediaQuery.of(context).size.width - 55,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(imagePathsf.length, (index) {
                        return Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: _buildButtonWithImagef(imagePathsf[index],
                              regionNamesf[index]), // 스크롤 사진
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
                  width: MediaQuery.of(context).size.width - 55,
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
  return SizedBox(
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
          child: CachedNetworkImage(
            imageUrl: imagePath,
            imageBuilder: (context, imageProvider) => Container(
              width: 200,
              height: 200,
              decoration: ShapeDecoration(
                image: DecorationImage(
                  image: imageProvider,
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
            cacheManager: CacheManager(Config(
              "fluttercampus",
              stalePeriod: const Duration(days: 1), //cache로 저장되는 기간 1일로 설정
              //one week cache period
            )),
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
              style: const TextStyle(
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
  return SizedBox(
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
          child: CachedNetworkImage(
            imageUrl: imagePathf,
            imageBuilder: (context, imageProvider) => Container(
              width: 200,
              height: 200,
              decoration: ShapeDecoration(
                image: DecorationImage(
                  image: imageProvider,
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
            cacheManager: CacheManager(Config(
              "fluttercampus",
              stalePeriod: const Duration(days: 1), //cache로 저장되는 기간 1일로 설정
              //one week cache period
            )),
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
              style: const TextStyle(
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
      color: const Color.fromRGBO(0, 0, 0, 0.5), // 반투명한 배경색
      child: Center(
        child: Container(
          width: 200,
          height: 200,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "언어 선택",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: 'Noto Sans',
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // 첫 번째 버튼에 대한 동작 수행
                  onClose(); // 팝업 닫기
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.green, // Change the button color here
                  onPrimary: Colors.white, // Change the text color here
                ),
                child: const Text(
                  "English",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Noto Sans',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => Page2()), // 마이페이지로 바꿀 것
                  // );
                  onClose(); // 팝업 닫기
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.green, // Change the button color here
                  onPrimary: Colors.white, // Change the text color here
                ),
                child: const Text(
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
