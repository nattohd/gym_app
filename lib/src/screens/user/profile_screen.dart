import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gym_app/src/screens/user/widgets/header_profile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Perfil',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        centerTitle: true,
        backgroundColor: colors.primary,
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(left: size.width * 0.1),
        child: Container(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: size.width * 0.5,
            child: FloatingActionButton(
              backgroundColor: colors.primary,
              foregroundColor: colors.surface,
              onPressed: () => context.pop(),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FaIcon(FontAwesomeIcons.rightFromBracket),
                  Text(
                    'Cerrar sesion',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: const Stack(
        children: [
          HeaderProfile(),
        ],
      ),
      backgroundColor: colors.primary,
    );
  }
}
