import 'package:go_router/go_router.dart';
import '../../features/home/home_page.dart';
import '../../features/activites/activites_page.dart';
import '../../features/chantiers/chantiers_page.dart';
import '../../features/chantiers/chantier_detail_page.dart';
import '../../features/realisations/realisations_page.dart';
import '../../features/groupe/groupe_page.dart';
import '../../features/actualites/actualites_page.dart';
import '../../features/rse/rse_page.dart';
import '../../features/contact/contact_page.dart';
import '../../features/carrieres/carrieres_page.dart';
import '../../features/legal/legal_page.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (_, __) => const HomePage()),
    GoRoute(path: '/activites', builder: (_, __) => const ActivitesPage()),
    GoRoute(path: '/chantiers', builder: (_, __) => const ChantiersPage()),
    GoRoute(path: '/chantiers/:id', builder: (_, s) => ChantierDetailPage(id: s.pathParameters['id']!)),
    GoRoute(path: '/realisations', builder: (_, __) => const RealisationsPage()),
    GoRoute(path: '/groupe', builder: (_, __) => const GroupePage()),
    GoRoute(path: '/actualites', builder: (_, __) => const ActualitesPage()),
    GoRoute(path: '/rse', builder: (_, __) => const RsePage()),
    GoRoute(path: '/contact', builder: (_, __) => const ContactPage()),
    GoRoute(path: '/carrieres', builder: (_, __) => const CarrieresPage()),
    GoRoute(path: '/legal', builder: (_, __) => const LegalPage()),
  ],
);
