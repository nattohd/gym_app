import 'package:flutter/material.dart';
import 'config/router/app_router.dart';
import 'config/themes/main_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Gimansio USM JMC',
      routerConfig: appRouter,
      theme: MainTheme(selectedColor: 5).getTheme(false),
    );
  }
}
