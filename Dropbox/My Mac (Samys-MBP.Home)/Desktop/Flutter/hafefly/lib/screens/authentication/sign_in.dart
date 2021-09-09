import 'package:flutter/material.dart';
import 'package:hafefly/screens/authentication/sign_up.dart';
import 'package:hafefly/services/auth.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final AuthService _auth = AuthService();
  bool _obscureText = true;
  String email = '';
  String password = '';
  final _formKey = GlobalKey<FormState>();
  String error = '';

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
      imageSize = 260;
    } else {
      imageSize = 350;
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
              margin: EdgeInsets.only(top: 50),
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
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: TextFormField(
                      validator: (val) =>
                          val!.isEmpty ? 'Enter a valid email' : null,
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
                      validator: (val) =>
                          val!.length < 6 ? 'Enter a valid password' : null,
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
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Forgot Password',
                            style: TextStyle(
                                color: Color(0xffa9b3c6),
                                fontFamily: 'SF Pro Display',
                                fontWeight: FontWeight.w600,
                                decoration: TextDecoration.underline,
                                fontSize: 18),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUpPage()),
                            );
                          },
                          child: Text(
                            'SignUp',
                            style: TextStyle(
                                color: Color(0xffa9b3c6),
                                fontFamily: 'SF Pro Display',
                                fontWeight: FontWeight.w600,
                                decoration: TextDecoration.underline,
                                fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(error,
                      style: TextStyle(
                          color: Colors.redAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 14))
                ],
              ),
            )),
            ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    dynamic result =
                        await _auth.signInWithEmailAndPassword(email, password);
                    if (result == null) {
                      setState(() =>
                          error = 'Something went wrong... Please try again!');
                    }
                  }
                },
                child: Text(
                  'Sign In',
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
