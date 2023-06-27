import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gym_app/config/helpers/validators_date.dart';
import 'package:gym_app/src/screens/reservas/widgets/dialog_reservation.dart';

class GrillaCalendar extends StatelessWidget {
  final double heightGrilla;
  final double widthGrilla;
  const GrillaCalendar({
    super.key,
    required this.heightGrilla,
    required this.widthGrilla,
  });

  @override
  Widget build(BuildContext context) {
    List<int> columnas = List<int>.generate(7, (index) => index);
    Size size = MediaQuery.of(context).size;
    final colors = Theme.of(context).colorScheme;
    // final textStyles = Theme.of(context).textTheme;
    List<String> accessReservation = getValidatorReservation();

    List<int> reserved = [4, 2];

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
                // print(j.toString() + " " + i.toString());
                if (reserved.isEmpty) {
                  if (accessReservation[1] == diaReserva) {
                    i = i + 1;
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return DialogReservation(
                            bloque: j, dia: i, acceso: 'Autorizado');
                      },
                      barrierDismissible: false,
                    );
                    i = i - 1;
                  } else {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return DialogReservation(
                            bloque: j, dia: i, acceso: 'Denegado');
                      },
                      barrierDismissible: false,
                    );
                  }
                } else {
                  if (accessReservation[1] == diaReserva) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return DialogReservation(
                            bloque: j, dia: i, acceso: 'Reservado');
                      },
                      barrierDismissible: false,
                    );
                  } else {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return DialogReservation(
                            bloque: j, dia: i, acceso: 'Denegado');
                      },
                      barrierDismissible: false,
                    );
                  }
                }
              },
              onLongPress: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return DialogReservation(
                        bloque: j, dia: i, acceso: 'Eliminando');
                  },
                  barrierDismissible: false,
                );
              },
              child: Container(
                width: size.width * 0.85 / 5,
                height: heightGrilla,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: colors.primary,
                    width: .3,
                  ),
                  color: accessReservation[1] != diaReserva
                      ? Colors.blueGrey.withOpacity(.2)
                      : Colors.transparent,
                ),
                child: accessReservation[1] != diaReserva
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          accessReservation[0] == diaReserva
                              ? Column(
                                  children: [
                                    FaIcon(
                                      FontAwesomeIcons.circleQuestion,
                                      color: colors.primary,
                                    ),
                                    Text(
                                      'consultar',
                                      style: TextStyle(
                                        fontSize: 11,
                                        color: colors.primary,
                                      ),
                                    ),
                                  ],
                                )
                              : Column(
                                  children: [
                                    Icon(Icons.lock_clock_outlined,
                                        color: colors.primary),
                                    Text(
                                      'Bloqueado',
                                      style: TextStyle(
                                        fontSize: 11,
                                        color: colors.primary,
                                      ),
                                    ),
                                  ],
                                ),
                        ],
                      )
                    : reserved.isEmpty
                        ? const SizedBox()
                        : reserved[0] == j && reserved[1] == i
                            ? const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FaIcon(
                                    FontAwesomeIcons.circleCheck,
                                    color: Colors.green,
                                  ),
                                  Text(
                                    'reservado',
                                    style: TextStyle(
                                      fontSize: 11,
                                      color: Colors.green,
                                    ),
                                  ),
                                ],
                              )
                            : reserved.isNotEmpty
                                ? const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      FaIcon(
                                        FontAwesomeIcons.slash,
                                        color: Colors.grey,
                                      ),
                                    ],
                                  )
                                : const SizedBox(),
              ),
            );
          }).toList(),
        );
      }).toList(),
    );
  }
}
