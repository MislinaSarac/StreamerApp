import 'package:circular_menu/circular_menu.dart';
import 'package:flutter/material.dart';

class Director extends StatefulWidget {
  const Director({super.key});

  @override
  State<Director> createState() => _DirectorState();
}

class _DirectorState extends State<Director> {
  late String _colorName;
  late Color _color;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.red.shade900,
          title: Text('Living Director'),
        ),
        body: CircularMenu(
          alignment: Alignment.center,
          backgroundWidget: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(100.0),
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(
                          color: Colors.black,
                          fontStyle: FontStyle.italic,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                      children: <TextSpan>[
                        TextSpan(text: 'Press the menu button'),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          curve: Curves.bounceOut,
          reverseCurve: Curves.bounceInOut,
          toggleButtonColor: Colors.red.shade900,
          items: [
            CircularMenuItem(
                icon: Icons.home,
                color: Colors.amber,
                onTap: () {
                  setState(() {
                    _color = Colors.amber;
                    _colorName = 'Amber';
                  });
                }),
            CircularMenuItem(
                icon: Icons.join_full,
                color: Colors.purple,
                onTap: () {
                  setState(() {
                    _color = Colors.purple;
                    _colorName = 'purple';
                  });
                }),
            CircularMenuItem(
                icon: Icons.live_tv,
                color: Colors.pink,
                onTap: () {
                  setState(() {
                    _color = Colors.pink;
                    _colorName = 'Pink';
                  });
                }),
          ],
        ),
      ),
    );
  }
}
