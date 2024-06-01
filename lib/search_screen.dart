import 'package:flutter/material.dart';
import 'package:projek_contact/db_helper.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Map<String, dynamic>> _allData = [];
  List<Map<String, dynamic>> _filteredData = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _refreshData();
  }

  void _refreshData() async {
    final data = await SQLHelper.getAllData();
    setState(() {
      _allData = data;
      _filteredData = data;
      _isLoading = false;
    });
  }

  void _filterData(String query) {
    final filtered = _allData.where((element) {
      final nameLower = (element['name'] ?? '').toLowerCase();
      final numberLower = (element['number'] ?? '').toLowerCase();
      final searchLower = query.toLowerCase();
      return nameLower.contains(searchLower) || numberLower.contains(searchLower);
    }).toList();

    setState(() {
      _filteredData = filtered;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Data'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                _filterData(value);
              },
              decoration: const InputDecoration(
                hintText: 'Search by name or number',
                border: OutlineInputBorder(),
                fillColor: Colors.white,
                filled: true,
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
        ),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _filteredData.isEmpty
              ? const Center(child: Text('No data found'))
              : ListView.builder(
                  itemCount: _filteredData.length,
                  itemBuilder: (context, index) => Card(
                    margin: const EdgeInsets.all(15),
                    child: ListTile(
                      title: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Text(
                          _filteredData[index]['name'],
                          style: const TextStyle(fontSize: 20),
                        ),
                      ),
                      subtitle: Text(_filteredData[index]['number']),
                    ),
                  ),
                ),
    );
  }
}
