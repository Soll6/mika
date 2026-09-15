import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/widgets/app_footer.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/responsive/responsive.dart';

class ChantierDetailPage extends StatelessWidget {
  final String id;
  const ChantierDetailPage({super.key, required this.id});

  Map<String, dynamic> get data {
    final map = {
      'estuaire': {'title': 'Modernisation Urbaine de l’Estuaire', 'budget': '100 Milliards FCFA', 'v': 0.68, 'img': 'assets/images/fly over jardin bpotanique.jpg', 'desc': 'Programme phare de la convention tripartite État / BGFIBank. Aménagement du giratoire de 108 m, fly-over du Jardin Botanique, carrefour Charbonnages et voiries Akébé-Ndjongoni.'},
      'owendo': {'title': 'Owendo Bypass — 14 km Stratégique', 'budget': '≈ 60 Milliards FCFA', 'v': 0.42, 'img': 'assets/images/charbonnages.jpg', 'desc': 'Raccordement direct ZES de Nkok ↔ Port d’Owendo. Chaussée lourde haute résistance pour trafic grumiers, désengorgement corridor Sud.'},
      'transga': {'title': 'Régénération Transgabonais & Moanda', 'budget': 'Mission Souveraine', 'v': 0.85, 'img': 'assets/images/accueil_tournant historique.jpg', 'desc': 'Stabilisation plateformes ferroviaires, grands terrassements plateau Bangombé, sécurisation corridor manganèse COMILOG/SETRAG.'},
    };
    return map[id] ?? {'title': 'Fiche Chantier — $id', 'budget': '—', 'v': 0.5, 'img': 'assets/images/fly over jardin bpotanique.jpg', 'desc': 'Détails techniques du chantier. Données certifiées DGPW.'};
  }

  Widget _buildHeroImage(String path) {
    if (path.startsWith('assets/')) {
      return Image.asset(path, height: 380, width: double.infinity, fit: BoxFit.cover, errorBuilder: (_, __, ___) => Container(height: 380, color: AppColors.surfaceDim));
    }
    return Image.network(path, height: 380, width: double.infinity, fit: BoxFit.cover, errorBuilder: (_, __, ___) => Container(height: 380, color: AppColors.surfaceDim));
  }

  Widget _buildGalleryImage(String path) {
    if (path.startsWith('assets/')) {
      return Image.asset(path, fit: BoxFit.cover, errorBuilder: (_, __, ___) => Container(color: AppColors.surfaceDim));
    }
    return Image.network(path, fit: BoxFit.cover, errorBuilder: (_, __, ___) => Container(color: AppColors.surfaceDim));
  }

  @override
  Widget build(BuildContext context) {
    final d = data;
    return PageScaffold(
      child: Column(children: [
        // Hero
        Stack(children: [
          _buildHeroImage(d['img'] as String),
          Container(height: 380, decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Colors.transparent, AppColors.onSurface.withOpacity(0.85)]))),
          Positioned(
            bottom: 24, left: context.contentPadding, right: context.contentPadding,
            child: ResponsiveContainer(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6), decoration: BoxDecoration(color: AppColors.primaryContainer, borderRadius: BorderRadius.circular(8)), child: Text('En Travaux • ${((d['v'] as double)*100).toInt()}%', style: AppTypography.labelSm.copyWith(color: Colors.white))),
              const SizedBox(height: 10),
              Text(d['title'] as String, style: (context.isMobile ? AppTypography.displayMdMobile : AppTypography.displayMd).copyWith(color: Colors.white)),
              const SizedBox(height: 6),
              Text(d['budget'] as String, style: AppTypography.labelLg.copyWith(color: AppColors.primaryFixed)),
              const SizedBox(height: 10),
              ClipRRect(borderRadius: BorderRadius.circular(99), child: LinearProgressIndicator(value: d['v'] as double, minHeight: 8, backgroundColor: Colors.white.withOpacity(0.2), valueColor: const AlwaysStoppedAnimation(AppColors.primaryContainer))),
            ])),
          ),
        ]),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: context.contentPadding, vertical: 28),
          child: ResponsiveContainer(
            child: context.isMobile ? _mobile(context, d) : _desktop(context, d),
          ),
        ),
      ]),
    );
  }

  Widget _desktop(BuildContext context, Map<String, dynamic> d) => Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(flex: 7, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Présentation', style: AppTypography.headlineLg.copyWith(color: AppColors.onSurface)),
          const SizedBox(height: 10),
          Text(d['desc'] as String, style: AppTypography.bodyLg.copyWith(color: AppColors.tertiary)),
          const SizedBox(height: 20),
          Text('Caractéristiques techniques', style: AppTypography.headlineMd.copyWith(color: AppColors.onSurface)),
          const SizedBox(height: 10),
          _table(),
          const SizedBox(height: 20),
          Text('Planning & Jalons', style: AppTypography.headlineMd.copyWith(color: AppColors.onSurface)),
          const SizedBox(height: 10),
          _timeline(),
          const SizedBox(height: 20),
          Text('Galerie', style: AppTypography.headlineMd.copyWith(color: AppColors.onSurface)),
          const SizedBox(height: 10),
          GridView.count(crossAxisCount: 2, shrinkWrap: true, physics: const NeverScrollableScrollPhysics(), mainAxisSpacing: 10, crossAxisSpacing: 10, childAspectRatio: 16/10, children: [
            ClipRRect(borderRadius: BorderRadius.circular(12), child: _buildGalleryImage('assets/images/fly over jardin bpotanique.jpg')),
            ClipRRect(borderRadius: BorderRadius.circular(12), child: _buildGalleryImage('assets/images/charbonnages.jpg')),
            ClipRRect(borderRadius: BorderRadius.circular(12), child: _buildGalleryImage('assets/images/accueil_tournant historique.jpg')),
            ClipRRect(borderRadius: BorderRadius.circular(12), child: _buildGalleryImage('assets/images/le groupe.jpg')),
          ]),
        ])),
        const SizedBox(width: 24),
        Expanded(flex: 4, child: Column(children: [
          Container(padding: const EdgeInsets.all(20), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 12)]), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Informations clés', style: AppTypography.headlineSm.copyWith(color: AppColors.onSurface)),
            const SizedBox(height: 12),
            _kv('Maître d’ouvrage', 'État Gabonais / MTP'),
            _kv('Budget', d['budget'] as String),
            _kv('Avancement', '${((d['v'] as double)*100).toInt()}% certifié DGPW'),
            _kv('Localisation', 'Libreville — Estuaire / Owendo'),
            const SizedBox(height: 16),
            SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => context.go('/contact'), child: const Text('Contacter le chantier'))),
            const SizedBox(height: 8),
            SizedBox(width: double.infinity, child: OutlinedButton(onPressed: () {}, child: const Text('Télécharger fiche PDF'))),
          ])),
          const SizedBox(height: 16),
          Container(padding: const EdgeInsets.all(16), decoration: BoxDecoration(color: AppColors.warningBg, borderRadius: BorderRadius.circular(12), border: Border.all(color: AppColors.primaryContainer.withOpacity(0.2))), child: Row(children: [const Icon(Icons.warning_amber, color: AppColors.primaryContainer), const SizedBox(width: 8), Expanded(child: Text('Circulation : déviations actives, vitesse limitée 30 km/h.', style: AppTypography.bodySm.copyWith(color: AppColors.onSurface)))])),
        ])),
      ]);

  Widget _mobile(BuildContext context, Map<String, dynamic> d) => Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('Présentation', style: AppTypography.headlineLg.copyWith(color: AppColors.onSurface)),
        const SizedBox(height: 8),
        Text(d['desc'] as String, style: AppTypography.bodyMd.copyWith(color: AppColors.tertiary)),
        const SizedBox(height: 16),
        _table(),
        const SizedBox(height: 16),
        _timeline(),
        const SizedBox(height: 16),
        SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => context.go('/contact'), child: const Text('Contacter'))),
      ]);

  Widget _kv(String k, String v) => Padding(padding: const EdgeInsets.only(bottom: 10), child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [SizedBox(width: 130, child: Text(k, style: AppTypography.labelMd.copyWith(color: AppColors.tertiary))), Expanded(child: Text(v, style: AppTypography.bodyMd.copyWith(color: AppColors.onSurface, fontWeight: FontWeight.w600)))]));
  Widget _table() => Container(
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: const Color(0xFFE2E8F0))),
        child: Column(children: [
          _tr('Linéaire', '14 km (Owendo) / 108 m giratoire', true),
          _tr('Chaussée', 'BBME 0/14 + BBTM, couche de roulement 6 cm', false),
          _tr('Ouvrages', 'Fly-over précontraint, 4 tabliers', true),
          _tr('Terrassements', '5 M m³ déblais/remblais', false),
        ]),
      );
  Widget _tr(String a, String b, bool bg) => Container(color: bg ? AppColors.surfaceContainerLow : Colors.white, padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10), child: Row(children: [Expanded(child: Text(a, style: AppTypography.labelMd.copyWith(color: AppColors.onSurface))), Expanded(child: Text(b, style: AppTypography.bodySm.copyWith(color: AppColors.tertiary)))]));
  Widget _timeline() => Column(children: [
        _tl('T1 2025', 'Installation & décapage', true),
        _tl('T2 2025', 'Terrassements massifs PK04-PK09', true),
        _tl('T3 2025', 'Pose enrobés & tabliers fly-over', false),
        _tl('T4 2025', 'Achèvement & réception', false),
      ]);
  Widget _tl(String d, String t, bool done) => Padding(padding: const EdgeInsets.only(bottom: 10), child: Row(children: [Container(width: 12, height: 12, decoration: BoxDecoration(color: done ? AppColors.success : AppColors.outlineVariant, shape: BoxShape.circle)), const SizedBox(width: 10), Text(d, style: AppTypography.labelMd.copyWith(color: done ? AppColors.success : AppColors.tertiary)), const SizedBox(width: 12), Expanded(child: Text(t, style: AppTypography.bodyMd.copyWith(color: AppColors.onSurface)))]));
}
