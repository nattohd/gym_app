import 'package:flutter/material.dart';
import 'package:gym_app/src/screens/reservas/widgets/dialog/dialog_reservation_screen.dart';

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

    return Column(
      children: columnas.map((j) {
        List<int> filas = List<int>.generate(5, (index) => index);
        return Row(
          children: filas.map((i) {
            return InkWell(
              splashColor: colors.primary.withOpacity(.1),
              hoverColor: colors.primary.withOpacity(.1),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return DialogReservationScreen(bloque: j, dia: i);
                  },
                );
              },
              child: Container(
                width: size.width * 0.85 / 5,
                height: heightGrilla,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: colors.primary,
                    width: .1,
                  ),
                  // image: const DecorationImage(
                  //   image: AssetImage('assets/images/check.png'),
                  //   fit: BoxFit.cover,
                  // ),
                ),
              ),
            );
          }).toList(),
        );
      }).toList(),
    );
  }
}
