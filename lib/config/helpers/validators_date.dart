import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:gym_app/src/shared/data/semana_data.dart';

List<dynamic> getDateWeek(int validator) {
  initializeDateFormatting('es', null);
  DateTime fechaActual = DateTime.now();
  String fechaDiaFormateada = DateFormat('EEEE', 'es').format(fechaActual);
  fechaDiaFormateada =
      fechaDiaFormateada[0].toUpperCase() + fechaDiaFormateada.substring(1);
  int diaFix = int.parse(DateFormat('dd', 'es').format(fechaActual));
  String fechaMesFormateado = DateFormat('MMMM', 'es').format(fechaActual);

  List<dynamic> formatoSuma = [];

  switch (fechaDiaFormateada) {
    case 'Lunes':
      formatoSuma = [0, 1, 2, 3, 4, 5, 6];
      break;
    case 'Martes':
      formatoSuma = [-1, 0, 1, 2, 3, 4, 5];
      break;
    case 'Miércoles':
      formatoSuma = [-2, -1, 0, 1, 2, 3, 4];
      break;
    case 'Jueves':
      formatoSuma = [-3, -2, -1, 0, 1, 2, 3];
      break;
    case 'Viernes':
      formatoSuma = [-4, -3, -2, -1, 0, 1, 2];
      break;
    case 'Sabado':
      formatoSuma = [-5, -4, -3, -2, -1, 0, 1];
      break;
    case 'Domingo':
      formatoSuma = [1, 2, 3, 4, 5, 6, 0];
      break;
  }

  List<dynamic> diaSemana = [
    ['Lu'],
    ['Ma'],
    ['Mi'],
    ['Ju'],
    ['Vi'],
    ['Sa'],
    ['Do']
  ];

  for (int i = 0; i < diaSemana.length; i++) {
    diaSemana[i].add((formatoSuma[i] + diaFix).toString());
  }

  if (validator == 1) {
    for (int i = 0; i < diaSemana.length; i++) {
      diaSemana[i][1] = "${diaSemana[i][1]} $fechaMesFormateado";
    }
  }

  return diaSemana;
}

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

String getDate() {
  initializeDateFormatting('es', null);
  DateTime fechaActual = DateTime.now();
  String fechaNumFormateada =
      DateFormat('dd MMMM yyyy', 'es').format(fechaActual);
  return fechaNumFormateada;
}

String dateReservation(String diaReservaTest) {
  int validator = 1;
  List<dynamic> diasSemanas = getDateWeek(validator);
  String fechaReserva = '';
  for (int i = 0; i < diasSemanas.length; i++) {
    if (diasSemanas[i][0] == diaReservaTest) {
      fechaReserva = diasSemanas[i][1];
      break;
    }
  }
  return fechaReserva;
}

void snackbar(BuildContext context, String texto, Color color) {
  final snackBar = SnackBar(
    content: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const FaIcon(
          FontAwesomeIcons.check,
          color: Colors.white,
        ),
        KeyedSubtree(
          key: UniqueKey(),
          child: Text(
            texto,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const Text(''),
      ],
    ),
    duration: const Duration(seconds: 2),
    backgroundColor: color,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
