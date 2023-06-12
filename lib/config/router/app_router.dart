import 'package:gym_app/src/screens/screens.dart';
import 'package:go_router/go_router.dart';

// GoRouter configuration
final appRouter = GoRouter(
  // initialLocation: '/login',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => const ProfileScreen(),
    ),
    GoRoute(
      path: '/reserve',
      builder: (context, state) => const ReservasScreen(),
    ),
    GoRoute(
<<<<<<< HEAD
=======
      path: '/qrgenerate',
      builder: (context, state) => const QrGenerateScreen(),
    ),
    GoRoute(
>>>>>>> 964d437e8456640da3d96eec70e263e807ed3266
      path: '/scan',
      builder: (context, state) => const ScanQRScreen(),
    ),
    GoRoute(
      path: '/horas',
      builder: (context, state) => const QrGenerateScreen(),
    ),
  ],
);
