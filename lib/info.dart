import 'package:flutter/material.dart';
import 'package:kakao_map_plugin/kakao_map_plugin.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: Scaffold(
        body: InfoWidget(),
      ),
    );
  }
}

class InfoWidget extends StatefulWidget {
  @override
  _InfoWidgetState createState() => _InfoWidgetState();
}

class _InfoWidgetState extends State<InfoWidget> {
  late KakaoMapController mapController; // mapController를 여기서 선언합니다.

  Set<Marker> markers = {};

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
                    padding: EdgeInsets.symmetric(horizontal: 10),
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
                left: 50 + 30 + 47,
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
                    padding: EdgeInsets.symmetric(horizontal: 10),
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
                child: Row(
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
                right: 35,
                bottom: 100,
                child: KakaoMap(
                  onMapCreated: ((controller) async {
                    mapController = controller; // mapController를 여기서 초기화합니다.

                    markers.add(Marker(
                      markerId: UniqueKey().toString(),
                      latLng: await mapController.getCenter(),
                    ));

                    setState(() {});
                  }),
                  markers: markers.toList(),
                  center: LatLng(37.3608681, 126.9306506),
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
                          // 검색 버튼 클릭 시 처리
                        },
                        icon: Icon(Icons.search),
                        color: Colors.black,
                        iconSize: 20,
                      ),
                      IconButton(
                        onPressed: () {
                          // 홈 버튼 클릭 시 처리
                        },
                        icon: Icon(Icons.home),
                        color: Colors.black,
                        iconSize: 20,
                      ),
                      IconButton(
                        onPressed: () {
                          // 사용자 프로필 버튼 클릭 시 처리
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

