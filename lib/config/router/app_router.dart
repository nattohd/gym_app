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
      path: '/reserve/add',
      builder: (context, state) => const AddReservationScreen(),
    ),
    GoRoute(
      path: '/scan',
      builder: (context, state) => const ScanQRScreen(),
    ),
    GoRoute(
      path: '/horas',
      builder: (context, state) => const QrGenerateScreen(),
    ),
  ],
);
