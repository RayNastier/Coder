import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hafefly/models/haircutModels.dart';

// ignore: must_be_immutable
class HaircutCard extends StatelessWidget {
  HaircutCard({Key? key, required this.haircut})
      : super(key: key);
  HaircutModel haircut;

  @override
  Widget build(BuildContext context) {
    int index = 0;
    List<Color> myColors = [Colors.black, Colors.amber];
    return Center(
      child: Stack(
        children: [
          Container(
            width: 140,
            height: 140,
            decoration: BoxDecoration(
              color: Color(0xff394180),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: myColors[index],
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Container(
              child: Image.asset('assets/${haircut.name}.png'),
              margin: EdgeInsets.only(top: 12),
            ),
          ),
          Container(
            width: 140,
            height: 140,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 5, right: 10),
                      decoration: BoxDecoration(
                          color: Color(0x3d6c7cff),
                          borderRadius: BorderRadius.circular(10)),
                      padding: EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                      child: Text('+${haircut.price}DA',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 75, left: 10),
                      decoration: BoxDecoration(
                          color: Color(0x3d6c7cff),
                          borderRadius: BorderRadius.circular(10)),
                      padding: EdgeInsets.all(6),
                      child: Text(haircut.name,
                          style: TextStyle(
                            color: Colors.white,
                          )),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
