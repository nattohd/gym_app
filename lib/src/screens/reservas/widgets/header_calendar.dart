import 'package:flutter/material.dart';
import 'package:gym_app/config/helpers/validators_date.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class HeaderCalendar extends StatelessWidget {
  const HeaderCalendar({super.key});

  @override
  Widget build(BuildContext context) {
    int validator = 2;
    Size size = MediaQuery.of(context).size;
    final colors = Theme.of(context).colorScheme;
    initializeDateFormatting('es', null);
    DateTime fechaActual = DateTime.now();
    String diaFix = DateFormat('dd', 'es').format(fechaActual);

    List<dynamic> diasSemanas = getDateWeek(validator);

    return Container(
      width: size.width,
      margin: EdgeInsets.only(left: size.width * 0.15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: diasSemanas.sublist(0, 5).map((day) {
          return Container(
            height: size.width * 0.245,
            width: size.width * 0.85 / 5,
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Text(
                  day[0],
                  style: TextStyle(
                      fontSize: 15,
                      color: day[1] == diaFix ? colors.primary : Colors.black,
                      fontWeight: day[1] == diaFix
                          ? FontWeight.bold
                          : FontWeight.normal),
                ),
                const SizedBox(
                  height: 3,
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: size.width * 0.092,
                      height: size.width * 0.092,
                      decoration: day[1] == diaFix
                          ? BoxDecoration(
                              color: colors.primary,
                              borderRadius: BorderRadius.circular(50))
                          : null,
                    ),
                    Text(
                      day[1],
                      style: TextStyle(
                          fontSize: 20,
                          color: day[1] == diaFix
                              ? Colors.white
                              : const Color(0xff1a1c1e)),
                    ),
                  ],
                ),
                // Convertir a String usando toString()
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
