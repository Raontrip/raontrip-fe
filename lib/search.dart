import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchPage> {
  int _selectedTab = 0;
  List<String> _suggestedSearches = [
    '동대문',
    '용인',
    '놀이동산',
  ];
  List<String> _selectedSearches = [];

  void _selectTab(int tab) {
    setState(() {
      _selectedTab = tab;
    });
  }

  void _addToSelectedSearches(String search) {
    setState(() {
      _selectedSearches.add(search);
    });
  }

  void _removeFromSelectedSearches(String search) {
    setState(() {
      _selectedSearches.remove(search);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(25, 35, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '검색',
              style: TextStyle(fontSize: 26, fontFamily: 'Nanum', fontWeight: FontWeight.w800),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                GestureDetector(
                  onTap: () => _selectTab(0),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    decoration: BoxDecoration(
                      color: _selectedTab == 0 ? Colors.grey[300] : null,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      '해시태그',
                      style: TextStyle(fontSize: 16, fontFamily: 'Nanum', fontWeight: FontWeight.w800),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                GestureDetector(
                  onTap: () => _selectTab(1),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    decoration: BoxDecoration(
                      color: _selectedTab == 1 ? Colors.grey[300] : null,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      '지역/장소명',
                      style: TextStyle(fontSize: 16, fontFamily: 'Nanum', fontWeight: FontWeight.w800),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            if (_selectedTab == 0)
              Text(
                '내가 할거 아님',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            if (_selectedTab == 1)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      IconButton(
                        icon: Image.asset('assets/images/search.png'), // 아이콘1 이미지
                        onPressed: () {
                          // 검색 결과
                        },
                      ),
                    ],
                  ),
                ],
              ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(8),
              child: Wrap(
                spacing: 10,
                children: _suggestedSearches.map((search) {
                  return GestureDetector(
                    onTap: () => _addToSelectedSearches(search),
                    child: Chip(
                      label: Text(search),
                      onDeleted: () => _removeFromSelectedSearches(search),
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 20),
            Text(
              '추천 검색어',
              style: TextStyle(fontSize: 20, fontFamily: 'Nanum', fontWeight: FontWeight.w800),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: _suggestedSearches.length,
                itemBuilder: (context, index) {
                  final search = _suggestedSearches[index];
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    child: Text(search),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}