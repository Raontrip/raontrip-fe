import 'package:flutter/material.dart';
import 'package:kakao_map_plugin/kakao_map_plugin.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
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
  int contentId = 0;
  int contentTypeId = 0;
  String title = "";
  String addr = "";
  String addrDetail = "";
  double mapX = 0.0;
  double mapY = 0.0;
  int areaCode = 0;
  int sigunguCode = 0;
  String originImg = "";
  String thumbnailImg = "";
  List<dynamic> tags = [];
  LatLng latLng = LatLng(37.3608681, 126.9306506);

  @override
  void initState() {
    super.initState();
    fetchAPI();
  }

  Future<void> fetchAPI() async {
    String url = 'http://13.124.208.42:8080/place/130728?lang=82&mobileOS=ETC';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      dynamic body = jsonDecode(utf8.decode(response.bodyBytes));
      setState(() {
        contentId = body['data']['contentId'];
        contentTypeId = body['data']['contentTypeId'];
        title = body['data']['title'];
        addr = body['data']['addr'];
        addrDetail = body['data']['addrDetail'];
        mapX = body['data']['mapX'];
        mapY = body['data']['mapY'];
        areaCode = body['data']['areaCode'];
        sigunguCode = body['data']['sigunguCode'];
        originImg = body['data']['originImg'];
        thumbnailImg = body['data']['thumbnailImg'];
        tags.addAll(body['data']['tag']);
        latLng.latitude = mapY;
        latLng.longitude = mapX;
      });
    } else {
      print("fail");
    }
  }

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
                    image: DecorationImage(
                      image: NetworkImage(
                        originImg,
                      ),
                      fit: BoxFit.fitWidth, //너비에 맞게 확대 축소
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
                child: Row(
                  children: tags.map((tag) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
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
                        child: Text(
                          '# $tag',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 10,
                            fontFamily: 'Noto Sans',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                )
              ),
              // Positioned(
              //   left: 50 + 30 + 47 + 10,
              //   top: 315,
              //   child: ElevatedButton(
              //     onPressed: () {
              //       // 해시태그 누르면 넘어갈 곳
              //     },
              //     style: ElevatedButton.styleFrom(
              //       backgroundColor: const Color(0xFFE7E7E7),
              //       elevation: 0,
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(15),
              //       ),
              //       // padding: EdgeInsets.symmetric(horizontal: 10),
              //     ),
              //     child: const Text(
              //       '# 테마파크',
              //       style: TextStyle(
              //         color: Colors.black,
              //         fontSize: 10,
              //         fontFamily: 'Noto Sans',
              //         fontWeight: FontWeight.w400,
              //       ),
              //     ),
              //   ),
              // ),
              Positioned(
                left: 50,
                top: 290,
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
                      addr,
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

                    setState(() { });
                  }),
                  markers: markers.toList(),
                  center: latLng,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
