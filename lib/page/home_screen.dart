import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projek_contact/db_helper.dart';
import 'search_screen.dart';
import 'detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> _allData = [];
  bool _isLoading = true;

  void _refreshData() async {
    final data = await SQLHelper.getAllData();
    setState(() {
      _allData = data;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _refreshData();
  }

  Future<void> _addData() async {
    if (_formkeys.currentState!.validate()) {
      await SQLHelper.createData(
        _nameController.text, 
        _numberController.text, 
        _emailController.text, 
        _categoryController.text,
        _notesController.text
      );
      _refreshData();
    }
  }

  Future<void> _updateData(int id) async {
    if (_formkeys.currentState!.validate()) {
      await SQLHelper.updateData(
        id, 
        _nameController.text, 
        _numberController.text, 
        _emailController.text, 
        _categoryController.text,
        _notesController.text,
      );
      _refreshData();
    }
  }

  void _deleteData(int id) async {
    await SQLHelper.deleteData(id);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      backgroundColor: Colors.black,
      content: Text('Data deleted')
    ));
    _refreshData();
  }

  final _formkeys = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();

  void showBottomSheet(int? id) async {
  if (id != null) {
    final existingData = _allData.firstWhere(
      (element) => element['id'] == id,
      orElse: () => {},
    );
    _nameController.text = existingData['name'] ?? '';
    _numberController.text = existingData['number'] ?? '';
    _emailController.text = existingData['email'] ?? '';
    _categoryController.text = existingData['category'] ?? '';
    _notesController.text = existingData['notes'] ?? '-';
  } else {
    _nameController.clear();
    _numberController.clear();
    _emailController.clear();
    _categoryController.clear();
    _notesController.clear();
  }

  showModalBottomSheet(
    elevation: 5,
    isScrollControlled: true,
    context: context,
    builder: (_) => SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
          top: 30,
          left: 15,
          right: 15,
          bottom: MediaQuery.of(context).viewInsets.bottom + 50,
        ),
        child: Form(
          key: _formkeys,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // Name
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'name',
                  prefixIcon: Icon(Icons.person),  // Icon added here
                ),
                validator: (name) {
                  if (name == null || name.isEmpty) {
                    return 'Name should be at least 1 character';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              // Number
              TextFormField(
                controller: _numberController,
                maxLength: 13,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'number',
                  prefixIcon: Icon(Icons.phone),  // Icon added here
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                validator: (number) {
                  if (number == null || number.isEmpty) {
                    return 'Number should be at least 1 character';
                  }
                                      return null;
                },
              ),
              const SizedBox(height: 10),
              // Email
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'email',
                  prefixIcon: Icon(Icons.email),  // Icon added here
                ),
                validator: (email) {
                  if (email == null || email.isEmpty) {
                    return 'Email should be at least 1 character';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              // Category
              TextFormField(
                controller: _categoryController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'category',
                  prefixIcon: Icon(Icons.category),  // Icon added here
                ),
                validator: (category) {
                  if (category == null || category.isEmpty) {
                    return 'Category should be at least 1 character';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              // Notes
              TextFormField(
                controller: _notesController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'notes',
                  prefixIcon: Icon(Icons.notes),  // Icon added here
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formkeys.currentState!.validate()) {
                      if (id == null) {
                        await _addData();
                      } else {
                        await _updateData(id);
                      }
                      _nameController.text = '';
                      _numberController.text = '';
                      _emailController.text = '';
                      _categoryController.text = '';
                      _notesController.text = '-';

                      Navigator.of(context).pop();
                      print('Data Added');
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: Text(
                      id == null ? 'Add Data' : 'Update',
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Contact'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => SearchScreen()),
              );
            },
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _allData.length,
              itemBuilder: (context, index) => Card(
                margin: const EdgeInsets.all(15),
                child: ListTile(
                  title: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      _allData[index]['name'] ?? '',
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(_allData[index]['number'] ?? ''),
                      Text(_allData[index]['email'] ?? ''),
                      Text(_allData[index]['category'] ?? ''),
                      Text(_allData[index]['notes'] ?? ''),
                    ],
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          showBottomSheet(_allData[index]['id']);
                        },
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.indigo,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          _deleteData(_allData[index]['id']);
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.redAccent,
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(contact: _allData[index]),
                      ),
                    );
                  },
                ),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showBottomSheet(null),
        child: const Icon(Icons.add),
      ),
    );
  }
}

