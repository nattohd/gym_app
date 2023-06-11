import 'package:flutter/material.dart';
import 'package:gym_app/src/screens/reservas/widgets/body_calendar.dart';
import 'package:gym_app/src/screens/reservas/widgets/header_calendar.dart';
import 'package:go_router/go_router.dart';

class ReservasScreen extends StatelessWidget {
  const ReservasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Reserva tu Hora'),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: colors.primary,
          foregroundColor: colors.surface,
          onPressed: () => context.pop(),
          child: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        body: Column(
          children: const [
            HeaderCalendar(),
            Expanded(
              child: BodyCalendar(),
            )
          ],
        ));
  }
}
