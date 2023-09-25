// // ignore_for_file: unused_field, library_private_types_in_public_api

// import 'package:flutter/material.dart';
// import 'main_page.dart';
// import 'services_page.dart';
// import 'account_page.dart';


// class Homepage extends StatefulWidget {
//   const Homepage({Key? key}) : super(key: key);

//   @override
//   _HomepageState createState() => _HomepageState();
// }

// class _HomepageState extends State<Homepage> {
//   final TextEditingController _nameController = TextEditingController();
//   final String _userName = ''; // Current user name
//   final bool _editingName = false; // Flag to track name editing state

//   // ... Rest of the code ...

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Scaffold(
//         body: Padding(
//           padding: const EdgeInsets.only(top: 0.0),
//           child: DefaultTabController(
//             length: 3,
//             child: Scaffold(
//               appBar: AppBar(
//                 bottom: PreferredSize(
//                   preferredSize: const Size.fromHeight(20),
//                   child: Container(
//                     color: Colors.white,
//                     child: TabBar(
//                       labelColor: Colors.black,
//                       unselectedLabelColor: Colors.black,
//                       indicatorSize: TabBarIndicatorSize.tab,
//                       indicator: BoxDecoration(
//                         borderRadius: BorderRadius.circular(100.0),
//                         color: Colors.blue,
//                       ),
//                       tabs: const [
//                         Tab(text: 'Home'),
//                         Tab(text: 'Services'),
//                         Tab(text: 'Account'),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               body: const TabBarView(
//                 children: [
//                   MainPage(),
//                   Services(),
//                   AccountPage(),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'main_page.dart';
import 'services_page.dart';
import 'account_page.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    MainPage(),
    Services(),
    AccountPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 255, 253, 253),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Services',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
      
    );
  }
}
