import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hafefly/models/babershopModel.dart';
import '../../widgets/categories_scroller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CategoriesScroller categoriesScroller = CategoriesScroller();
  ScrollController controller = ScrollController();
  bool closeTopContainer = false;
  double topContainer = 0;
  Barbershop barbershop = Barbershop(
      name: 'Venom',
      rating: 4.5,
      vip: true,
      location: 'birkhadem',
      latitude: 31.1732,
      longitude: 31.3713,
      open: '08:30',
      close: '18:30');

  List<Widget> itemsData = [];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double categoryHeight = size.height * 0.30;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xff191b2c), Color(0xff191c31), Color(0xff192270)],
        ),
      ),
      child: Column(children: <Widget>[
        AnimatedOpacity(
          duration: const Duration(milliseconds: 500),
          opacity: closeTopContainer ? 0 : 1,
          child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: size.width,
              alignment: Alignment.topCenter,
              height: closeTopContainer ? 0 : categoryHeight,
              child: categoriesScroller),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10, left: 30),
          child: Row(
            children: [
              Icon(Icons.local_activity_rounded, color: Colors.white),
              Padding(
                padding: const EdgeInsets.only(left: 7),
                child: Text('ViP Barbershops',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
              )
            ],
          ),
        ),
        Expanded(
            child: ListView.builder(
                controller: controller,
                itemCount: itemsData.length,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Align(
                      heightFactor: 1,
                      alignment: Alignment.topCenter,
                      child: itemsData[index]);
                })),
      ]),
    );
  }
}
