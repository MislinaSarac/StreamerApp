import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class MoviesSection extends StatelessWidget {
  MoviesSection({super.key});

  List images = [
    'Thor Love And Thunder',
    'Avatar 2',
    'Black Panther2',
    'Black Adam',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 300,
            enlargeCenterPage: true,
            enlargeStrategy: CenterPageEnlargeStrategy.height,
            autoPlay: true,
            aspectRatio: 16 / 9,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: const Duration(microseconds: 500),
            viewportFraction: 0.65,
          ),
          items: [
            for (int i = 0; i < images.length; i++)
              InkWell(
                onTap: () {
                  //Navigator.push(context, route),
                },
                child: Container(
                  margin: const EdgeInsets.all(6),
                  child: Column(children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        "assets/images/${images[i]}.jpg",
                        height: 250,
                        width: 250,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "PG-13",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "Action",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.amber),
                              SizedBox(width: 5),
                              Text(
                                "4.8",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      images[i],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ]),
                ),
              )
          ],
        ),
      ],
    );
  }
}
