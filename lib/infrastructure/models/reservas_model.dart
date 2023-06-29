import 'package:cloud_firestore/cloud_firestore.dart';

class ReservaModel {
  String? idDoc;
  int bloque;
  bool confirmada;
  String dia;
  String entrada;
  String salida;
  String uid;
  String motivo;
  DateTime fecha;
  DateTime createdAt;

  ReservaModel({
    this.idDoc,
    required this.bloque,
    required this.confirmada,
    required this.dia,
    required this.entrada,
    required this.salida,
    required this.uid,
    required this.motivo,
    required this.fecha,
    required this.createdAt,
  });

  factory ReservaModel.fromFirestore(Map<String, dynamic> reserva) {
    return ReservaModel(
      idDoc: reserva['idDoc'],
      bloque: reserva['bloque'],
      confirmada: reserva['confirmada'],
      dia: reserva['dia'],
      entrada: reserva['entrada'],
      salida: reserva['salida'],
      uid: reserva['uid'],
      motivo: reserva['motivo'],
      fecha: (reserva['fecha'] as Timestamp).toDate(),
      createdAt: (reserva['createdAt'] as Timestamp).toDate(),
    );
  }

  void confirmarReserva() {
    if (!confirmada) {
      confirmada = true;
    }
  }
}

void eliminarReserva(String reservaId) async {
  try {
    await FirebaseFirestore.instance
        .collection(
            'reservas') // Reemplaza 'reservas' con el nombre de tu colección
        .doc(reservaId)
        .delete();
    print('Reserva eliminada exitosamente');
  } catch (error) {
    print('Error al eliminar la reserva: $error');
  }
}
