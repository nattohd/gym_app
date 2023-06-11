import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_app/config/menu/menu_items.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textStyles = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.home_filled,
          color: colors.primary,
        ),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'logout') {
                // Acción al seleccionar "Cerrar sesión"
                // Puedes llamar a un método para cerrar la sesión o realizar otras acciones necesarias
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              PopupMenuItem<String>(
                value: 'logout',
                child: ListTile(
                  title: Text('Cerrar sesión'),
                ),
              ),
            ],
            child: InkWell(
              splashColor: colors.primary.withOpacity(.1),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              onTap: () {},
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.person,
                      color: colors.primary,
                    ),
                    const SizedBox(width: 5),
                    Text('Usuario usm', style: textStyles.labelMedium)
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
        ],
        title: const Text('Inicio'),
      ),
      body: ListView.builder(
        itemCount: menuItems.length,
        itemBuilder: (context, index) {
          final item = menuItems[index];

          return ListTile(
            splashColor: colors.primary.withOpacity(0.35),
            title: Text(item.title),
            subtitle: Text(item.subTitle),
            trailing: Icon(
              Icons.arrow_forward_ios_outlined,
              color: colors.primary,
            ),
            leading: Icon(
              item.icon,
              color: colors.primary,
            ),
            // ignore: avoid_print
            onTap: () => context.push(item.link),
          );
        },
      ),
    );
  }
}
