import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_app/src/screens/user/widgets/header_profile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Perfil',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: colors.primary,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: colors.primary,
        foregroundColor: colors.surface,
        onPressed: () => context.pop(),
        child: const Icon(Icons.arrow_back_ios_new_rounded),
      ),
      body: ListView(
        children: const [
          HeaderProfile(),
        ],
      ),
    );
  }
}
