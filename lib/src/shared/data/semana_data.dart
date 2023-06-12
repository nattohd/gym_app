List<Map<String, dynamic>> hours = [
  {'hour': '9:35 AM'},
  {'hour': '10:55 AM'},
  {'hour': '12:15 AM'},
  {'hour': '2:30 PM'},
  {'hour': '3:50 PM'},
  {'hour': '5:10 PM'},
  {'hour': '17:10 PM'},
  {'hour': '18:30 PM'},
];

//   {'entrada': '09:35 AM', 'salida': '10:45 AM', 'bloque': '1'},
//   {'entrada': '10:55 AM', 'salida': '12:05 AM', 'bloque': '2'},
//   {'entrada': '12:15 AM', 'salida': '13:25 PM', 'bloque': '3'},
//   {'entrada': '14:30 PM', 'salida': '15:40 PM', 'bloque': '4'},
//   {'entrada': '15:50 PM', 'salida': '17:00 PM', 'bloque': '5'},
//   {'entrada': '17:10 PM', 'salida': '18:20 PM', 'bloque': '6'},
//   {'entrada': '18:30 PM', 'salida': '19:40 PM', 'bloque': '7'},

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
