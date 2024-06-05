import 'package:flutter/material.dart';
import 'package:projek_contact/page/calls_screen.dart';
import 'package:projek_contact/page/forgot_password.dart';
import 'package:projek_contact/page/home_screen.dart';

class ParentPage extends StatefulWidget {
  const ParentPage({super.key});

  @override
  State<ParentPage> createState() => _ParentPageState();
}

class _ParentPageState extends State<ParentPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const CallsScreen(),
    const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages.elementAt(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.call),
            label: 'Calls',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(int.parse('F3F3F3', radix: 16) + 0xFF000000),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Profile'),
        actions: const [
          Icon(Icons.more_vert),
        ],
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(2),
              width: double.infinity,
              child: const Row(
                children: [
                  Text(
                    'Username: ',
                    style: TextStyle(
                      fontSize: 16, 
                      color: Colors.black, 
                    ),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    'Budi',
                    style: TextStyle(
                      fontSize: 16, 
                      color: Colors.black, 
                      fontWeight: FontWeight.bold
                    ),
                    textAlign: TextAlign.left,
                  ),
                ]
              )
            ),
            Container(
              padding: const EdgeInsets.all(2),
              width: double.infinity,
              child: const Row(
                children: [
                  Text(
                    'Email: ',
                    style: TextStyle(
                      fontSize: 16, 
                      color: Colors.black, 
                    ),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    'budi01@gmail.com ',
                    style: TextStyle(
                      fontSize: 16, 
                      color: Colors.black, 
                      fontWeight: FontWeight.bold
                    ),
                    textAlign: TextAlign.left,
                  ),
                  Icon(
                    Icons.verified,
                    color: Colors.green,
                  ), 
                ]
              )
            ),
            Container(
              padding: const EdgeInsets.all(2),
              width: double.infinity,
              child: const Text(
                'You have 20 contact on your phone',
                style: TextStyle( 
                  fontSize: 14, 
                  color: Colors.grey, 
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(2),
              width: double.infinity,
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                  MaterialPageRoute(builder: (_) =>const ForgotPassword()));
                },
                child: const Text('Change password',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}