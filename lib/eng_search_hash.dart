import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:raon_trip/eng_page4.dart';

class EngFirstApp extends StatelessWidget {
  EngFirstApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SearchForm(),
    );
  }
}

class SearchForm extends StatefulWidget {
  @override
  _SearchFormState createState() => _SearchFormState();
}

class _SearchFormState extends State<SearchForm> {
  final TextEditingController _searchController = TextEditingController();
  List<String> recentSearches = [];

  @override
  void initState() {
    super.initState();
    loadRecentSearches();
  }

  Future<void> loadRecentSearches() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      recentSearches = prefs.getStringList('hashtagSearches') ?? [];
    });
  }

  Future<void> saveRecentSearches() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('hashtagSearches', recentSearches);
  }

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
                          width: 276,
                          height: 40,
                          child: TextField(
                              controller: _searchController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Please enter hashtag',
                              ))),
                      Positioned(
                        left: 280,
                        top: 0,
                        width: 40,
                        height: 40,
                        child: IconButton(
                          onPressed: () {
                            final keyword  = _searchController.text;
                            if (keyword.isNotEmpty && !recentSearches.contains(keyword)) {
                              setState(() {
                                recentSearches.add(keyword);
                              });
                              saveRecentSearches();
                            }
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => EngPage4(1, 1, keyword, 'ETC')),
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
                left: 44,
                top: 134,
                child: Text(
                  'Search History',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),// 놀이공원
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
                  child: recentSearches.isEmpty
                      ? Text(
                    'There are no recent search history',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  )
                      : Wrap(
                    spacing: 1.0,
                    children: recentSearches.map((search) {
                      return Padding(
                          padding: const EdgeInsets.only(right: 1.0),
                          child: Wrap(
                              spacing: 1.0,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) => EngPage4(1, 1, search, 'ETC')));
                                  },
                                  child: Text(
                                      search,
                                      textAlign: TextAlign.end,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    if (search.isNotEmpty) {
                                      setState(() {
                                        recentSearches.remove(search);
                                      });
                                      saveRecentSearches();
                                    }
                                    },
                                    child: Text(
                                      'X',
                                      textAlign: TextAlign.start,
                                  ),
                                ),
                            ],
                          )
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
