import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hafefly/models/barbers.dart';
import 'package:hafefly/screens/reserved/deal/deal.dart';
import 'package:hafefly/screens/reserved/nodeal/nodeal.dart';
import 'package:hafefly/screens/widgets/mapWidget.dart';

// ignore: must_be_immutable
class ReservedPage extends StatelessWidget {
  ReservedPage({Key? key, required this.barber}) : super(key: key);
  Barber barber;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    Radius bottom;
    if (width < 400) {
      bottom = Radius.circular(15);
    } else {
      bottom = Radius.circular(0);
    }
    return Scaffold(
      body: Container(
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
          children: [
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: height / 3 - 20),
                  height: height / 3,
                  color: Color(0xff252d63),
                  child: Container(
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 10, left: 30),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black54,
                                  blurRadius: 10,
                                  offset: Offset(0, 4),
                                ),
                              ]),
                          child: Image.asset('assets/BarberAvatar.png'),
                        ),
                        Container(
                          height: height / 5,
                          margin: EdgeInsets.only(top: 20, left: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${barber.firstName} ${barber.lastName}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                ),
                              ),
                              Row(
                                children: [
                                  Icon(Icons.phone_rounded,
                                      color: Colors.white),
                                  Container(
                                    margin: EdgeInsets.only(left: 10),
                                    child: Text(
                                      barber.phoneNumber,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset("assets/instagram.svg"),
                                  Container(
                                    margin: EdgeInsets.only(left: 10),
                                    child: Text(
                                      barber.instagram,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  height: height / 3,
                  width: width,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xc1161c41),
                          blurRadius: 20,
                          offset: Offset(0, 4),
                        ),
                      ],
                      color: Color(0xff394180),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Congrats',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 24),
                          ),
                          Image.asset('assets/saly.png')
                        ],
                      ),
                      Container(
                        child: Text(
                          'Your barber has been notified of your coming',
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                Container(
                  child: MapWidget(
                    latitude: barber.latitude,
                    longitude: barber.longitude,
                  ),
                ),
                Container(
                  width: width,
                  height: 70,
                  margin: EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                      color: Color(0xc1161c41),
                      borderRadius:
                          BorderRadius.only(topLeft: bottom, topRight: bottom)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DealView()));
                        },
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 7, horizontal: 20),
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(6)),
                          child: Text(
                            ' Deal ',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NoDealView()));
                        },
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 7, horizontal: 20),
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(6)),
                          child: Text(
                            'noDeal',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
