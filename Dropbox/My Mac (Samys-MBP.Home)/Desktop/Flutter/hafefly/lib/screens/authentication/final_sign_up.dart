import 'package:flutter/material.dart';
import 'package:hafefly/models/userInformation.dart';
import 'package:hafefly/screens/home/homeWrappe.dart';
import 'package:hafefly/services/auth.dart';

// ignore: must_be_immutable
class FinalSignUpPage extends StatefulWidget {
  FinalSignUpPage(this.userInformation);
  UserInformation userInformation = UserInformation(
      firstname: 'firstname',
      lastname: 'lastname',
      phoneNumber: 'phoneNumber',
      age: 20,
      instagram: 'instagram',
      province: 'province');
  @override
  _FinalSignUpPageState createState() => _FinalSignUpPageState();
}

class _FinalSignUpPageState extends State<FinalSignUpPage> {
  bool _obscureText = true;
  String email = '';
  String password = '';
  String rePassword = '';
  String error = '';
  final _formKey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double imageSize;
    if (width < 400) {
      imageSize = 250;
    } else {
      imageSize = 280;
    }
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
              width: imageSize,
              child: Image(
                image: AssetImage('assets/logo.png'),
              ),
            ),
            Container(
                child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: TextFormField(
                      validator: (val) =>
                          val!.isEmpty ? 'Enter an email' : null,
                      onChanged: (val) {
                        setState(() => email = val);
                      },
                      autocorrect: false,
                      style: TextStyle(fontSize: 20, color: Color(0xff5680a7)),
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blue, width: 2.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xff5680a7), width: 2.0),
                        ),
                        prefixIcon: const Icon(
                          Icons.person,
                          color: Color(0xff5680a7),
                        ),
                        hintText: 'email',
                        hintStyle:
                            TextStyle(fontSize: 20.0, color: Color(0xff617282)),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: TextFormField(
                      validator: (val) => val!.length < 6
                          ? 'Enter a password six+ chars long'
                          : null,
                      onChanged: (val) {
                        setState(() => password = val);
                      },
                      enableSuggestions: false,
                      autocorrect: false,
                      style: TextStyle(fontSize: 20, color: Color(0xff5680a7)),
                      obscureText: _obscureText,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blue, width: 2.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xff5680a7), width: 2.0),
                        ),
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: Color(0xff5680a7),
                        ),
                        suffixIcon: Padding(
                            padding: const EdgeInsets.only(right: 6),
                            child: TextButton(
                              onPressed: _toggle,
                              child: _obscureText
                                  ? Icon(
                                      Icons.visibility_off,
                                      color: Color(0xff617282),
                                    )
                                  : Icon(
                                      Icons.visibility,
                                      color: Color(0xff5680a7),
                                    ),
                            )),
                        hintText: 'Password',
                        hintStyle:
                            TextStyle(fontSize: 20.0, color: Color(0xff617282)),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: TextFormField(
                      validator: (val) => val!.length < 6
                          ? 'Enter a password six+ chars long'
                          : null,
                      onChanged: (val) {
                        setState(() => rePassword = val);
                      },
                      enableSuggestions: false,
                      autocorrect: false,
                      style: TextStyle(fontSize: 20, color: Color(0xff5680a7)),
                      obscureText: _obscureText,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blue, width: 2.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xff5680a7), width: 2.0),
                        ),
                        prefixIcon: const Icon(
                          Icons.lock_open,
                          color: Color(0xff5680a7),
                        ),
                        hintText: 'Re enter password',
                        hintStyle:
                            TextStyle(fontSize: 20.0, color: Color(0xff617282)),
                      ),
                    ),
                  ),
                  Text(error,
                      style: TextStyle(
                          color: Colors.redAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 14)),
                ],
              ),
            )),
            ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    if (password == rePassword) {
                      dynamic result = await _auth.registerWithEmailAndPassword(
                          email, password, widget.userInformation);
                      if (result == null) {
                        setState(() => error =
                            'Something went wrong... Please try again!');
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeWrappePage()),
                        );
                      }
                    } else {
                      setState(
                          () => error = 'password doesn\'t match.. try again');
                    }
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
