import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback selectHandler;

  Answer(this.selectHandler);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: double.infinity,
      child: RaisedButton(
        textColor: Colors.white,
        color: Colors.blue,
        child: Text('answer 1'),
        onPressed: selectHandler,
      ),
    );
  }
}
