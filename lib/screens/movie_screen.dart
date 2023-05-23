import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MovieScreen extends StatelessWidget {
  String image;

  MovieScreen(this.image);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 1.8,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/${image}.jpg"),
                    opacity: 0.8,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(top: 60, left: 10),
                  // padding: EdgeInsets.symmetric(vertical: 35, horizontal: 10),
                  child: InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Icon(Icons.arrow_back_ios_new,
                          color: Colors.red.shade900, size: 30)),
                ),
              )
            ],
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.all(8),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    image,
                    style: TextStyle(
                      color: Colors.red.shade900,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children:const [
                      Text(
                        "PG-13",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: 40),
                      Text(
                        "Action",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: 40),
                      Text(
                        "2.15 Hours",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  RatingBar.builder(
                      initialRating: 3,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 25,
                      unratedColor: Colors.white,
                      itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                      onRatingUpdate: (rating) {}),
                  SizedBox(height: 20),
                  Text(
                    "Long Live Wakanda is a new American superhero movie based on the Marvel Comics character Black Panther. Produced by Marvel Studios and distributed by Walt Disney Studios Motion Pictures, the film is intended to be the sequel to Black Panther and the 30th film in the Marvel Cinematic Universe.",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
          margin: EdgeInsets.all(25),
          child: Row(children: [
            Material(
              color: Colors.red.shade900,
              borderRadius: BorderRadius.circular(12),
              child: InkWell(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Row(children: [
                      Icon(
                        Icons.favorite,
                        size: 30,
                        color: Colors.white,
                      ),
                      SizedBox(width: 8),
                      Text(
                        "Add to Wishlist",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ]),
                  )),
            ),
            Material(
              color: Colors.red.shade900,
              borderRadius: BorderRadius.circular(30),
              child: InkWell(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Icon(
                    Icons.play_arrow_rounded,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ])),
    );
  }
}
