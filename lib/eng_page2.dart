import 'package:flutter/material.dart';
import 'package:raon_trip/eng_search_name.dart';
import 'package:raon_trip/eng_search_hash.dart';


class EngPage2 extends StatelessWidget {
  const EngPage2({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RaonTrip',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: const MyHomePage(title: 'RaonTrip'),
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
          title: const Text('Search'),
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
                text: "Hashtag",
              ),
              Tab(
                text: "Region/Place",
              )
            ],
            controller: controller,
          ),
        ),
        body: TabBarView(
            controller: controller,
            children: <Widget>[EngFirstApp(), EngSecondApp()]));
  }
}
