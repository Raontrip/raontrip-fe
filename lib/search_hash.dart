import 'package:flutter/material.dart';
import 'package:raon_trip/page4.dart';
import 'package:raon_trip/page6.dart';

class FirstApp extends StatelessWidget {
  const FirstApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      //width: 390,
      //height: 844,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(color: Colors.white),
      child: Stack(
        children: [
          Positioned(
            left: 55,
            top: 178,
            child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/fourth');
              },
              child: const Text('에버랜드'),
            ),
          ),
          Positioned(
            left: 32,
            top: 33,
            child: SizedBox(
              width: 327,
              height: 40,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                        width: 276,
                        height: 40,
                        child: TextField(
                            decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: '해시태그를 입력하세요',
                        ))),
                  ),
                  Positioned(
                    left: 280,
                    top: 0,
                    width: 40,
                    height: 40,
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Page4()),
                        );
                      },
                      icon: const Icon(Icons.search),
                      iconSize: 30,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 124,
            top: 85,
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
            top: 85,
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
            top: 85,
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
            top: 85,
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
            top: 163,
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
            top: 134,
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
            top: 183,
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
        ],
      ),
    ));
  }
}
