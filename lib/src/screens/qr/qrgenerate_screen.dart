import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_app/infrastructure/models/reservas_model.dart';
import 'package:gym_app/src/providers/providers.dart';
import 'package:gym_app/src/screens/qr/widgets/empty_reservas.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrGenerateScreen extends StatefulWidget {
  const QrGenerateScreen({super.key});

  @override
  State<QrGenerateScreen> createState() => _QrGenerateScreenState();
}

class _QrGenerateScreenState extends State<QrGenerateScreen> {
  @override
  Widget build(BuildContext context) {
    final reservaProvider = context.watch<ReservaProvider>();
    final userProvider = context.watch<UserProvider>();
    print(userProvider.user!.uid);

    final colors = Theme.of(context).colorScheme;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Entrada QR'),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: colors.primary,
          foregroundColor: colors.surface,
          onPressed: () => context.pop(),
          child: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        body: StreamBuilder(
            stream: reservaProvider.getListOfReservas(userProvider.user!.uid),
            builder: (context, snapshot) {
              if (!snapshot.hasData) CircularProgressIndicator();

              List<ReservaModel> reservas = snapshot.data ?? [];

              if (reservas.isEmpty) {
                return const Center(child: EmptyReservas());
              }

              return ListView.separated(
                itemCount: reservas.length,
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
                itemBuilder: (BuildContext context, int index) {
                  final reserva = reservas[index];

                  return ListTile(
                      title: Text(reserva.dia),
                      subtitle: Text(
                          'Hora Entrada: ${reserva.entrada}, Hora Salida: ${reserva.salida}'),
                      onTap: () {
                        showItemDetails(context, reserva);
                      },
                      trailing: reserva.confirmada == false
                          ? Image.asset(
                              'assets/images/denied.png',
                              fit: BoxFit.cover,
                            )
                          : Image.asset(
                              'assets/images/check2.png',
                              fit: BoxFit.cover,
                            ));
                },
              );
            }));
  }
}

void showItemDetails(BuildContext context, ReservaModel reserva) {
  Size size = MediaQuery.of(context).size;

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Detalles de la hora'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: size.width,
              height: size.height * 0.3,
              child: QrImageView(
                data: reserva.idDoc!,
              ),
            ),
            Text('Día: ${reserva.dia}'),
            Text('Motivo: ${reserva.motivo}'),
            Text('Día: ${reserva.bloque}'),
            Text('Hora entrada: ${reserva.entrada}'),
            Text('Hora salida: ${reserva.salida}'),
            Text(reserva.confirmadaToString()),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cerrar'),
          ),
        ],
      );
    },
  );
}
