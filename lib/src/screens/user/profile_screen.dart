import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_app/src/services/firestore_service.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    FireStoreService firestore = FireStoreService();
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: colors.primary,
        foregroundColor: colors.surface,
        onPressed: () => context.pop(),
        child: const Icon(Icons.arrow_back_ios_new_rounded),
      ),
      body: Center(
        child: StreamBuilder(
            stream: firestore.juegos(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const CircularProgressIndicator();
              }
              var juegos = snapshot.data?.docs;
              print(juegos);
              return ListView.builder(
                itemCount: juegos?.length,
                itemBuilder: (context, i) {
                  var juego = juegos?[i];

                  return Text(juego?['nombre']);
                },
              );
            }),
      ),
    );
  }
}
