import 'package:flutter/material.dart';
//import 'package:flutter_kakao_map/flutter_kakao_map.dart';
//import 'package:flutter_kakao_map/kakao_maps_flutter_platform_interface.dart';


class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 25.0, top: 35.0, right: 25.0, bottom: 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              '에버랜드',
              style: TextStyle(fontSize: 26, fontFamily: 'Nanum', fontWeight: FontWeight.w800),
            ),

            SizedBox(height: 25.0),

            // Picture
            Container(
              width: double.infinity, // Full width
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0), // 이미지 라운딩
                image: DecorationImage(
                  image: AssetImage('assets/images/everland.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            SizedBox(height: 16.0),

            // Address
            Row(
              children: [
                Text(
                  '위치',
                  style: TextStyle(fontSize: 13, fontFamily: 'Nanum', fontWeight: FontWeight.w800),
                ),
                SizedBox(width: 8.0), // 글자 사이 공간
                Text(
                  '경기도 용인시 처인구 포곡읍 에버랜드로 199',
                  style: TextStyle(fontSize: 13, fontFamily: 'Nanum', fontWeight: FontWeight.w700),
                ),
              ],
            ),

            SizedBox(height: 16.0),

            // Button
            ElevatedButton(
              onPressed: () {
                // Button action
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFFE8E8E8), // 버튼 색깔
                onPrimary: Colors.black, // 글자 색깔
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0), // 라운딩
                ),
                elevation: 0, // 버튼 그림자 제거
              ),
              child: Text(
                '#놀이공원',
                style: TextStyle(
                  fontSize: 13,
                  fontFamily: 'Nanum',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),

            SizedBox(height: 16.0),

            // Picture
            Container(
              width: double.infinity, // 너비
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/map.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
