import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hafefly/models/CategoryModel.dart';
import 'package:hafefly/models/babershopModel.dart';

// ignore: must_be_immutable
class CategoryPage extends StatelessWidget {
  ScrollController controller = ScrollController();
  bool closeTopContainer = false;
  double topContainer = 0;
  List<Widget> list = [];

  final Category category;
  final int cardIndex;
  List<Barbershop> data = [];
  //FIXME:

  List<Barbershop> dataGetter() {
    switch (cardIndex) {
      case 1:
        return data = favoriteBarbershops;
      case 2:
        return data = favoriteBarbershops;
      case 3:
        return data = favoriteBarbershops;
      default:
        return data = [];
    }
  }


  CategoryPage({Key? key, required this.category, required this.cardIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    data.forEach((element) {
      list.add(Container(
          height: 100,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              color: Color(0xd63e457b),
              boxShadow: [
                BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0),
              ]),
          child: InkWell(
            onTap: () {},
            child: Stack(
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(height: 10),
                            Text(
                              element.name,
                              style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Rubik"),
                            ),
                            SizedBox(height: 22),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Color(0xFFD6D6D6),
                                  size: 15,
                                ),
                                Text(
                                  "${element.rating}",
                                  style: const TextStyle(
                                      fontSize: 13, color: Color(0xFFD6D6D6)),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.place,
                                  size: 15,
                                  color: Color(0xFFD6D6D6),
                                ),
                                Text(
                                  element.location,
                                  style: const TextStyle(
                                      fontSize: 13,
                                      color: Color(0xFFD6D6D6),
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                        ShaderMask(
                          shaderCallback: (rect) {
                            return LinearGradient(
                              begin: Alignment.centerRight,
                              end: Alignment.centerLeft,
                              colors: [Colors.black, Colors.transparent],
                            ).createShader(
                                Rect.fromLTRB(0, 0, rect.width, rect.height));
                          },
                          blendMode: BlendMode.dstIn,
                          child: Image.asset(
                            "assets/${element.name}x2.png",
                            width: 170,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )));
    });
    return Scaffold(
      appBar: AppBar(
        title: new Text(
          category.name,
          style: TextStyle(fontFamily: "rum-raising", fontSize: 30),
        ),
        backgroundColor: category.color,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xff191b2c), Color(0xff191c31), Color(0xff192270)],
          ),
        ),
        child: Stack(children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xff1b2370),
                  Color(0xf31b2370),
                  Color(0x001a2270)
                ],
              ),
            ),
            child: Column(
              children: [
                Expanded(
                    child: ListView.builder(
                        controller: controller,
                        itemCount: list.length,
                        itemBuilder: (context, index) {
                          return Align(
                              heightFactor: 1,
                              alignment: Alignment.topCenter,
                              child: list[index]);
                        })),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, left: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
            ),
            padding: EdgeInsets.all(5),
            child: Icon(
              category.icon,
              color: category.color,
              size: 40,
            ),
          ),
        ]),
      ),
    );
  }
}
