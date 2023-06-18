import 'package:cloud_firestore/cloud_firestore.dart';

import '../../services/firestore_service.dart';

FireStoreService fireStoreService = FireStoreService();

Future<dynamic> getCosas(String docID, String coleccion) async {
  print("doc: " + docID);
  print("coleccion: " + coleccion);

  CollectionReference col = FirebaseFirestore.instance.collection(coleccion);

  print('coleccionnnnnnn:  $col');

  DocumentSnapshot snapshot = await col.doc(docID).get();
  print(snapshot);

  var data = snapshot.data() as Map;
  print('Data es: $data');
  return data;
}
