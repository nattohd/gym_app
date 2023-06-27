import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gym_app/infrastructure/models/reservas_model.dart';
import 'package:gym_app/infrastructure/repositories/reserva_repository.dart';
import 'package:flutter/foundation.dart';

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

class ReservaProvider extends ChangeNotifier {
  List<ReservaModel> reservas = [];
  final ReservaRepository reservaRepository = ReservaRepository();

  Future<void> getListOfReservas(String uid) async {
    // uiStatus = UiStatus.loading;
    // notifyListeners();
    final response = await reservaRepository.getListOfReservas(uid);
    reservas.addAll(response);
    notifyListeners();
  }

  Future<void> setConfirmarReservar(String idDoc) async {
    final index = reservas.indexWhere((reserva) => reserva.idDoc == idDoc);
    if (index != -1) {
      final subscription = reservaRepository
          .setConfirmarReserva(reservas[index])
          .listen((updatedReserva) {
        // Actualizamos la reserva en la lista
        reservas[index] = updatedReserva;
        notifyListeners();
      }, onError: (error) {
        throw Exception('No se encontró ninguna reserva con idDoc: $idDoc');
      });

      // Don't forget to cancel the subscription when the provider is disposed
      // subscription.cancel();
    } else {
      throw Exception('No se encontró ninguna reserva con idDoc: $idDoc');
    }
  }
  // Future<void> setConfirmarReservar(String idDoc) async {
  //   final index = reservas.indexWhere((reserva) => reserva.idDoc == idDoc);
  //   if (index != -1) {
  //     final response =
  //         await reservaRepository.setConfirmarReserva(reservas[index]);
  //     reservas[index] = response;
  //   } else {
  //     throw Exception('No se encontró ninguna reserva con idDoc: $idDoc');
  //   }
  //   notifyListeners();
  // }
}
