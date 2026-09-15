import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/widgets/app_footer.dart';
import '../../core/widgets/section_header.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/responsive/responsive.dart';

class ChantiersPage extends StatefulWidget {
  const ChantiersPage({super.key});
  @override
  State<ChantiersPage> createState() => _ChantiersPageState();
}

class _ChantiersPageState extends State<ChantiersPage> {
  String filter = 'Tous';
  final items = [
    {'title': 'Modernisation Urbaine de l’Estuaire', 'sub': 'Convention Tripartite État / BGFIBank', 'budget': '100 Milliards FCFA', 'v': 0.68, 'badge': 'En Travaux • 68%', 'c': AppColors.primaryContainer, 'img': 'assets/images/fly over jardin bpotanique.jpg', 'id': 'estuaire', 'status': 'En Travaux'},
    {'title': 'Owendo Bypass — 14 km Stratégique', 'sub': 'Groupement MIKA Services & NGE', 'budget': '≈ 60 Milliards FCFA', 'v': 0.42, 'badge': 'En Travaux • 42%', 'c': AppColors.secondary, 'img': 'assets/images/charbonnages.jpg', 'id': 'owendo', 'status': 'En Travaux'},
    {'title': 'Régénération Transgabonais & Moanda', 'sub': 'Partenariat COMILOG / SETRAG', 'budget': 'Mission Souveraine', 'v': 0.85, 'badge': 'Phase Finale • 85%', 'c': AppColors.tertiary, 'img': 'assets/images/accueil_tournant historique.jpg', 'id': 'transga', 'status': 'Phase Finale'},
    {'title': 'Akébé-Ndjongoni — Voiries Urbaines', 'sub': 'Marché Ville de Libreville', 'budget': '12 Milliards FCFA', 'v': 1.0, 'badge': 'Livré', 'c': AppColors.success, 'img': 'https://images.unsplash.com/photo-1541888946425-d81bb19240f6?w=800', 'id': 'akebe', 'status': 'Livré'},
    {'title': 'Kango — Axe Interurbain', 'sub': 'Ministère des Travaux Publics', 'budget': '18 Milliards FCFA', 'v': 0.55, 'badge': 'En Travaux • 55%', 'c': AppColors.primaryContainer, 'img': 'https://images.unsplash.com/photo-1497366216548-37526070297c?w=800', 'id': 'kango', 'status': 'En Travaux'},
    {'title': 'Grand Marché d’Owendo', 'sub': 'Commune d’Owendo', 'budget': '8 Milliards FCFA', 'v': 0.30, 'badge': 'En Travaux • 30%', 'c': AppColors.primary, 'img': 'https://images.unsplash.com/photo-1449157291145-7efd050a4d0e?w=800', 'id': 'marche', 'status': 'En Travaux'},
  ];

  @override
  Widget build(BuildContext context) {
    final filtered = filter == 'Tous' ? items : items.where((e) => e['status'] == filter).toList();
    return PageScaffold(
      child: Column(children: [
        Container(
          width: double.infinity,
          color: AppColors.surfaceContainerLow,
          padding: EdgeInsets.symmetric(horizontal: context.contentPadding, vertical: 32),
          child: ResponsiveContainer(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SectionHeader(eyebrow: 'Opérations Prioritaires de l’État', title: 'Grands Chantiers d’Envergure Nationale', subtitle: 'Suivi certifié conforme au cahier des charges du Ministère des Travaux Publics. Données DGPW — Mars 2025.'),
              const SizedBox(height: 16),
              Wrap(spacing: 8, children: ['Tous', 'En Travaux', 'Phase Finale', 'Livré'].map((f) {
                final active = filter == f;
                return ChoiceChip(label: Text(f), selected: active, onSelected: (_) => setState(() => filter = f), selectedColor: AppColors.primaryContainer, labelStyle: AppTypography.labelMd.copyWith(color: active ? Colors.white : AppColors.onSurface));
              }).toList()),
            ]),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: context.contentPadding, vertical: 24),
          child: ResponsiveContainer(
            child: ResponsiveGrid(desktopCols: 3, tabletCols: 2, mobileCols: 1, gap: 16, children: filtered.map((e) => _card(e, context)).toList()),
          ),
        ),
        _deviations(context),
      ]),
    );
  }

  Widget _cardImage(String path) {
    if (path.startsWith('assets/')) {
      return Image.asset(path, height: 180, width: double.infinity, fit: BoxFit.cover, errorBuilder: (_, __, ___) => Container(height: 180, color: AppColors.surfaceDim));
    }
    return Image.network(path, height: 180, width: double.infinity, fit: BoxFit.cover, errorBuilder: (_, __, ___) => Container(height: 180, color: AppColors.surfaceDim));
  }

  Widget _card(Map<String, dynamic> e, BuildContext context) => Container(
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 12)]),
        clipBehavior: Clip.antiAlias,
        child: Column(children: [
          Stack(children: [
            _cardImage(e['img'] as String),
            Positioned(top: 12, right: 12, child: Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5), decoration: BoxDecoration(color: e['c'] as Color, borderRadius: BorderRadius.circular(6)), child: Text(e['badge'] as String, style: AppTypography.labelSm.copyWith(color: Colors.white, fontSize: 10)))),
            Positioned(bottom: 10, left: 10, child: Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5), decoration: BoxDecoration(color: AppColors.onSurface.withOpacity(0.82), borderRadius: BorderRadius.circular(99)), child: Text(e['budget'] as String, style: AppTypography.labelSm.copyWith(color: Colors.white)))),
          ]),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text((e['sub'] as String).toUpperCase(), style: AppTypography.labelSm.copyWith(color: AppColors.secondary, fontSize: 10)),
              const SizedBox(height: 4),
              Text(e['title'] as String, style: AppTypography.headlineMd.copyWith(color: AppColors.onSurface, fontSize: 18)),
              const SizedBox(height: 10),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text('Progression certifiée', style: AppTypography.labelSm.copyWith(color: AppColors.tertiary)), Text('${((e['v'] as double) * 100).toInt()}%', style: AppTypography.labelLg.copyWith(color: AppColors.onSurface, fontWeight: FontWeight.w800))]),
              const SizedBox(height: 6),
              ClipRRect(borderRadius: BorderRadius.circular(99), child: LinearProgressIndicator(value: e['v'] as double, minHeight: 8, backgroundColor: AppColors.surfaceContainer, valueColor: AlwaysStoppedAnimation(e['c'] as Color))),
              const SizedBox(height: 12),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text('M.O. : État Gabonais', style: AppTypography.labelSm.copyWith(color: AppColors.tertiary, fontSize: 10)),
                InkWell(onTap: () => context.go('/chantiers/${e['id']}'), child: Row(children: [Text('Fiche technique', style: AppTypography.labelMd.copyWith(color: AppColors.primary)), const Icon(Icons.chevron_right, size: 16, color: AppColors.primary)])),
              ]),
            ]),
          ),
        ]),
      );

  Widget _deviations(BuildContext context) => Container(
        color: AppColors.surfaceContainerLow,
        padding: EdgeInsets.symmetric(horizontal: context.contentPadding, vertical: 24),
        child: ResponsiveContainer(
          child: Column(children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Row(children: [Container(width: 10, height: 10, decoration: const BoxDecoration(color: AppColors.primary, shape: BoxShape.circle)), const SizedBox(width: 8), Text('Info Travaux & Déviations', style: AppTypography.headlineMd.copyWith(color: AppColors.onSurface))]), if (!context.isMobile) OutlinedButton.icon(onPressed: () {}, icon: const Icon(Icons.picture_as_pdf), label: const Text('Plans PDF'))]),
            const SizedBox(height: 16),
            ResponsiveGrid(desktopCols: 3, tabletCols: 2, mobileCols: 1, children: [
              _dev('Carrefour Charbonnages', 'PK 07', 'Travaux de nuit 21h-5h. Déviation via voie secondaire.', AppColors.primary),
              _dev('Jardin Botanique / Fly-Over', 'Axe Triomphal', 'Pose travées précontraintes. Circulation alternée.', AppColors.secondary),
              _dev('Camp de Gaulle – Kalikak', 'Zone Nord', 'Terrassements profonds. Vitesse limitée 30 km/h.', AppColors.primaryContainer),
            ]),
          ]),
        ),
      );

  Widget _dev(String t, String pk, String d, Color c) => Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
        child: Row(children: [
          Container(width: 4, height: 60, decoration: BoxDecoration(color: c, borderRadius: BorderRadius.circular(99))),
          const SizedBox(width: 12),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text(t.toUpperCase(), style: AppTypography.labelSm.copyWith(color: c, fontSize: 10)), Text(pk, style: AppTypography.labelSm.copyWith(color: AppColors.tertiary))]), const SizedBox(height: 6), Text(d, style: AppTypography.bodySm.copyWith(color: AppColors.onSurface))])),
        ]),
      );
}
