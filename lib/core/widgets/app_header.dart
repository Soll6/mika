import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';
import '../theme/app_typography.dart';
import '../responsive/responsive.dart';

class AppHeader extends StatelessWidget implements PreferredSizeWidget {
  const AppHeader({super.key});
  @override
  Size get preferredSize => const Size.fromHeight(88);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest.withOpacity(0.97),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 8, offset: const Offset(0,1))],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Top bar — Info Travaux Live
          Container(
            color: AppColors.onSurface,
            padding: EdgeInsets.symmetric(horizontal: context.contentPadding, vertical: 6),
            child: ResponsiveContainer(
              child: Row(children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(color: AppColors.primaryContainer, borderRadius: BorderRadius.circular(6)),
                  child: Row(children: [
                    Container(width: 8, height: 8, decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle)),
                    const SizedBox(width: 6),
                    Text('Info Travaux Live', style: AppTypography.labelSm.copyWith(color: Colors.white, fontSize: 10)),
                  ]),
                ),
                const SizedBox(width: 10),
                Expanded(child: Text('Travaux d’aménagement Carrefour Charbonnages & Fly-over Jardin Botanique — Voies déviées opérationnelles.', style: AppTypography.bodySm.copyWith(color: AppColors.surfaceVariant), overflow: TextOverflow.ellipsis)),
                if (context.isDesktop) ...[
                  Text('Siège Owendo : ', style: AppTypography.labelSm.copyWith(color: AppColors.surfaceVariant)),
                  Text('+241 01 70 00 00', style: AppTypography.labelSm.copyWith(color: Colors.white)),
                  const SizedBox(width: 12),
                  Text('contact@mikaservices.ga', style: AppTypography.labelSm.copyWith(color: AppColors.surfaceVariant)),
                  const SizedBox(width: 16),
                  Text('Portail E-Recrutement Colas Gabon', style: AppTypography.labelSm.copyWith(color: AppColors.primaryFixedDim, fontWeight: FontWeight.w700)),
                ],
              ]),
            ),
          ),
          // Nav bar
          SizedBox(
            height: 56,
            child: ResponsiveContainer(
              child: Row(children: [
                // Logo
                Row(children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Image.asset(
                      'assets/icon/logo.png',
                      width: 36,
                      height: 36,
                      fit: BoxFit.contain,
                      errorBuilder: (_, __, ___) => Container(
                        width: 36,
                        height: 36,
                        color: AppColors.primaryContainer,
                        child: const Icon(Icons.apartment, color: Colors.white, size: 20),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  if (!context.isMobile) Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text('MIKA SERVICES', style: AppTypography.labelLg.copyWith(color: AppColors.onSurface, fontWeight: FontWeight.w800, letterSpacing: 0.5)),
                    Text('Holding ACK S.A. • N°1 du BTP au Gabon', style: AppTypography.bodySm.copyWith(color: AppColors.tertiary, fontSize: 11)),
                  ]),
                ]),
                if (context.isDesktop) Expanded(child: SingleChildScrollView(scrollDirection: Axis.horizontal, child: Row(children: _desktopNav(context)))),
                if (context.isDesktop) const SizedBox(width: 8),
                if (context.isDesktop) FilledButton(onPressed: () => context.go('/contact'), style: FilledButton.styleFrom(backgroundColor: AppColors.primaryContainer, foregroundColor: Colors.white, padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10)), child: Text('Contact / AO', style: AppTypography.labelLg.copyWith(color: Colors.white, fontWeight: FontWeight.w700))),
                if (!context.isDesktop) const Spacer(),
                if (!context.isDesktop) IconButton(onPressed: () => _openMobileMenu(context), icon: const Icon(Icons.menu)),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _desktopNav(BuildContext context) {
    final loc = GoRouterState.of(context).uri.toString();
    Widget item(String label, String path) {
      final active = loc == path;
      return InkWell(
        onTap: () => context.go(path),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 6),
          child: Text(label, style: active ? AppTypography.headlineSm.copyWith(color: AppColors.primary, fontWeight: FontWeight.w800, fontSize: 13) : AppTypography.labelLg.copyWith(color: AppColors.onSurfaceVariant, fontSize: 13)),
        ),
      );
    }
    return [
      item('Accueil', '/'),
      item('Le Groupe', '/groupe'),
      item('Nos Activités', '/activites'),
      item('Grands Chantiers', '/chantiers'),
      item('Réalisations', '/realisations'),
      item('Actualités', '/actualites'),
      item('Carrières', '/carrieres'),
      item('RSE', '/rse'),
    ];
  }

  void _openMobileMenu(BuildContext context) {
    showModalBottomSheet(context: context, builder: (_) => SafeArea(child: Column(mainAxisSize: MainAxisSize.min, children: [
      ListTile(title: const Text('Accueil'), onTap: () { Navigator.pop(context); context.go('/'); }),
      ListTile(title: const Text('Le Groupe'), onTap: () { Navigator.pop(context); context.go('/groupe'); }),
      ListTile(title: const Text('Nos Activités'), onTap: () { Navigator.pop(context); context.go('/activites'); }),
      ListTile(title: const Text('Grands Chantiers'), onTap: () { Navigator.pop(context); context.go('/chantiers'); }),
      ListTile(title: const Text('Réalisations'), onTap: () { Navigator.pop(context); context.go('/realisations'); }),
      ListTile(title: const Text('Actualités'), onTap: () { Navigator.pop(context); context.go('/actualites'); }),
      ListTile(title: const Text('Carrières'), onTap: () { Navigator.pop(context); context.go('/carrieres'); }),
      ListTile(title: const Text('RSE'), onTap: () { Navigator.pop(context); context.go('/rse'); }),
      ListTile(title: const Text('Contact'), onTap: () { Navigator.pop(context); context.go('/contact'); }),
      const SizedBox(height: 12),
    ])));
  }
}
