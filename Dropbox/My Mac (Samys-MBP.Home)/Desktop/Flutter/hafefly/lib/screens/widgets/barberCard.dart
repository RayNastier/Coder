import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hafefly/models/barbers.dart';
import 'package:hafefly/screens/barber/barberPage.dart';
import 'package:tcard/tcard.dart';

class Tinder extends StatefulWidget {
  Tinder({Key? key}) : super(key: key);

  @override
  _Tinder createState() => _Tinder();
}

class _Tinder extends State<Tinder> {

  // TODO: FIXME:
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    TCardController _controller = TCardController();
    // ignore: unused_local_variable
    int _index = 0;

    List<Widget> cards = List.generate(
      barbers.length,
      (int index) {
        return BarberCard(barber: barbers[index]);
      },
    );
    return Center(
      child: Column(
        children: <Widget>[
          TCard(
            size: Size(width, height / 1.9),
            cards: cards,
            controller: _controller,
            onForward: (index, info) {
              _index = index;
              print(info.direction);
              setState(() {});
            },
            onBack: (index, info) {
              _index = index;
              setState(() {});
            },
            onEnd: () {
              print('end');
            },
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class BarberCard extends StatelessWidget {
  BarberCard({Key? key, required this.barber}) : super(key: key);
  Barber barber;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double buttonMargin;
    double containerHeight;
    double buttonWidth;
    double buttonRadius;
    double ratingPadding;
    double buttonFontSize;
    if (width < 400) {
      buttonMargin = 10;
      containerHeight = height / 2.1;
      buttonWidth = width / 1.35;
      buttonRadius = 7;
      ratingPadding = 100;
      buttonFontSize = 15;
    } else {
      buttonMargin = 30;
      containerHeight = height / 2.8;
      buttonWidth = width / 1.3;
      buttonRadius = 10;
      ratingPadding = 150;
      buttonFontSize = 24;
    }
    return Stack(
      children: [
        Container(
          height: containerHeight,
          margin: EdgeInsets.only(left: 20, right: 20, top: 20),
          decoration: BoxDecoration(
            color: Color(0xff394180),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black54,
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Hero(
                    tag: 'dash${barber.firstName}',
                    child: Container(
                      margin: EdgeInsets.only(left: 40, top: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black54,
                            blurRadius: 10,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Image.asset('assets/BarberAvatar.png'),
                    )),
                Container(
                  width: 200,
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 10, top: 20),
                            child: Text(
                              '${barber.firstName} ${barber.lastName}',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10, top: 5),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.schedule_rounded,
                                  color: Colors.white,
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 5),
                                  child: Text(
                                    '${barber.experience} years of exp',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                              margin:
                                  EdgeInsets.only(top: 30, left: ratingPadding),
                              child: Row(children: [
                                Icon(Icons.star_rounded,
                                    color: Colors.amberAccent),
                                Text(
                                  '${barber.rating}',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                )
                              ])),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 10, left: 40),
              child: Text('Working Hours',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white)),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, left: 40),
              child: Text('${barber.workingHours}',
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 15,
                      color: Colors.white)),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, left: 40),
              child: Text('${barber.bio}',
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 18,
                      color: Colors.white60)),
            ),
            Container(
              width: buttonWidth,
              height: height / 18,
              margin: EdgeInsets.only(left: 30, top: buttonMargin),
              child: ElevatedButton.icon(
                icon: Icon(Icons.book_rounded),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BarberPage(barber: barber)));
                },
                label: Text(
                  'Book',
                  style: TextStyle(fontSize: buttonFontSize),
                ),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xffef9227)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(buttonRadius)))),
              ),
            )
          ],
        ),
      ],
    );
  }
}
