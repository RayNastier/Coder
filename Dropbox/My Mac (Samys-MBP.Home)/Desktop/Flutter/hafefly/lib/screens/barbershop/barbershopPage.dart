import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hafefly/models/babershopModel.dart';
import 'package:hafefly/screens/widgets/barberCard.dart';

class BarbershopPage extends StatelessWidget {
  const BarbershopPage({Key? key, required this.barbershop}) : super(key: key);
  final Barbershop barbershop;

  @override
  Widget build(BuildContext context) {
    Widget appBarTitle;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double imageHeight;
    if (width < 400) {
      imageHeight = height / 4;
    } else {
      imageHeight = height / 3.5;
    }

    if (barbershop.vip) {
      appBarTitle = Row(
        children: [
          Icon(Icons.verified_rounded, color: Color(0xff498df2)),
          Text(barbershop.name,
              style: TextStyle(fontFamily: "rum-raising", fontSize: 30)),
        ],
      );
    } else {
      appBarTitle = Text(barbershop.name,
          style: TextStyle(fontFamily: "rum-raising", fontSize: 30));
    }
    return Scaffold(
        appBar: AppBar(
          title: appBarTitle,
          backgroundColor: Color(0xff394180),
        ),
        body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xff191b2c),
                  Color(0xff191c31),
                  Color(0xff192270)
                ],
              ),
            ),
            child: Container(
              width: width,
              decoration: BoxDecoration(color: Color(0xff1b2371)),
              child: Column(
                children: [
                  Container(
                    height: imageHeight,
                    width: width,
                    child: ShaderMask(
                      shaderCallback: (rect) {
                        return LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.black, Colors.transparent],
                        ).createShader(
                            Rect.fromLTRB(0, 0, rect.width, rect.height));
                      },
                      blendMode: BlendMode.dstIn,
                      child: Image.asset(
                          "assets/ClientApp/${barbershop.name}.png",
                          fit: BoxFit.fitWidth),
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                  margin: EdgeInsets.symmetric(horizontal: 10),
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: Colors.blueAccent,
                                      borderRadius: BorderRadius.circular(40)),
                                  child: Icon(
                                    Icons.navigation_rounded,
                                    color: Colors.white,
                                  )),
                              Text(
                                barbershop.location,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                child: Icon(Icons.star_rounded,
                                    color: Colors.amberAccent),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 10),
                                child: Text('${barbershop.rating}',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Tinder(),
                ],
              ),
            )));
  }
}

