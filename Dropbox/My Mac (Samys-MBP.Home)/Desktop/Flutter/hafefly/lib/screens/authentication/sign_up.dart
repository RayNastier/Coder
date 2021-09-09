import 'package:flutter/material.dart';
import 'package:hafefly/models/userInformation.dart';
import 'package:hafefly/screens/authentication/final_sign_up.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  UserInformation userInformation = UserInformation(
      firstname: 'firstname',
      lastname: 'lastname',
      phoneNumber: 'phoneNumber',
      age: 20,
      instagram: 'instagram',
      province: 'province');
  String firstname = '';
  String lastname = '';
  String province = '';
  String phoneNumber = '';
  int age = 00;
  final _formKey = GlobalKey<FormState>();
  final _phoneKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double imageSize;
    double topMargin;
    double verificationTextSize;
    if (width < 400) {
      imageSize = 220;
      topMargin = 30;
      verificationTextSize = 11;
    } else {
      imageSize = 250;
      topMargin = 110;
      verificationTextSize = 13;
    }
    var maxWidthChild = SizedBox(
        width: width / 3 - 60,
        height: 64,
        child: Center(
          child: Text(
            'Send Verification',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: verificationTextSize),
          ),
        ));
    return Scaffold(
      body: Container(
        width: width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xff191b2c), Color(0xff191c31), Color(0xff192270)],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: topMargin),
              width: imageSize,
              child: Image(
                image: AssetImage('assets/logo.png'),
              ),
            ),
            Container(
                child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Container(
                    width: width - 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        new Container(
                          width: width / 2 - 30,
                          child: new TextFormField(
                            onChanged: (val) {
                              setState(() {
                                firstname = '$val';
                              });
                            },
                            autocorrect: false,
                            validator: (val) =>
                                val!.length < 3 ? 'Enter your real name' : null,
                            style: TextStyle(
                                fontSize: 20, color: Color(0xff5680a7)),
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.blue, width: 2.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xff5680a7), width: 2.0),
                              ),
                              hintText: 'Firstname',
                              hintStyle: TextStyle(
                                  fontSize: 20.0, color: Color(0xff617282)),
                            ),
                          ),
                        ),
                        Container(
                          width: width / 2 - 30,
                          child: TextFormField(
                            onChanged: (val) {
                              setState(() {
                                lastname = '$val';
                              });
                            },
                            autocorrect: false,
                            validator: (val) =>
                                val!.length < 3 ? 'Enter your real name' : null,
                            style: TextStyle(
                                fontSize: 20, color: Color(0xff5680a7)),
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.blue, width: 2.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xff5680a7), width: 2.0),
                              ),
                              hintText: 'Lastname',
                              hintStyle: TextStyle(
                                  fontSize: 20.0, color: Color(0xff617282)),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Row(
                      children: [
                        Container(
                          width: 2 * width / 3 + 10,
                          child: TextFormField(
                            onChanged: (val) {
                              setState(() {
                                province = '$val';
                              });
                            },
                            validator: (val) => val!.length < 4
                                ? 'Enter a valid province'
                                : null,
                            autocorrect: false,
                            style: TextStyle(
                                fontSize: 20, color: Color(0xff5680a7)),
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.blue, width: 2.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xff5680a7), width: 2.0),
                              ),
                              hintText: 'Province',
                              hintStyle: TextStyle(
                                  fontSize: 20.0, color: Color(0xff617282)),
                            ),
                          ),
                        ),
                        Container(
                          width: width / 3 - 60,
                          margin: EdgeInsets.only(left: 10),
                          child: TextFormField(
                            onChanged: (val) {
                              setState(() {
                                age = int.parse(val);
                              });
                            },
                            validator: (val) =>
                                val!.length < 2 ? 'Enter your age' : null,
                            autocorrect: false,
                            keyboardType: TextInputType.number,
                            style: TextStyle(
                                fontSize: 20, color: Color(0xff5680a7)),
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.blue, width: 2.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xff5680a7), width: 2.0),
                              ),
                              hintText: 'Age',
                              hintStyle: TextStyle(
                                  fontSize: 20.0, color: Color(0xff617282)),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: width - 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Form(
                          key: _phoneKey,
                          child: Container(
                            width: 2 * width / 3 - 20,
                            child: TextFormField(
                              onChanged: (val) {
                                setState(() {
                                  phoneNumber = '$val';
                                });
                              },
                              validator: (val) => val!.length < 10
                                  ? 'Enter a valid phone number'
                                  : null,
                              autocorrect: false,
                              keyboardType: TextInputType.number,
                              style: TextStyle(
                                  fontSize: 20, color: Color(0xff5680a7)),
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blue, width: 2.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xff5680a7), width: 2.0),
                                ),
                                hintText: 'Phone number',
                                hintStyle: TextStyle(
                                    fontSize: 20.0, color: Color(0xff617282)),
                              ),
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (_phoneKey.currentState!.validate()) {
                              print('phone number is valid');
                            }
                          },
                          child: maxWidthChild,
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Color(0xff5680a7))),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: width - 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              'Didn\'t get verification code',
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                color: Color(0xffa9b3c6),
                                fontSize: 14,
                                decoration: TextDecoration.underline,
                                fontFamily: "SF Pro Display",
                                fontWeight: FontWeight.w600,
                              ),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            )),
            ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    userInformation.firstname = firstname;
                    userInformation.lastname = lastname;
                    userInformation.age = age;
                    userInformation.phoneNumber = phoneNumber;
                    userInformation.province = province;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FinalSignUpPage(userInformation)),
                    );
                  }
                },
                child: Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                style: ButtonStyle(
                    shadowColor: MaterialStateProperty.all(Color(0xff5680a7)),
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xff5680a7)),
                    padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(horizontal: 120, vertical: 15)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                            side: BorderSide(
                                color: Color(0xff5680a7), width: 3))))),
          ],
        ),
      ),
    );
  }
}
