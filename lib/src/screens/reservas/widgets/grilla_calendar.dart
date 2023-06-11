import 'package:flutter/material.dart';

class GrillaCalendar extends StatelessWidget {
  final double heightGrilla;
  final double widthGrilla;
  const GrillaCalendar(
      {super.key, required this.heightGrilla, required this.widthGrilla});

  @override
  Widget build(BuildContext context) {
    List<int> columnas = List<int>.generate(8, (index) => index);
    Size size = MediaQuery.of(context).size;
    final colors = Theme.of(context).colorScheme;
    return Column(
      children: columnas.map((i) {
        List<int> filas = List<int>.generate(5, (index) => index);
        return Row(
          children: filas.map((i) {
            return Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: colors.primary,
                  width: .1,
                ),
              ),
              width: size.width * 0.85 / 5,
              height: heightGrilla,
            );
          }).toList(),
        );
      }).toList(),
    );
  }
}
