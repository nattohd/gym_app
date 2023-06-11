import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
      body: const Center(
        child: Text('QR generado para entrar'),
      ),
    );
  }
}
