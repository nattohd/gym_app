List<Map<String, dynamic>> hours = [
  {
    'entrada': '09:35 AM',
    'salida': '10:45 AM',
    'bloque': 1,
  },
  {
    'entrada': '10:55 AM',
    'salida': '12:05 AM',
    'bloque': 2,
  },
  {
    'entrada': '12:15 AM',
    'salida': '01:25 PM',
    'bloque': 3,
  },
  {
    'entrada': '02:30 PM',
    'salida': '03:40 PM',
    'bloque': 4,
  },
  {
    'entrada': '03:50 PM',
    'salida': '05:00 PM',
    'bloque': 5,
  },
  {
    'entrada': '05:10 PM',
    'salida': '06:20 PM',
    'bloque': 6,
  },
  {
    'entrada': '06:30 PM',
    'salida': '07:40 PM',
    'bloque': 7,
  },
];

List<Map<String, dynamic>> reservation = [
  {
    'id': 1,
    'user_id': 3,
    'bloque': 3,
    'dia': 2,
    'proposito': 'Entrenar',
  },
];

List<Map<String, dynamic>> validatorReservation = [
  {
    'diaActual': 'Domingo',
    'diaReserva': 'Lunes',
  },
  {
    'diaActual': 'Lunes',
    'diaReserva': 'Martes',
  },
  {
    'diaActual': 'Martes',
    'diaReserva': 'Miercoles',
  },
  {
    'diaActual': 'Miercoles',
    'diaReserva': 'Jueves',
  },
  {
    'diaActual': 'Jueves',
    'diaReserva': 'Viernes',
  },
  {
    'diaActual': 'Viernes',
    'diaReserva': 'Sabado',
  },
  {
    'diaActual': 'Sabado',
    'diaReserva': 'Domingo',
  },
];
