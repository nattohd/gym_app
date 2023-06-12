import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class DialogReservationScreen extends StatelessWidget {
  final int bloque, dia;

  const DialogReservationScreen(
      {super.key, required this.bloque, required this.dia});

  @override
  Widget build(BuildContext context) {
    String processDay(int dia) {
      String diaFinal = '';

      switch (dia) {
        case 0:
          diaFinal = 'Lunes';
          break;
        case 1:
          diaFinal = 'Martes';
          break;
        case 2:
          diaFinal = 'Miercoles';
          break;
        case 3:
          diaFinal = 'Jueves';
          break;
        case 4:
          diaFinal = 'Viernes';
          break;
      }
      return diaFinal;
    }

    final colors = Theme.of(context).colorScheme;
    Size size = MediaQuery.of(context).size;
    final int bloqueFinal = bloque + 1;
    String diaReserva = processDay(dia);
    DateTime fechaActual = DateTime.now();
    String fechaFormateada = DateFormat('dd/MM/yyyy').format(fechaActual);

    return AlertDialog(
      title: const Text(
        'Realizar Reserva',
        style: TextStyle(fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
      content: SingleChildScrollView(
        child: IntrinsicWidth(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Estimad@ alumn@ NOMBRE APELLIDO, ¿Se encuentra SEGURO que desea realizar esta RESERVA ?',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.justify,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  '1. BLOQUE N° $bloqueFinal',
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  '2. Dia: $diaReserva 11/11',
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  '3. Hora Ingreso: ${fechaFormateada.toString()} AM',
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  '4. Hora Salida: ${fechaFormateada.toString()} AM',
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  '5. Fecha Actual: ${fechaFormateada.toString()}',
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          child: const Text('Cerrar'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        SizedBox(
          height: size.width * 0.1,
          width: size.width * 0.30,
          child: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).pop();
              const snackBar = SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FaIcon(
                      FontAwesomeIcons.check,
                      color: Colors.white,
                    ),
                    Text(
                      'La reserva se realizo con EXITO',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(''),
                  ],
                ),
                duration: Duration(seconds: 3),
                backgroundColor: Colors.green,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
            backgroundColor: colors.primary,
            child: const Text(
              'Confirmar',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
        )
      ],
    );
  }
}
