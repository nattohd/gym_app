import 'package:flutter/material.dart';
import 'package:gym_app/src/screens/reservas/widgets/body_calendar.dart';
import 'package:gym_app/src/screens/reservas/widgets/header_calendar.dart';

class ReservasScreen extends StatelessWidget {
  const ReservasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final colors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reserva tu Hora'),
      ),
      body: const Column(
        children: [
          HeaderCalendar(),
          Expanded(
            child: BodyCalendar(),
          )
        ],
      ),
    );
  }
}
