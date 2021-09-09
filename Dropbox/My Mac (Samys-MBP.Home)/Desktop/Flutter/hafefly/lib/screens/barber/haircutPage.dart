import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hafefly/models/barbers.dart';
import 'package:hafefly/models/haircutModels.dart';
import 'package:hafefly/screens/reserved/reserved.dart';
import 'package:hafefly/screens/widgets/haircutCard.dart';

// ignore: must_be_immutable
class Haircut extends StatelessWidget {
  Haircut({ Key? key, required this.barber}) : super(key: key);
  Barber barber;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    int total = 0;
    List<HaircutModel> haircuts = [
      HaircutModel(name: 'Fade', price: 300),
      HaircutModel(name: 'Razor', price: 50),
      HaircutModel(name: 'Scissors', price: 50),
      HaircutModel(name: 'Beard', price: 100),
      HaircutModel(name: 'Hairdryer', price: 50),
      HaircutModel(name: 'Straitener', price: 50),
    ];
    return Scaffold(
      appBar: AppBar(
        title: new Text(
          'Book',
          style: TextStyle(fontFamily: "rum-raising", fontSize: 30),
        ),
        backgroundColor: Color(0xff394180),
      ),
      body:
          Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xff191b2c), Color(0xff191c31), Color(0xff192270)],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 20, top: 20),
              child: Text('Choose Your haircut :',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
            ),
            SizedBox(height: 20),
            Container(
              child: Expanded(
                // TODO: FIXME: SHADOW ON TAP AND TOTAL PRICE,
                  child: GridView.count(
                crossAxisCount: 2,
                children: List.generate(haircuts.length, (index) {
                  return InkWell(
                      onTap: () {
                          total += haircuts[index].price;
                        print(total);
                      },
                      child: HaircutCard(haircut: haircuts[index]));
                }),
              )),
            ),
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10),
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color(0xff394180),
                  ),
                  child: Text('your total is: $total\ DA',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      )),
                ),
                Container(
                    width: width,
                    height: height / 18,
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ReservedPage(barber: barber,)));
                      },
                      child: Text(
                        'Book',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Color(0xffef9227))),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
