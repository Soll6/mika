import 'package:flutter/material.dart';
import '../../core/widgets/app_footer.dart';
import '../../core/widgets/section_header.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/responsive/responsive.dart';

class RsePage extends StatelessWidget {
  const RsePage({super.key});
  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      child: Column(children: [
        Container(width: double.infinity, color: AppColors.secondary, padding: EdgeInsets.symmetric(horizontal: context.contentPadding, vertical: 40), child: ResponsiveContainer(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Engagements RSE'.toUpperCase(), style: AppTypography.labelSm.copyWith(color: AppColors.secondaryFixedDim)), const SizedBox(height: 8), Text('Bâtir durable,\nformer, préserver', style: (context.isMobile ? AppTypography.displayLgMobile : AppTypography.displayLg).copyWith(color: Colors.white)), const SizedBox(height: 12), Text('Emploi local, environnement, sécurité — la RSE au cœur de chaque chantier MIKA.', style: AppTypography.bodyXl.copyWith(color: Colors.white.withOpacity(0.85))) ]))),
        Padding(padding: EdgeInsets.symmetric(horizontal: context.contentPadding, vertical: 32), child: ResponsiveContainer(child: Column(children: [
          const SectionHeader(eyebrow: 'Emploi & Formation', title: '1 500 emplois gabonais, 200 jeunes formés/an', subtitle: 'Compagnonnage, conduite d’engins, coffrage-ferraillage : transmission des savoir-faire.', centered: true),
          const SizedBox(height: 20),
          ResponsiveGrid(desktopCols: 3, children: [
            _rseCard(Icons.school, 'Formation', '200 jeunes / an en alternance compagnonnage.', AppColors.primaryContainer),
            _rseCard(Icons.diversity_3, 'Emploi local', '95% de collaborateurs gabonais sur chantiers.', AppColors.secondary),
            _rseCard(Icons.workspace_premium, 'Certification', 'Habilitations HSE et CACES engins lourds.', AppColors.success),
          ]),
          const SizedBox(height: 32),
          const SectionHeader(eyebrow: 'Environnement', title: 'Moins d’impact, plus de contrôle', subtitle: 'Carrières réaménagées, enrobés tièdes, gestion eau et poussières.', centered: true),
          const SizedBox(height: 20),
          ResponsiveGrid(desktopCols: 3, children: [
            _rseCard(Icons.eco, 'Carrières responsables', 'Réaménagement progressif, suivi biodiversité.', AppColors.success),
            _rseCard(Icons.water_drop, 'Eau & poussières', 'Brummisation, bassins décantation, arrosage pistes.', AppColors.secondary),
            _rseCard(Icons.recycling, 'Recyclage', 'Fraisats d’enrobés réintroduits à 20% dans formules.', AppColors.primary),
          ]),
          const SizedBox(height: 32),
          Container(padding: EdgeInsets.all(context.isMobile ? 20 : 28), decoration: BoxDecoration(color: AppColors.surfaceContainerLow, borderRadius: BorderRadius.circular(20)), child: Row(children: [
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Témoignage — Compagnon coffreur', style: AppTypography.headlineMd.copyWith(color: AppColors.onSurface)),
              const SizedBox(height: 8),
              Text('« Chez MIKA, j’ai appris le coffrage précontraint du fly-over. Aujourd’hui je forme à mon tour 5 jeunes de mon quartier d’Akébé. » — Thierry M., 26 ans', style: AppTypography.bodyLg.copyWith(color: AppColors.onSurface, fontStyle: FontStyle.italic)),
              const SizedBox(height: 6),
              Text('— Campagne RSE 2025, Estuaire', style: AppTypography.bodySm.copyWith(color: AppColors.tertiary)),
            ])),
            if (!context.isMobile) const SizedBox(width: 20),
            if (!context.isMobile)
              ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset('assets/images/le groupe.jpg', width: 220, height: 160, fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Image.network('https://images.unsplash.com/photo-1521737711867-e3b97375f902?w=400', width: 220, height: 160, fit: BoxFit.cover))),
          ])),
          const SizedBox(height: 32),
          Container(padding: const EdgeInsets.all(20), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), border: Border.all(color: const Color(0xFFE2E8F0))), child: Column(children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text('Objectifs RSE 2025-2026', style: AppTypography.headlineMd.copyWith(color: AppColors.onSurface)), Text('Suivi trimestriel', style: AppTypography.labelSm.copyWith(color: AppColors.tertiary))]),
            const SizedBox(height: 16),
            _obj('Taux gabonisation', 0.95, '95%'),
            const SizedBox(height: 12),
            _obj('Heures formation / an', 0.80, '40 000 h'),
            const SizedBox(height: 12),
            _obj('Réduction CO₂ enrobés tièdes', 0.62, '-15%'),
          ])),
        ]))),
      ]),
    );
  }

  Widget _rseCard(IconData i, String t, String d, Color c) => Container(padding: const EdgeInsets.all(20), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)]), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Container(width: 48, height: 48, decoration: BoxDecoration(color: c, borderRadius: BorderRadius.circular(12)), child: Icon(i, color: Colors.white)), const SizedBox(height: 12), Text(t, style: AppTypography.headlineSm.copyWith(color: AppColors.onSurface)), const SizedBox(height: 6), Text(d, style: AppTypography.bodySm.copyWith(color: AppColors.tertiary))]));
  Widget _obj(String t, double v, String label) => Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text(t, style: AppTypography.labelMd.copyWith(color: AppColors.onSurface)), Text(label, style: AppTypography.labelLg.copyWith(color: AppColors.primary, fontWeight: FontWeight.w800))]), const SizedBox(height: 6), ClipRRect(borderRadius: BorderRadius.circular(99), child: LinearProgressIndicator(value: v, minHeight: 8, backgroundColor: AppColors.surfaceContainer, valueColor: const AlwaysStoppedAnimation(AppColors.primaryContainer)) )]);
}
