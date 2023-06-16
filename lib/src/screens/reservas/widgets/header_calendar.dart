import 'package:flutter/material.dart';
import 'package:gym_app/config/helpers/validators_date.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class HeaderCalendar extends StatefulWidget {
  const HeaderCalendar({super.key});

  @override
  State<HeaderCalendar> createState() => _HeaderCalendarState();
}

class _HeaderCalendarState extends State<HeaderCalendar> {
  @override
  Widget build(BuildContext context) {
    int validator = 2;
    Size size = MediaQuery.of(context).size;
    final colors = Theme.of(context).colorScheme;
    initializeDateFormatting('es', null);
    DateTime fechaActual = DateTime.now();
    String diaFix = DateFormat('dd', 'es').format(fechaActual);

    String tipoDate = 'mes';
    String? fechaMesActual = getDate(tipoDate);
    fechaMesActual =
        fechaMesActual![0].toUpperCase() + fechaMesActual.substring(1);

    List<dynamic> diasSemanas = getDateWeek(validator);
    print(diasSemanas);

    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              height: size.width * 0.10,
              width: size.width * 0.17,
            ),
            Container(
              height: size.width * 0.10,
              width: size.width * 0.80,
              decoration: BoxDecoration(
                color: colors.primary,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  fechaMesActual,
                  style: const TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
        Container(
          width: size.width,
          margin: EdgeInsets.only(left: size.width * 0.15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: diasSemanas.map((day) {
              if (day[0] == 'Sa' || day[0] == 'Do') {
                return Container();
              }
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
                          color:
                              day[1] == diaFix ? colors.primary : Colors.black,
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
        ),
      ],
    );
  }
}
