import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:gym_app/src/shared/data/semana_data.dart';
import 'package:intl/date_symbol_data_local.dart';

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

    List<dynamic>? getHour(int bloques) {
      List<dynamic>? entradaSalida = [];
      hours.map((hour) {
        if (hour['bloque'] == bloques + 1) {
          String entrada = hour['entrada'];
          String salida = hour['salida'];
          entradaSalida = [entrada, salida];
        }
      }).toList();
      return entradaSalida;
    }

    // obtener fecha actual
    String getDate() {
      initializeDateFormatting('es', null);
      DateTime fechaActual = DateTime.now();
      String fechaNumFormateada =
          DateFormat('dd MMMM yyyy', 'es').format(fechaActual);
      return fechaNumFormateada;
    }

    final colors = Theme.of(context).colorScheme;
    Size size = MediaQuery.of(context).size;
    final int bloqueFinal = bloque + 1;
    String diaReserva = processDay(dia);
    List<dynamic>? horarioBloque = getHour(bloque);
    String entradaBloque = '';
    String salidaBloque = '';
    if (horarioBloque != null && horarioBloque.isNotEmpty) {
      String entrada = horarioBloque[0];
      String salida = horarioBloque[1];
      entradaBloque = entrada;
      salidaBloque = salida;
    }
    String fechaActual = getDate();

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
              RichText(
                text: const TextSpan(
                  style: TextStyle(fontSize: 16, color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Estimad@ alumn@ ',
                    ),
                    TextSpan(
                      text: 'NOMBRE',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: ' ',
                    ),
                    TextSpan(
                      text: 'APELLIDO',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: ', ¿Se encuentra ',
                    ),
                    TextSpan(
                      text: 'SEGURO',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: ' que desea realizar esta ',
                    ),
                    TextSpan(
                      text: 'RESERVACION',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: '?',
                    ),
                  ],
                ),
                textAlign: TextAlign.justify,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  '1. BLOQUE N° $bloqueFinal',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  '2. Dia: $diaReserva 15 junio',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  '3. Hora Ingreso: $entradaBloque',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  '4. Hora Salida: $salidaBloque',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  '5. Fecha Actual: $fechaActual',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
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
