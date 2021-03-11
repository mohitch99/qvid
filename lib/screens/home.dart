import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qvid/screens/my_videos.dart';
import 'package:qvid/screens/wall.dart';
import 'package:qvid/services/auth.dart';
import 'package:qvid/services/database.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();

  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    Wall(),
    MyVideos(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot?>.value(
      initialData: null,
      value: DatabaseService().videos,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Home',
          ),
          elevation: 0.0,
        ),
        drawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Row(
                  children: [
                    Text(
                      'Quantavid',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                    Container(
                      width: 150,
                      child: Image.asset(
                        'images/logo.jpeg',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              ListTile(
                title: Text('About'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                title: Text('Rate Us'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                title: Text('Privacy Policy'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              Center(
                widthFactor: 10,
                child: ElevatedButton(
                  child: Text('Sign Out'),
                  onPressed: () async {
                    // Update the state of the app.
                    // ...
                    await _auth.signOut();
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.red,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'My Videos',
              backgroundColor: Colors.green,
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
