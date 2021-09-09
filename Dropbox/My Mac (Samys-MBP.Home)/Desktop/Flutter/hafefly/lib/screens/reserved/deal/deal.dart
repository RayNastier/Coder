import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hafefly/screens/home/homeWrappe.dart';

class DealView extends StatelessWidget {
  const DealView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
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
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    child: Center(
                      child: Text(
                        'What happens in the barbershop stays in the barbershop',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Alfa_Slab_One',
                            fontSize: 26),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 20, left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 7),
                    child: Text(
                      'Help us grow better',
                      style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 1.7,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5),
                    child: Text(
                      'feel free to give a review',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 7),
                    child: Row(
                      children: [
                        Icon(Icons.star_rounded, color: Colors.white, size: 40),
                        Icon(Icons.star_rounded, color: Colors.white, size: 40),
                        Icon(Icons.star_rounded, color: Colors.white, size: 40),
                        Icon(Icons.star_rounded, color: Colors.white, size: 40),
                        Icon(Icons.star_rounded, color: Colors.white, size: 40),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: BoxDecoration(
                  color: Color(0xb2394180),
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(7)
                ),
                height: height / 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Text(
                        'leave your experience',
                        style: TextStyle(
                          color: Colors.white, 
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                        ),
                        ),
                      ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: TextFormField(
                        keyboardType: TextInputType.multiline,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Container(
                width: width,
                margin: EdgeInsets.only(left: 10, right: 10, top: height / 10),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomeWrappePage()));
                  }, 
                  child: Text('Back home'),
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color(0xffef9227))),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
