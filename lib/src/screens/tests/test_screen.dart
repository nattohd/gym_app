import 'package:flutter/material.dart';
import 'package:gym_app/infrastructure/models/reservas_model.dart';
import 'package:gym_app/src/providers/providers.dart';
import 'package:provider/provider.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    final reservaProvider = context.watch<ReservaProvider>();
    final userProvider = context.watch<UserProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tests'),
      ),
      body: Column(
        children: [
          StreamBuilder(
            stream: reservaProvider.getListOfReservas(userProvider.user!.uid),
            builder: (context, snapshot) {
              if (!snapshot.hasData) const CircularProgressIndicator();
              List<ReservaModel> reservas = snapshot.data ?? [];
              return Container(
                color: Colors.blue,
                child: Column(
                  children: reservas.map((e) {
                    return Container(
                      color: Colors.blue,
                      child: Column(
                        children: [
                          Text(e.bloque.toString()),
                          Text(e.dia),
                          Text(e.entrada),
                          Text(e.salida),
                          Text(e.confirmada ? 'Confirmada' : 'Por Confirmar'),
                          Text(e.idDoc!),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              );
            },
          ),
          FilledButton(
            child: const Text('Actualizar'),
            onPressed: () async {
              final reserva = await reservaProvider
                  .setConfirmarReservar('giX2ckbg69FlhNDnTTOl');
              print(reserva.idDoc);
            },
          ),
          FilledButton(
            child: const Text('Crear reserva'),
            onPressed: () async {
              DateTime now = DateTime.now();
              final newReserva = ReservaModel(
                bloque: 4,
                confirmada: false,
                dia: 'Martes',
                entrada: '10:55',
                salida: '12:05',
                uid: '0q0OlxNkvfU0YFJFSJ6vTusbRQi2',
                motivo: 'Recuperativo',
                fecha: '11/11/1111',
              );
              await reservaProvider.createNewReserva(newReserva);
            },
          ),
        ],
      ),
    );
  }
}
