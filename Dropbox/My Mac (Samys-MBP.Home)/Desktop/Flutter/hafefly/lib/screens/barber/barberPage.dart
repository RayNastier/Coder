import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hafefly/models/barbers.dart';
import 'package:hafefly/screens/barber/haircutPage.dart';

// ignore: must_be_immutable
class BarberPage extends StatelessWidget {
  BarberPage({Key? key, required this.barber}) : super(key: key);
  Barber barber;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double imageWidth;
    double imagePaddingTop;
    double secondCardTop;
    double secondCardHeight;

    if (width < 400) {
      imageWidth = 90;
      imagePaddingTop = 50;
      secondCardTop = 10;
      secondCardHeight = 70;
    } else {
      imageWidth = 110;
      imagePaddingTop = 100;
      secondCardTop = 20;
      secondCardHeight = 75;
    }
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xff191b2c), Color(0xff191c31), Color(0xff192270)],
          ),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: width,
                  height: height / 3.3,
                  decoration: BoxDecoration(
                      color: Color(0xff394180),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20))),
                ),
                Container(
                  child: Row(
                    children: [
                      Hero(
                          tag: 'dash${barber.firstName}',
                          child: Container(
                              width: imageWidth,
                              margin: EdgeInsets.only(
                                  top: imagePaddingTop, left: width / 12),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(25)),
                              child: Image.asset('assets/BarberImage2.png'))),
                      Container(
                        margin: EdgeInsets.only(left: 20, top: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 5),
                              child: Text(
                                '${barber.firstName} ${barber.lastName}',
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 5),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.schedule_rounded,
                                    color: Colors.white,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 5),
                                    child: Text(
                                      '${barber.experience} years of experience',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 5),
                              child: Text(
                                barber.bio,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 20, left: width / 3),
                              child: Column(
                                children: [
                                  Row(children: [
                                    Icon(Icons.star_rounded,
                                        color: Colors.amberAccent),
                                    Text(
                                      '${barber.rating}',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    )
                                  ]),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(
                  left: 10,
                  right: 10,
                  bottom: secondCardTop,
                  top: secondCardTop),
              height: secondCardHeight,
              decoration: BoxDecoration(
                color: Color(0xff394180),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 10, left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: Text(
                            'Working Hours',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Text(
                          barber.workingHours,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(width: 100, child: Image.asset('assets/mower.png'))
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              height: height / 2.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0xff394180),
              ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 20, top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Icon(
                                Icons.thumb_up_rounded,
                                color: Colors.white,
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                child: Text('Reviews',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25)),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 20),
                          child: Text('View all',
                              style: TextStyle(
                                  color: Colors.white,
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18)),
                        )
                      ],
                    ),
                  )
                ],
              ),
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
                            builder: (context) => Haircut(barber: barber)));
                  },
                  child: Text(
                    'Book',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xffef9227))),
                ))
          ],
        ),
      ),
    );
  }
}
