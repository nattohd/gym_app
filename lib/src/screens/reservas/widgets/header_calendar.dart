import 'package:flutter/material.dart';
import 'package:gym_app/src/shared/data/semana_data.dart';

class HeaderCalendar extends StatelessWidget {
  const HeaderCalendar({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final colors = Theme.of(context).colorScheme;
    return Container(
      width: size.width,
      margin: EdgeInsets.only(left: size.width * 0.15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: days.map((day) {
          return Container(
            height: size.width * 0.245,
            width: size.width * 0.85 / 5,
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Text(
                  day['abreviation'].toString(),
                  style: TextStyle(
                      color: day['currentDay'] ? colors.primary : Colors.black,
                      fontWeight: day['currentDay']
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
                      width: size.width * 0.08,
                      height: size.width * 0.08,
                      decoration: day['currentDay']
                          ? BoxDecoration(
                              color: colors.primary,
                              borderRadius: BorderRadius.circular(50))
                          : null,
                    ),
                    Text(
                      day['numDay'].toString(),
                      style: TextStyle(
                          fontSize: 24,
                          color: day['currentDay']
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
