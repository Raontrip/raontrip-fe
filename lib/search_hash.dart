import 'package:flutter/material.dart';

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
          // Positioned(
          //   left: 34,
          //   top: 0,
          //   child: Text(
          //     '해시태그',
          //     style: TextStyle(
          //       color: Color(0xFF979797),
          //       fontSize: 16,
          //       fontFamily: 'Noto Sans',
          //       fontWeight: FontWeight.w400,
          //     ),
          //   ),
          // ),
          // Positioned(
          //   left: 111,
          //   top: 0,
          //   child: Text(
          //     '지역/장소명',
          //     style: TextStyle(
          //       color: Colors.black,
          //       fontSize: 16,
          //       fontFamily: 'Noto Sans',
          //       fontWeight: FontWeight.w400,
          //     ),
          //   ),
          // ),
          Positioned(
            left: 55,
            top: 178,
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
          // Positioned(
          //   left: 110,
          //   top: 24,
          //   child: Container(
          //     width: 82,
          //     decoration: ShapeDecoration(
          //       shape: RoundedRectangleBorder(
          //         side: BorderSide(
          //           width: 1,
          //           strokeAlign: BorderSide.strokeAlignCenter,
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          Positioned(
            left: 32,
            top: 33,
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
                          side:
                              BorderSide(width: 0.50, color: Color(0xFF979797)),
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
          Positioned(
            left: 323,
            top: 42,
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
