import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gym_app/infrastructure/models/reservas_model.dart';
import 'package:gym_app/main.dart';
import 'dart:async';

class ReservaRepository {
  final FirebaseFirestore fireStore =
      FirebaseFirestore.instanceFor(app: firebaseService.firebaseApp);

  Future<List<ReservaModel>> getListOfReservas(String uid) async {
    CollectionReference reservas = fireStore.collection('reservas');

    return reservas.where('uid', isEqualTo: uid).get().then(
        (QuerySnapshot querySnapshot) {
      return querySnapshot.docs.map((doc) {
        final data = doc.data();
        if (data != null) {
          return ReservaModel.fromFirestore(data as Map<String, dynamic>)
            ..idDoc = doc.id;
        } else {
          throw Exception('No data found for document with ID: ${doc.id}');
        }
      }).toList();
    }).catchError(
        (error) => throw Exception('Error al obtener las reservas: $error'));
  }

  Stream<ReservaModel> setConfirmarReserva(ReservaModel reservaModel) {
    CollectionReference reservas = fireStore.collection('reservas');

    final controller = StreamController<ReservaModel>();

    reservas.doc(reservaModel.idDoc).update({
      'confirmada': true,
    }).then((value) {
      print('Reserva confirmada');
      reservaModel.confirmarReserva();
      controller.sink.add(reservaModel);
      controller.close();
    }).catchError((error) {
      controller.addError(Exception('Error al confirmar la reserva: $error'));
      controller.close();
    });

    // Devolvemos el stream
    return controller.stream;
  }

  // Future<ReservaModel> setConfirmarReserva(ReservaModel reservaModel) async {
  //   CollectionReference reservas = fireStore.collection('reservas');

  //   return reservas.doc(reservaModel.idDoc).update({
  //     'confirmada': true,
  //   }).then((value) {
  //     print('Reserva confirmada');
  //     reservaModel.confirmarReserva();
  //     return reservaModel;
  //   }).catchError(
  //       (error) => throw Exception('Error al confirmar la reserva: $error'));
  // }

  Future<ReservaModel> creteNewReserva(ReservaModel newReserva) async {
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
    }).then((DocumentReference document) {
      return ReservaModel(
        idDoc: document.id,
        bloque: newReserva.bloque,
        confirmada: newReserva.confirmada,
        dia: newReserva.dia,
        entrada: newReserva.entrada,
        salida: newReserva.salida,
        uid: newReserva.uid,
        motivo: newReserva.motivo,
        fecha: newReserva.fecha,
      );
    }).catchError(
        (error) => throw Exception('Error al crear la reserva: $error'));
  }
}
