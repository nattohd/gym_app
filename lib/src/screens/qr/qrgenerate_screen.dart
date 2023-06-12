import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrGenerateScreen extends StatelessWidget {
  const QrGenerateScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
        body: ListView.separated(
          itemCount: hours.length,
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
          itemBuilder: (BuildContext context, int index) {
            String day = hours[index]['day'];
            String time = hours[index]['time'];
            String id = hours[index]['id'];

            return ListTile(
              title: Text(day),
              subtitle: Text('Hora: $time, ID: $id'),
              onTap: () {
                showItemDetails(context, day, time, id);
              },
            );
          },
        ));
  }
}

void showItemDetails(BuildContext context, String day, String time, String id) {
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
                data: id,
              ),
            ),
            Text('Día: $day'),
            Text('Hora: $time'),
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

List<Map<String, dynamic>> hours = [
  {'day': 'Lunes', 'time': '9:35 AM', 'id': '1'},
  {'day': 'Martes', 'time': '10:55 AM', 'id': '2'},
  {'day': 'Miércoles', 'time': '12:15 AM', 'id': '3'},
  {'day': 'Viernes', 'time': '2:30 PM', 'id': '4'},
];
