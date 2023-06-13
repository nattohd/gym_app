List<Map<String, dynamic>> hours = [
  {'entrada': '09:35 AM', 'salida': '10:45 AM', 'bloque': 1},
  {'entrada': '10:55 AM', 'salida': '12:05 AM', 'bloque': 2},
  {'entrada': '12:15 AM', 'salida': '01:25 PM', 'bloque': 3},
  {'entrada': '02:30 PM', 'salida': '03:40 PM', 'bloque': 4},
  {'entrada': '03:50 PM', 'salida': '05:00 PM', 'bloque': 5},
  {'entrada': '05:10 PM', 'salida': '06:20 PM', 'bloque': 6},
  {'entrada': '06:30 PM', 'salida': '07:40 PM', 'bloque': 7},
];

List<Map<String, dynamic>> days = [
  {
    'abreviation': 'Lu',
    'numDay': 5,
    'currentDay': false,
    'outRange': true,
  },
  {
    'abreviation': 'Ma',
    'numDay': 6,
    'currentDay': false,
    'outRange': true,
  },
  {
    'abreviation': 'Mi',
    'numDay': 7,
    'currentDay': false,
    'outRange': true,
  },
  {
    'abreviation': 'Ju',
    'numDay': 8,
    'currentDay': true,
    'outRange': false,
  },
  {
    'abreviation': 'Vi',
    'numDay': 9,
    'currentDay': false,
    'outRange': false,
  },
];

List<Map<String, dynamic>> reservation = [
  {
    'bloque': '1',
    'horaEntrada': '09:35 AM',
    'horaSalida': '10:45 AM',
    'fechaReserva': '05/05',
    'fechaActual': '12/06/2023'
  },
];
