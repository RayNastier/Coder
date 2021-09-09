import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hafefly/models/babershopModel.dart';
import 'package:hafefly/screens/widgets/barbershopCard.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late TextEditingController _textController;
  ScrollController controller = ScrollController();

  Barbershop barbershop = Barbershop(name: 'name', rating: 4.5, vip: true, location: 'location', latitude: 3.5, longitude: 3.5, open: 'open', close: 'close');
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xff191b2c), Color(0xff191c31), Color(0xff192270)],
        ),
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            padding: EdgeInsets.fromLTRB(10, 0, 20, 0),
            decoration: BoxDecoration(
                color: Color(0xff394180),
                borderRadius: BorderRadius.circular(20)),
            child: TextFormField(
              // TODO: fetch data by search
              decoration: InputDecoration(
                  hintText: 'search',
                  hintStyle: TextStyle(color: Colors.white),
                  border: InputBorder.none,
                  icon: SvgPicture.asset("assets/svg/Search.svg")),
              controller: _textController,
              onChanged: (String value) {
                print('The text has changed to: $value');
              },
            ),
          ),
          Expanded(
              child: ListView.builder(
                  controller: controller,
                  itemCount: barbershops.length,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Align(
                        heightFactor: 1,
                        alignment: Alignment.topCenter,
                        child: BarbershopCard(barbershop: barbershop));
                  })),
        ],
      ),
    );
  }
}
