import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var questionIndex = 0;
  void answerQuestion() {
    setState(() {
      questionIndex += 1;
    });
    print('Answer chosen!');
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      {
        'questionText': 'what\'s your favorite color?',
        'answerText': ['Black', 'Green', 'blue', 'white']
      },
      {
        'questionText': 'what\' s your favorite animal?',
        'answerText': ['Dog', 'snake', 'cat', 'lion']
      },
      {
        'questionText': 'what\'s your favorite country?',
        'answerText': ['Algeria', 'England', 'Germany', 'USA']
      },
      {
        'questionText': 'what\' s your religion?',
        'answerText': ['Islam', 'Christianity', 'buddhism', 'Atheism']
      },
      {
        'questionText': 'what\' s your favorite dish',
        'answerText': ['Pasta', 'Fast food', 'Kouskous', 'Rechta']
      }
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quizzy'),
        ),
        body: Column(
          children: [
            Question(questions[questionIndex]['questionText'] as String),
            Answer(answerQuestion),
            Answer(answerQuestion),
            Answer(answerQuestion),
          ],
        ),
      ),
    );
  }
}
// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(primarySwatch: Colors.green),
//       home: MyHomePage(title: 'Quizzy'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Invoke "debug painting" (press "p" in the console, choose the
//           // "Toggle Debug Paint" action from the Flutter Inspector in Android
//           // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//           // to see the wireframe for each widget.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'Push that button',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
