import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HttpApp extends StatefulWidget {
  @override
  _HttpAppState createState() => _HttpAppState();
}

class _HttpAppState extends State<HttpApp> {
  String result = '';
  List data = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Http Example"),
      ),
      body: Container(
        child: Center(
          child: data.length == 0
              ? Text(
                  "데이터가 없습니다",
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                )
              : ListView.builder(
                  itemBuilder: (context, index) {
                    return Card(
                      child: Container(
                        child: Column(
                          children: [
                            Text(data[index]['title'].toString()),
                            Text(data[index]['authors'].toString()),
                            Text(data[index]['sale_price'].toString()),
                            Text(data[index]['status'].toString()),
                            Image.network(
                              data[index]['thumbnail'],
                              height: 100,
                              width: 100,
                              fit: BoxFit.contain,
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: data.length,
                ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          getJSONData();
          // var url = Uri.parse('http://www.google.com');
          // var response = await http.get(url);
          // setState(() {
          //   result = response.body;
          // });
        },
        child: Icon(Icons.file_download),
      ),
    );
  }

  Future<String> getJSONData() async {
    var url = Uri.parse(
        'https://dapi.kakao.com/v3/search/book?target=title&query=doit');
    var response = await http
        .get(url, headers: {"Authorization": "KakaoAK {kakao_rest_api_key}"});

    setState(() {
      var dataConvertedToJSON = json.decode(response.body);
      List result = dataConvertedToJSON["documents"];
      data.addAll(result);
    });
    return response.body;
  }
}
