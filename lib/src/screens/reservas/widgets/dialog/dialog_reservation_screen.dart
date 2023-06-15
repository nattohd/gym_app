import 'package:flutter/material.dart';
import 'package:gym_app/config/helpers/validators_date.dart';

class DialogReservationScreen extends StatelessWidget {
  final int bloque, dia;
  final String acceso;

  const DialogReservationScreen(
      {super.key,
      required this.bloque,
      required this.dia,
      required this.acceso});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    Size size = MediaQuery.of(context).size;
    final int bloqueFinal = bloque + 1;
    String diaReserva = processDay(dia);
    String diaReservaTest = diaReserva;
    diaReservaTest = diaReservaTest.substring(0, 2);
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

    String fechaReserva = dateReservation(diaReservaTest);

    return acceso == 'Autorizado'
        ? AlertDialog(
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
                        '2. Dia: $diaReserva $fechaReserva',
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
                  String texto = 'La reserva se CANCELO con EXITO';
                  Color color = Colors.redAccent;
                  snackbar(context, texto, color);
                },
              ),
              SizedBox(
                height: size.width * 0.1,
                width: size.width * 0.30,
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    String texto = 'La reserva se realizo con EXITO';
                    Color color = Colors.green;
                    snackbar(context, texto, color);
                    //agregarReserva(2, 4, bloque, dia, 'Entrenar');
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
          )
        : AlertDialog(
            content: SingleChildScrollView(
              child: IntrinsicWidth(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: size.width * 0.45,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            offset: const Offset(1, 1),
                            blurRadius: 8,
                            spreadRadius: 10,
                          ),
                        ],
                      ),
                      child: Stack(
                        children: [
                          Center(
                            child: Image.asset(
                              'assets/images/denied.png',
                              height: size.width * 0.25,
                              width: size.width * 0.25,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.width * 0.36,
                      width: double.infinity,
                      child: const Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Center(
                              child: Text(
                                'Reserva Denegada',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Center(
                              child: Text(
                                'Recuerda que solicitar una reserva se debe realizar con un dia de anticipacion',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
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
            ],
          );
  }
}
