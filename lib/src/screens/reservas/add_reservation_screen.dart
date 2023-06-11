import 'package:flutter/material.dart';

class AddReservationScreen extends StatelessWidget {
  const AddReservationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Realiza tu reserva'),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: colors.primary,
        foregroundColor: colors.surface,
        onPressed: () {},
        child: const Icon(Icons.arrow_back_ios_new_rounded),
      ),
      body: const Center(
        child: Text('Realiza tu reserva'),
      ),
    );
  }
}
