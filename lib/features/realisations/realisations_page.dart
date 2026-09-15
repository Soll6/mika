import 'package:flutter/material.dart';
import '../../core/widgets/app_footer.dart';
import '../../core/widgets/section_header.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/responsive/responsive.dart';

class RealisationsPage extends StatelessWidget {
  const RealisationsPage({super.key});
  @override
  Widget build(BuildContext context) {
    final items = [
      {'t': 'Giratoire 108 m — Estuaire', 'c': 'Ouvrage d’art majeur', 's': 'Livré', 'img': 'assets/images/fly over jardin bpotanique.jpg'},
      {'t': 'Fly-over Jardin Botanique', 'c': 'Béton précontraint 4 tabliers', 's': 'En Travaux', 'img': 'assets/images/fly over jardin bpotanique.jpg'},
      {'t': 'Owendo Bypass 14 km', 'c': 'Chaussée lourde ZES Nkok', 's': 'En Travaux', 'img': 'assets/images/charbonnages.jpg'},
      {'t': 'Plateforme Bangombé — Moanda', 'c': 'Terrassements miniers', 's': 'Phase Finale', 'img': 'assets/images/accueil_tournant historique.jpg'},
      {'t': 'Carrefour Charbonnages', 'c': 'Aménagement urbain & drainage', 's': 'En Travaux', 'img': 'assets/images/charbonnages.jpg'},
      {'t': 'Voiries Akébé-Ndjongoni', 'c': 'Enrobés denses 12 km', 's': 'Livré', 'img': 'assets/images/le groupe.jpg'},
    ];
    return PageScaffold(
      child: Column(children: [
        Container(width: double.infinity, color: AppColors.onSurface, padding: EdgeInsets.symmetric(horizontal: context.contentPadding, vertical: 40), child: ResponsiveContainer(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Réalisations'.toUpperCase(), style: AppTypography.labelSm.copyWith(color: AppColors.primaryFixed)), const SizedBox(height: 8), Text('Portefeuille d’Ouvrages d’Art\n& Infrastructures', style: (context.isMobile ? AppTypography.displayLgMobile : AppTypography.displayLg).copyWith(color: Colors.white)), const SizedBox(height: 12), Text('Plus de 15 km de voiries, ouvrages d’art et plateformes livrés ou en cours — la preuve par l’ouvrage.', style: AppTypography.bodyXl.copyWith(color: AppColors.surfaceDim))]))),
        Padding(padding: EdgeInsets.symmetric(horizontal: context.contentPadding, vertical: 24), child: ResponsiveContainer(child: Column(children: [
          Wrap(spacing: 8, children: ['Tous', 'Livré', 'En Travaux', 'Phase Finale'].map((e) => Chip(label: Text(e), backgroundColor: e == 'Tous' ? AppColors.primaryContainer : Colors.white, labelStyle: AppTypography.labelMd.copyWith(color: e == 'Tous' ? Colors.white : AppColors.onSurface))).toList()),
          const SizedBox(height: 20),
          ResponsiveGrid(desktopCols: 3, tabletCols: 2, mobileCols: 1, gap: 16, children: items.map((e) => _card(e, context)).toList()),
        ]))),
        _metrics(context),
      ]),
    );
  }

  Widget _cardImage(String path) {
    if (path.startsWith('assets/')) return Image.asset(path, height: 200, width: double.infinity, fit: BoxFit.cover, errorBuilder: (_, __, ___) => Container(height: 200, color: AppColors.surfaceDim));
    return Image.network(path, height: 200, width: double.infinity, fit: BoxFit.cover, errorBuilder: (_, __, ___) => Container(height: 200, color: AppColors.surfaceDim));
  }

  Widget _card(Map<String, String> e, BuildContext context) => Container(
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 12)]),
        clipBehavior: Clip.antiAlias,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Stack(children: [_cardImage(e['img']!), Positioned(top: 12, right: 12, child: StatusBadge(text: e['s']!, bg: e['s'] == 'Livré' ? AppColors.successBg : AppColors.warningBg, fg: e['s'] == 'Livré' ? AppColors.success : AppColors.primary))]),
          Padding(padding: const EdgeInsets.all(14), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(e['c']!.toUpperCase(), style: AppTypography.labelSm.copyWith(color: AppColors.secondary, fontSize: 10)), const SizedBox(height: 4), Text(e['t']!, style: AppTypography.headlineMd.copyWith(color: AppColors.onSurface, fontSize: 17)), const SizedBox(height: 8), Row(children: [const Icon(Icons.location_on, size: 14, color: AppColors.tertiary), const SizedBox(width: 4), Text('Estuaire — Gabon', style: AppTypography.bodySm.copyWith(color: AppColors.tertiary))])])),
        ]),
      );

  Widget _metrics(BuildContext context) => Container(color: AppColors.surfaceContainerLow, padding: EdgeInsets.symmetric(horizontal: context.contentPadding, vertical: 28), child: ResponsiveContainer(child: ResponsiveGrid(desktopCols: 4, tabletCols: 2, mobileCols: 2, gap: 16, children: const [
        StatCard(label: 'Linéaire livré', value: '15+ km', desc: 'Voiries & ouvrages d’art réceptionnés.', icon: Icons.straighten),
        StatCard(label: 'Ouvrages d’art', value: '8', desc: 'Ponts, fly-overs, giratoires.', icon: Icons.account_balance),
        StatCard(label: 'Années d’expertise', value: '20+', desc: 'Au service du BTP gabonais.', icon: Icons.history),
        StatCard(label: 'Taux conformité', value: '100%', desc: 'Réceptions DGPW sans réserve.', icon: Icons.verified),
      ])));
}

class StatusBadge extends StatelessWidget {
  final String text;
  final Color bg;
  final Color fg;
  const StatusBadge({super.key, required this.text, required this.bg, required this.fg});
  @override
  Widget build(BuildContext context) => Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5), decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(6)), child: Text(text, style: AppTypography.labelSm.copyWith(color: fg, fontSize: 10)));
}
