import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hafefly/services/auth.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double containerHeight;
    if (width < 400) {
      containerHeight = height / 3;
    } else {
      containerHeight = height / 2.1;
    }
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xff191b2c), Color(0xff191c31), Color(0xff192270)],
        ),
      ),
      child: Container(
        margin: EdgeInsets.fromLTRB(20, 20, 20, containerHeight),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color(0xff394180),
        ),
        child: Stack(
          children: [
            Column(
              //TODO: add firestore data for user information
              children: [
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 15),
                      decoration: BoxDecoration(
                        border: Border.all(width: 2.0, color: Colors.white),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Image.asset(
                        "assets/avatar.png",
                        width: 80,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 8),
                      child: Text(
                        'User name',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(
                    children: [
                      Icon(Icons.phone, color: Colors.white),
                      Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Text(
                            "Phone number",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.white),
                          ))
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(
                    children: [
                      SvgPicture.asset("assets/instagram.svg"),
                      Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Text(
                            "Instagram",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.white),
                          ))
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(
                    children: [
                      Icon(Icons.beenhere_rounded, color: Colors.white),
                      Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Text(
                            "Haircuts done",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.white),
                          ))
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                        margin: EdgeInsets.only(right: 15, top: 10),
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                            color: Colors.black26,
                            borderRadius: BorderRadius.circular(22)),
                        child: IconButton(
                          iconSize: 18,
                          color: Colors.white,
                          icon: Icon(Icons.border_color_rounded),
                          onPressed: () {},
                        )),
                    Container(
                      margin: EdgeInsets.only(right: 15, bottom: 10),
                      child: TextButton.icon(
                        style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all(Colors.white),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red[600]),
                        ),
                        icon: Icon(Icons.logout_rounded),
                        label: Text('logout'),
                        onPressed: () async {
                          await _auth.signout();
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
