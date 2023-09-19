import 'package:flutter/material.dart';

import 'package:raon_trip/search_hash.dart';
import 'package:raon_trip/search_name.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RaonTrip',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: const MyHomePage(title: '라온 트립'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController? controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('검색'),
          titleTextStyle: const TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
          backgroundColor: Colors.white,
          elevation: 0.0,
          bottom: TabBar(
            tabs: <Tab>[
              Tab(
                text: "해시태그",
              ),
              Tab(
                text: "지역/장소명",
              )
            ],
            controller: controller,
          ),
        ),
        body: TabBarView(
            controller: controller,
            children: <Widget>[FirstApp(), SecondApp()]));
  }
}
