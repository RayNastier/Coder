import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hafefly/models/CategoryModel.dart';
import 'package:hafefly/models/babershopModel.dart';
import 'package:hafefly/screens/categories/categoryPage.dart';

class CategoriesScroller extends StatelessWidget {
  const CategoriesScroller();

  @override
  Widget build(BuildContext context) {
    Category category =
        Category(name: "", icon: Icons.ac_unit, color: Colors.amber);
    late final double categoryHeight =
        MediaQuery.of(context).size.height * 0.25;
    var width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: FittedBox(
          fit: BoxFit.fill,
          alignment: Alignment.topCenter,
          child: Row(
            children: <Widget>[
              InkWell(
                onTap: () {
                  category.name = "Favorites";
                  category.icon = Icons.favorite_rounded;
                  category.color = Colors.red.shade700;
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CategoryPage(
                                category: category,
                                cardIndex: 1,
                              )));
                },
                child: Container(
                  width: width / 2.5,
                  margin: EdgeInsets.only(right: 20),
                  height: categoryHeight,
                  decoration: BoxDecoration(
                      color: Colors.red.shade700,
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(right: 10, top: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Favorites",
                                style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "${favoriteBarbershops.length} barbershops",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.only(
                                top: 7, left: 6, bottom: 6, right: 6),
                            margin: EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.white),
                            child: Icon(Icons.favorite_rounded,
                                color: Colors.red.shade700, size: 35))
                      ],
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  category.name = "Highest Ratings";
                  category.icon = Icons.star_rounded;
                  category.color = Colors.amberAccent.shade700;
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CategoryPage(
                                category: category,
                                cardIndex: 2,
                              )));
                },
                child: Container(
                  width: width / 2.5,
                  margin: EdgeInsets.only(right: 20),
                  height: categoryHeight,
                  decoration: BoxDecoration(
                      color: Colors.amberAccent.shade700,
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(right: 10, top: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Highest",
                                style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Ratings",
                                style: TextStyle(
                                    fontSize: 19,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "${favoriteBarbershops.length} barbershops",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.only(
                                top: 7, left: 6, bottom: 6, right: 6),
                            margin: EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.white),
                            child: Icon(Icons.star_rounded,
                                color: Colors.amberAccent.shade700, size: 35))
                      ],
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  category.name = "Nearby";
                  category.icon = Icons.navigation_rounded;
                  category.color = Colors.lightBlue.shade700;
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              CategoryPage(category: category, cardIndex: 3)));
                },
                child: Container(
                  width: width / 2.5,
                  margin: EdgeInsets.only(right: 20),
                  height: categoryHeight,
                  decoration: BoxDecoration(
                      color: Colors.lightBlueAccent.shade400,
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(right: 10, top: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Nearby",
                                style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "${favoriteBarbershops.length} barbershops",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.only(
                                top: 7, left: 6, bottom: 6, right: 6),
                            margin: EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.white),
                            child: Icon(Icons.navigation_rounded,
                                color: Colors.lightBlue.shade400, size: 35))
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
