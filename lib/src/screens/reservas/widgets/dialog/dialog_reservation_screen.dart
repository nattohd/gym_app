import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DialogReservationScreen extends StatelessWidget {
  const DialogReservationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    Size size = MediaQuery.of(context).size;

    return AlertDialog(
      title: const Text(
        'Realizar Reserva',
        style: TextStyle(fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
      content: const Text(
        'Estimado alumno NOMBRE APELLIDO, ¿Se encuentra SEGURO que desea RESERVAR el BLOQUE N°?',
        style: TextStyle(fontSize: 16),
        textAlign: TextAlign.justify,
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
