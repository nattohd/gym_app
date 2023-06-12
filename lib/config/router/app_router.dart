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
      path: '/reserve/add',
      builder: (context, state) => const AddReservationScreen(),
=======
      path: '/qrgenerate',
      builder: (context, state) => const QrGenerateScreen(),
>>>>>>> cfa754d03f36ef16dc100f31aec955e10f297111
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
