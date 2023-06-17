import 'package:flutter/material.dart';
import 'package:gym_app/config/helpers/validators_date.dart';
import 'package:gym_app/src/screens/reservas/widgets/dialog_reservation_screen.dart';

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
    List<String> accessReservation = getValidatorReservation();

    return Column(
      children: columnas.map((j) {
        List<int> filas = List<int>.generate(5, (index) => index);
        return Row(
          children: filas.map((i) {
            String diaReserva = processDay(i);
            diaReserva = deletAccent(diaReserva);
            return InkWell(
              splashColor: colors.primary.withOpacity(.1),
              hoverColor: colors.primary.withOpacity(.1),
              onTap: () {
                if (accessReservation[1] == diaReserva) {
                  i = i + 1;
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return DialogReservationScreen(
                          bloque: j, dia: i, acceso: 'Autorizado');
                    },
                    barrierDismissible: false,
                  );
                  i = i - 1;
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return DialogReservationScreen(
                          bloque: j, dia: i, acceso: 'Denegado');
                    },
                    barrierDismissible: false,
                  );
                }
              },
              child: Container(
                width: size.width * 0.85 / 5,
                height: heightGrilla,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: .3,
                  ),
                  color: accessReservation[1] != diaReserva
                      ? Colors.grey
                      : Colors.white,
                ),
              ),
            );
          }).toList(),
        );
      }).toList(),
    );
  }
}
