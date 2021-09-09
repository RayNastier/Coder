import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hafefly/models/babershopModel.dart';
import 'package:hafefly/screens/barbershop/barbershopPage.dart';
import 'package:hafefly/screens/home/pages/map.dart';

// ignore: must_be_immutable
class BarbershopCard extends StatelessWidget {
  BarbershopCard({Key? key, required this.barbershop}) : super(key: key);
  Barbershop barbershop;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            color: Color(0xd63e457b),
            boxShadow: [
              BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0),
            ]),
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => BarbershopPage(
                          barbershop: barbershop,
                        )));
          },
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
                            barbershop.name,
                            style: const TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Rubik"),
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Icon(
                                Icons.place,
                                size: 15,
                                color: Color(0xFFD6D6D6),
                              ),
                              Text(
                                barbershop.location,
                                style: const TextStyle(
                                    fontSize: 13,
                                    color: Color(0xFFD6D6D6),
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(height: 22),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.amberAccent[400],
                                size: 17,
                              ),
                              Text(
                                '${barbershop.rating}',
                                style: const TextStyle(
                                    fontSize: 15, color: Color(0xFFD6D6D6)),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Stack(
                        alignment: AlignmentDirectional.bottomEnd,
                        children: [
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
                              "assets/${barbershop.name}.png",
                              width: 170,
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.only(right: 10, bottom: 10),
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                  color: Colors.blueAccent,
                                  borderRadius: BorderRadius.circular(40)),
                              child: IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MapView()));
                                },
                                icon: Icon(Icons.navigation_rounded),
                                color: Colors.white,
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
