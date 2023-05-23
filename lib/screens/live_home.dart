import 'package:flutter/material.dart';
import 'package:movie_stream/screens/director.dart';
import 'package:movie_stream/screens/home_screen.dart';
import 'package:movie_stream/screens/participant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LiveHome extends StatefulWidget {
  const LiveHome({super.key});

  @override
  State<LiveHome> createState() => _LiveHomeState();
}

class _LiveHomeState extends State<LiveHome> {
  final _channelName = TextEditingController();
  final _userName = TextEditingController();
  late int uid;
  String check = '';

  @override
  void initState() {
    super.initState();
    getUserUid();
  }

  Future<void> getUserUid() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    int? storeUid = preferences.getInt("localUid");
    if (storeUid != null) {
      uid = storeUid;
      print("storeUID: $uid");
    } else {
      //should only happen once, unless they delete the app
      int time = DateTime.now().millisecondsSinceEpoch;
      uid = int.parse(time.toString().substring(1, time.toString().length - 3));
      preferences.setInt("localUid", uid);
      print("settingUID: $uid");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/streamer.png"),
              const SizedBox(height: 5),
              const Text("Multi Streaming with friends"),
              Icon(Icons.people_alt_sharp),
              const SizedBox(height: 40),
              SizedBox(
                width: MediaQuery.of(context).size.width * .85,
                child: TextField(
                  controller: _userName,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    hintText: 'User Name',
                  ),
                ),
              ),
              SizedBox(height: 8),
              SizedBox(
                width: MediaQuery.of(context).size.width * .85,
                child: TextField(
                  controller: _channelName,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      //borderSide: const BorderSide(color: Colors.grey),
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    hintText: 'Channel Name',
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Participant(),
                  ));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Participant  ',
                      style:
                          TextStyle(fontSize: 20, color: Colors.red.shade900),
                    ),
                    Icon(Icons.live_tv)
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Director(),
                  ));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Director  ',
                      style:
                          TextStyle(fontSize: 20, color: Colors.red.shade900),
                    ),
                    Icon(Icons.cut),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Home  ',
                      style:
                          TextStyle(fontSize: 20, color: Colors.red.shade900),
                    ),
                    Icon(Icons.home),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
