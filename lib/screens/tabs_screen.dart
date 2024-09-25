// import 'package:flutter/material.dart';
// import 'categories_screen.dart';
// import 'favorites_screen.dart';

// class TabsScreen extends StatelessWidget {
//   const TabsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//         length: 2,
//         child: Scaffold(
//           appBar: AppBar(
//             title: Text('دليل سياحي'),
//             bottom: TabBar(
//               tabs: [
//                 Tab(
//                   icon: Icon(Icons.dashboard),
//                   text: 'التصنيفات',
//                 ),
//                 Tab(
//                   icon: Icon(Icons.star),
//                   text: 'المفضلة',
//                 ),
//               ],
//             ),
//           ),
//           body: TabBarView(
//             children: [
//               CategoriesScreen(),
//               FavoritesScreen(),
//             ],
//           ),
//         ));
//   }
// }

import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';
import 'categories_screen.dart';
import 'favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});
  static const screenRoute = '/trip-screen';

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectScreenIndex = 0;
  void _selectScreen(int index) {
    setState(() {
      _selectScreenIndex = index;
    });
  }

  // final List<Widget> _screens = [
  //   CategoriesScreen(),
  //   FavoritesScreen(),
  // ];

  final List<Map<String, Widget>> _screens = [
    {
      'Screen': CategoriesScreen(),
      'Title': Text(
        'تصنيفات الرحلات',
        style: TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontFamily: 'Elmessiri',
          fontWeight: FontWeight.bold,
        ),
      )
    },
    {
      'Screen': FavoritesScreen(),
      'Title': Text(
        'الرحلات المفضلة',
        style: TextStyle(
          color: Colors.white,
          fontSize: 26,
          fontFamily: 'Elmessiri',
          fontWeight: FontWeight.bold,
        ),
      )
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _screens[_selectScreenIndex]['Title'],
        backgroundColor: Colors.blue,
      ),
      drawer: Drawer(
        child: AppDrawer(),
      ),
      body: _screens[_selectScreenIndex]['Screen'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.white,
        currentIndex: _selectScreenIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'التصنيفات',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'المفضلة',
          ),
        ],
      ),
    );
  }
}
