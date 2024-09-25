import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/screens/welcome_screen.dart';
import '../screens/chat_screen.dart';
import '../screens/filterd_screen.dart';

class AppDrawer extends StatelessWidget {
  final _auth = FirebaseAuth.instance;
  const AppDrawer({super.key});
  Widget buildListTile(String title, IconData icon, VoidCallback onTapLink) {
    return ListTile(
      leading: Icon(
        icon,
        size: 30,
        color: Colors.blue,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'Elmessiri',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onTapLink,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            padding: EdgeInsets.only(top: 40),
            alignment: Alignment.center,
            color: Colors.amber, //accentColor
            child: Text(
              'دليلك السياحي',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile('الرحلات', Icons.card_travel, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          buildListTile('الفلترة ', Icons.filter_list, () {
            Navigator.of(context)
                .pushReplacementNamed(FilterdScreen.screenRoute);
          }),
          buildListTile('تواصل مع خدمة العملاء ', Icons.chat, () {
            Navigator.of(context).pushReplacementNamed(ChatScreen.screenRoute);
          }),
          buildListTile('تسجيل الخروج', Icons.exit_to_app, () {
            _auth.signOut();
            Navigator.of(context)
                .pushReplacementNamed(WelcomeScreen.screenRoute);
          }),
        ],
      ),
    );
  }
}
