import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hafefly/screens/home/homeWrappe.dart';

class NoDealView extends StatelessWidget {
  const NoDealView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: Container(
                width: width,
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: BoxDecoration(
                    color: Color(0xb2394180),
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(7)),
                height: height / 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10, left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Let us know what happened',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          Text(
                            'By contacting us on:',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10, bottom: 10),
                      child: Text(
                        'contact.raynmore@gmail.com', 
                        style: TextStyle(
                          color: Colors.white, 
                          fontWeight: FontWeight.bold, 
                          fontSize: 20
                        ),
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
                    Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeWrappePage()));
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
