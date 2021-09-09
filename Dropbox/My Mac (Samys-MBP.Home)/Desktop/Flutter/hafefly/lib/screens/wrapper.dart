import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'authentication/authenticate.dart';
import '../models/user.dart';
import 'home/homeWrappe.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Userr?>(context);
    if (user?.uid == null) {
      return Authenticate();
    } else {
      print(user?.uid);
      return HomeWrappePage();
    }
  }
}
