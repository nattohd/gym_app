import 'package:flutter/material.dart';
import 'package:gym_app/config/helpers/validators_date.dart';
import 'package:gym_app/src/screens/reservas/widgets/dialog/dialog_reservation_screen.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class GrillaCalendar extends StatelessWidget {
  final double heightGrilla;
  final double widthGrilla;
  const GrillaCalendar(
      {super.key, required this.heightGrilla, required this.widthGrilla});

  @override
  Widget build(BuildContext context) {
    List<int> columnas = List<int>.generate(7, (index) => index);
    Size size = MediaQuery.of(context).size;
    final colors = Theme.of(context).colorScheme;
    initializeDateFormatting('es', null);
    DateTime fechaActual = DateTime.now();
    String diaFix = DateFormat('EEEE', 'es').format(fechaActual);
    diaFix = diaFix[0].toUpperCase() + diaFix.substring(1);

    return Column(
      children: columnas.map((j) {
        List<int> filas = List<int>.generate(5, (index) => index);
        return Row(
          children: filas.map((i) {
            return InkWell(
              splashColor: colors.primary.withOpacity(.1),
              hoverColor: colors.primary.withOpacity(.1),
              onTap: () {
                String diaReserva = processDay(i);
                String accessReservation = getValidatorReservation();

                if (accessReservation == diaReserva) {
                  i = i + 1;
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return DialogReservationScreen(
                          bloque: j, dia: i - 1, acceso: 'Autorizado');
                    },
                    barrierDismissible: false,
                  );
                  i = i - 1;
                } else {
                  i = i + 1;
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return DialogReservationScreen(
                          bloque: j, dia: i - 1, acceso: 'Denegado');
                    },
                    barrierDismissible: false,
                  );
                  i = i - 1;
                }
              },
              child: Container(
                width: size.width * 0.85 / 5,
                height: heightGrilla,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: colors.primary,
                    width: .1,
                  ),
                ),
              ),
            );
          }).toList(),
        );
      }).toList(),
    );
  }
}
