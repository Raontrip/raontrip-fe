import 'package:flutter/material.dart';

class myPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "마이페이지",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: 24,
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Center(
          child: Text(
            "COMING SOON",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: 24,
            ),
          ),
        ),
      ),
    );
  }
}
