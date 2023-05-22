import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this, initialIndex: 0);
    _tabController.addListener(_handleTabSection);
    super.initState();
  }

  _handleTabSection() {
    if (_tabController.indexIsChanging) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: Text('My Movies'),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(Icons.search),
          )
        ],
        leadingWidth: 50,
      ),
      body: ListView(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              height: 250,
              enlargeCenterPage: true,
              aspectRatio: 16 / 9,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: Duration(milliseconds: 500),
              viewportFraction: 0.8,
            ),
            items: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: AssetImage('assets/images/upcoming1.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: AssetImage('assets/images/upcoming2.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: AssetImage('assets/images/upcoming3.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          TabBar(
            controller: _tabController,
            unselectedLabelColor: Colors.white.withOpacity(0.5),
            isScrollable: true,
            indicator: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(10),
            ),
            labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            labelPadding: EdgeInsets.symmetric(horizontal: 20),
            padding: EdgeInsets.only(left: 10),
            tabs: const [
              Tab(text: "All"),
              Tab(text: "Action"),
              Tab(text: "Adventure"),
              Tab(text: "Comedy"),
            ],
          ),
          SizedBox(height: 20),
          Center(
            child: [
              Container(),
              Container(),
              Container(),
              Container(),
            ][_tabController.index],
          ),
        ],
      ),
    );
  }
}
