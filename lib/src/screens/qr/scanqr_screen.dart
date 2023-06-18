import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_app/src/providers/reservas/reservas_provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanQRScreen extends StatefulWidget {
  const ScanQRScreen({super.key});

  @override
  State<ScanQRScreen> createState() => _ScanQRScreenState();
}

class _ScanQRScreenState extends State<ScanQRScreen> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  bool showed = false;
  late Map data;
  late String dia;
  late String horaEntrada;
  late String horaSalida;
  late int bloque;
  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: colors.primary,
        foregroundColor: colors.surface,
        onPressed: () => context.pop(),
        child: const Icon(Icons.arrow_back_ios_new_rounded),
      ),
      body: SizedBox(
        child: _buildQrView(context),
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.red,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() async {
        result = scanData;

        if (result != Barcode("", BarcodeFormat.aztec, []) && !showed) {
          showed == true;
          controller.pauseCamera();
          data = await getCosas(result!.code as String, 'reservas');
          dia = data['dia'];
          horaEntrada = data['entrada'];
          horaSalida = data['salida'];
          bloque = data['bloque'];
          // ignore: use_build_context_synchronously
          showDialog(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                    title: const Text('Scaneado correctamente'),
                    content: Container(
                      height: 300,
                      child: Column(
                        children: [
                          Text('Hora Inicio: $horaEntrada'),
                          Text('Hora Termino: $horaSalida'),
                          Text('Bloque: ${bloque.toString()}'),
                        ],
                      ),
                    ),
                    actions: <Widget>[
                      TextButton(
                        child: const Text('Salir'),
                        onPressed: () {
                          Navigator.pop(context, 'Cancel');
                          controller.resumeCamera();
                        },
                      )
                    ],
                  ));
        }
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }
}
