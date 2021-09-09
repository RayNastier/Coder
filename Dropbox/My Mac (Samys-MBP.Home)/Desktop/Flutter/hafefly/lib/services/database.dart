import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hafefly/models/babershopModel.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});

  // collection reference
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');
  final CollectionReference barbershopCollection =
      FirebaseFirestore.instance.collection('barbershops');

  Future getBarbershopData(
    String name,
    double rating,
    bool vip,
    String location,
    double latitude,
    double longitude,
    String open,
    String close,
  ) async {
    try {
      return await barbershopCollection.get();
    } catch (e) {
      print(e.toString());
    }
  }

  List<Barbershop> _barbershopListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Barbershop(
          name: doc.get('name'),
          rating: double.parse(doc.get('rating')),
          vip: bool.fromEnvironment(doc.get('vip')),
          location: doc.get('location'),
          latitude: double.parse(doc.get('latitude')),
          longitude: double.parse(doc.get('longitude')),
          open: doc.get('open'),
          close: doc.get('close'));
    }).toList();
  }

  Stream<List<Barbershop>> get barbershops {
    return barbershopCollection.snapshots().map(_barbershopListFromSnapshot);
  }

  Future updateUserData(String firstname, String lastname, int age,
      String province, String phoneNumber) async {
    return await userCollection.doc(uid).set({
      'firstname': firstname,
      'lastname': lastname,
      'age': age,
      'province': province,
      'phoneNumber': phoneNumber
    });
  }

  Future getUsersData() async {
    List itemsList = [];
    try {
      await userCollection.get().then((querySnapshot) {
        querySnapshot.docs.forEach((element) {
          itemsList.add(element.data);
        });
      });
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
