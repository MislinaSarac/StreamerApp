import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_stream/screens/home_screen.dart';
import 'package:movie_stream/screens/live_home.dart';
import 'package:movie_stream/screens/login_page.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    bool isNotifications = true;
    return Drawer(
      backgroundColor: Colors.black,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child: Container(
            decoration:
                BoxDecoration(color: Colors.red.shade300.withOpacity(0.4)),
            child: ListView(
              children: [
                const DrawerHeader(
                  child: Image(
                      image: AssetImage("assets/images/movies.png"),
                      fit: BoxFit.fitWidth),
                ),
                Container(
                  child: InkWell(
                    // onTap: () => Navigator.pop(context),
                    child: _draverItem(
                        onTap: () => Navigator.pop(context),
                        iconData: CupertinoIcons.house,
                        title: "Home"),
                  ),
                ),
                Container(
                  child: InkWell(
                    // onTap: () => Navigator.pop(context),
                    child: _draverItem(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LiveHome())),
                        iconData: Icons.live_tv,
                        title: "Live"),
                  ),
                ),
                _draverItem(
                    onTap: () {},
                    iconData: CupertinoIcons.play,
                    title: "Play List"),
                _draverItem(
                    onTap: () {},
                    iconData: Icons.notifications,
                    title: "Notifications",
                    trailing: isNotifications == true
                        ? const Icon(Icons.one_k_sharp)
                        : null),
                const Divider(
                  color: Colors.white,
                  endIndent: 20,
                  indent: 20,
                ),
                _draverItem(
                    onTap: () {}, iconData: CupertinoIcons.info, title: "Help"),
                Container(
                  child: InkWell(
                    child: _draverItem(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage())),
                        iconData: Icons.logout,
                        title: "Logout"),
                  ),
                ),
              ],
            )),
      ),
    );
  }

  ListTile _draverItem(
          {required VoidCallback onTap,
          required iconData,
          required String title,
          Widget? trailing}) =>
      ListTile(
        onTap: onTap,
        leading: Icon(
          iconData,
          color: Colors.white,
        ),
        title: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: trailing,
      );
}
