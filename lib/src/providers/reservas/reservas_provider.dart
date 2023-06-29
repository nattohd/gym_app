import 'dart:async';
import 'dart:ffi';

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
  List<int> diasSemana = [];
  late int diaActual;
  final ReservaRepository reservaRepository = ReservaRepository();

  void calcDiasSemana() {
    DateTime ahora = DateTime.now();
    DateTime primerDiaDeLaSemana =
        ahora.subtract(Duration(days: (ahora.weekday - 1)));
    diasSemana.clear();
    for (int i = 0; i < 7; i++) {
      diasSemana.add(primerDiaDeLaSemana.add(Duration(days: i)).day);
    }
    notifyListeners();
    getDiaActual();
  }

  void getDiaActual() {
    DateTime ahora = DateTime.now();
    diaActual = ahora.day;
    notifyListeners();
  }

  Stream<List<ReservaModel>> getListOfReservas(String uid) {
    return reservaRepository.getListOfReservas(uid);
  }

  // Future<void> getListOfReservas(String uid) async {
  //   // uiStatus = UiStatus.loading;
  //   // notifyListeners();
  //   final response = await reservaRepository.getListOfReservas(uid);
  //   reservas.clear();
  //   reservas.addAll(response);
  //   notifyListeners();
  // }

  Future<ReservaModel> setConfirmarReservar(String idDoc) async {
    final response = await reservaRepository.setConfirmarReserva(idDoc);
    print(response);
    notifyListeners();
    return response;
  }

  Future<void> createNewReserva(ReservaModel newReserva) async {
    final response = await reservaRepository.creteNewReserva(newReserva);
    print(response);
    notifyListeners();
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
