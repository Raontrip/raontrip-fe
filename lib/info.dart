import 'package:flutter/material.dart';
import 'package:kakao_map_plugin/kakao_map_plugin.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('에버랜드',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 24,
              )),
          backgroundColor: Colors.white,
          elevation: 0,

          // foregroundColor: Colors.white,
        ),
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
        Flexible(
          child: Stack(
            children: [
              Positioned(
                left: 35,
                top: 34,
                child: Container(
                  width: MediaQuery.of(context).size.width - 70,
                  height: 240,
                  decoration: ShapeDecoration(
                    image: const DecorationImage(
                      image: AssetImage("assets/images/everland.png"),
                      fit: BoxFit.cover, //너비에 맞게 확대 축소
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 50,
                top: 315,
                child: ElevatedButton(
                  onPressed: () {
                    // 해시태그 누르면 넘어갈 곳
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFE7E7E7),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    // padding: EdgeInsets.symmetric(horizontal: 10),
                  ),
                  child: const Text(
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
                left: 50 + 30 + 47 + 10,
                top: 315,
                child: ElevatedButton(
                  onPressed: () {
                    // 해시태그 누르면 넘어갈 곳
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE7E7E7),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    // padding: EdgeInsets.symmetric(horizontal: 10),
                  ),
                  child: const Text(
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
                left: 50,
                top: 290,
                child: Row(
                  children: const [
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
                top: 374,
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
            ],
          ),
        ),
      ],
    );
  }
}
