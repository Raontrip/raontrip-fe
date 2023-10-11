import 'package:flutter/material.dart';
import 'package:kakao_map_plugin/kakao_map_plugin.dart';
import 'package:http/http.dart' as http;
import 'package:raon_trip/page4.dart';
import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class InfoPage extends StatelessWidget {
  final String title;
  final int contentId;
  final int lang;
  final String mobileOS;

  InfoPage(this.title, this.contentId, this.lang, this.mobileOS);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(title,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 24,
              )),
          backgroundColor: Colors.white,
          elevation: 0,

          // foregroundColor: Colors.white,
        ),
        body: InfoWidget(this.contentId, this.lang, this.mobileOS),
      ),
    );
  }
}

class InfoWidget extends StatefulWidget {
  final int contentId;
  final int lang;
  final String mobileOS;

  InfoWidget(this.contentId, this.lang, this.mobileOS);

  @override
  _InfoWidgetState createState() => _InfoWidgetState(this.contentId, this.lang, this.mobileOS);
}

class _InfoWidgetState extends State<InfoWidget> {
  final int id;
  final int lang;
  final String mobileOS;

  _InfoWidgetState(this.id, this.lang, this.mobileOS);

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
  var latLng = LatLng(0, 0);

  @override
  void initState() {
    super.initState();
    fetchAPI(this.id, this.lang, this.mobileOS);
  }

  Future<void> fetchAPI(int id, int lang, String mobileOS) async {
    String url = 'http://13.124.208.42:8080/place/$id?lang=$lang&mobileOS=$mobileOS';
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
        markers.add(Marker(
            markerId: UniqueKey().toString(),
            latLng: LatLng(mapY, mapX),
        ));
        latLng = LatLng(mapY, mapX);
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
                  child: CachedNetworkImage(
                    imageUrl: originImg,
                    fit: BoxFit.fitWidth,
                    errorWidget: (context, url, error) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(20), // 곡률 적용
                        child: Image.asset(
                          'assets/images/raontrip.jpg',
                          width: MediaQuery.of(context).size.width - 70,
                          height: 240,
                          fit: BoxFit.fitWidth,
                        ),
                      );
                    },
                    //placeholder: (context, url) => CircularProgressIndicator(), // 로딩 중에 표시할 위젯
                    width: MediaQuery.of(context).size.width - 70,
                    height: 240,
                    imageBuilder: (context, imageProvider) => Container(
                      width: MediaQuery.of(context).size.width - 70,
                      height: 240,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.fitWidth,
                        ),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    cacheManager: CacheManager(Config(
                    "fluttercampus",
                    stalePeriod: const Duration(seconds: 1), //cache로 저장되는 기간 1초로 설정
                    )),
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
                            String keyword = tag;
                            Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Page4(1, 82, keyword, 'ETC')),
                            );
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

                    setState(() {
                      mapController.setCenter(latLng);
                    });
                  }),
                  markers: markers.toList(),
                  // center: LatLng(mapY, mapX),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}