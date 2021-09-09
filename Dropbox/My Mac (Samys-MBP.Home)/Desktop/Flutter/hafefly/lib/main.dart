import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import './screens/wrapper.dart';
import './services/auth.dart';
import './models/user.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Userr?>.value(
      value: AuthService().user,
      initialData: Userr(uid: null),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
    ));
  }
}

