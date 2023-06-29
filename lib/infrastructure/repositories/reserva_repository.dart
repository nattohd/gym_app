import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gym_app/infrastructure/models/reservas_model.dart';
import 'package:gym_app/main.dart';
import 'dart:async';

class ReservaRepository {
  final FirebaseFirestore fireStore =
      FirebaseFirestore.instanceFor(app: firebaseService.firebaseApp);

  Stream<List<ReservaModel>> getListOfReservas(String uid) {
    CollectionReference reservas = fireStore.collection('reservas');

    return reservas.where('uid', isEqualTo: uid).snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        final data = doc.data();
        if (data != null) {
          return ReservaModel.fromFirestore(data as Map<String, dynamic>)
            ..idDoc = doc.id;
        } else {
          throw Exception('No data found for document with ID: ${doc.id}');
        }
      }).toList();
    });
  }

  // Future<List<ReservaModel>> getListOfReservas(String uid) async {
  //   CollectionReference reservas = fireStore.collection('reservas');

  //   return reservas.where('uid', isEqualTo: uid).get().then(
  //       (QuerySnapshot querySnapshot) {
  //     return querySnapshot.docs.map((doc) {
  //       final data = doc.data();
  //       if (data != null) {
  //         return ReservaModel.fromFirestore(data as Map<String, dynamic>)
  //           ..idDoc = doc.id;
  //       } else {
  //         throw Exception('No data found for document with ID: ${doc.id}');
  //       }
  //     }).toList();
  //   }).catchError(
  //       (error) => throw Exception('Error al obtener las reservas: $error'));
  // }

  Future<ReservaModel> setConfirmarReserva(String idDoc) async {
    CollectionReference reservas = fireStore.collection('reservas');

    return reservas.doc(idDoc).update({
      'confirmada': true,
    }).then((value) async {
      final doc = await reservas.doc(idDoc).get();
      final data = doc.data();
      if (data != null) {
        return ReservaModel.fromFirestore(data as Map<String, dynamic>)
          ..idDoc = doc.id;
      } else {
        throw Exception('No data found for document with ID: $idDoc');
      }
    }).catchError(
        (error) => throw Exception('Error al confirmar la reserva: $error'));
  }

  Future<String> creteNewReserva(ReservaModel newReserva) async {
    CollectionReference reservas = fireStore.collection('reservas');

    return reservas.add({
      'bloque': newReserva.bloque,
      'confirmada': newReserva.confirmada,
      'dia': newReserva.dia,
      'entrada': newReserva.entrada,
      'salida': newReserva.salida,
      'uid': newReserva.uid,
      'motivo': newReserva.motivo,
      'fecha': newReserva.fecha,
      'createdAt': newReserva.createdAt,
    }).then((DocumentReference document) {
      return 'Reserva Creada correctamente';
    }).catchError((error) => 'Error al crear la reserva: $error');
  }
}
