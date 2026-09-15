import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/widgets/app_footer.dart';
import '../../core/widgets/section_header.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/responsive/responsive.dart';

class CarrieresPage extends StatelessWidget {
  const CarrieresPage({super.key});
  @override
  Widget build(BuildContext context) {
    final offers = [
      {'title': 'Conducteur de travaux — Routes', 'loc': 'Libreville / Owendo', 'type': 'CDI', 'exp': '5 ans min', 'desc': 'Pilotage chantiers enrobés, coordination équipes 30+ compagnons.'},
      {'title': 'Chef d’atelier Centrale d’Enrobés', 'loc': 'Owendo', 'type': 'CDI', 'exp': '3 ans', 'desc': 'Conduite centrale 160 T/h, formulation BBME/BBTM, contrôle labo.'},
      {'title': 'Opérateur Niveleuse / Compacteur', 'loc': 'Estuaire & Owendo Bypass', 'type': 'CDD → CDI', 'exp': 'CACES', 'desc': 'Mise en œuvre couche de forme et réglage fin altimétrie.'},
      {'title': 'Ingénieur Géotechnique', 'loc': 'Owendo (labo)', 'type': 'CDI', 'exp': 'Bac+5', 'desc': 'Études sols, dimensionnement chaussées, essais pressiométriques.'},
      {'title': 'Coffreur Ferrailleur — Ouvrages d’Art', 'loc': 'Jardin Botanique Fly-over', 'type': 'CDI', 'exp': '3 ans', 'desc': 'Coffrage précontraint, ferraillage tabliers 32 m.'},
      {'title': 'Responsable HSE Chantier', 'loc': 'Multi-sites', 'type': 'CDI', 'exp': '5 ans', 'desc': 'Animation HSE, audits, formation EPI, zéro accident.'},
    ];
    return PageScaffold(
      child: Column(children: [
        Container(width: double.infinity, color: AppColors.primaryContainer, padding: EdgeInsets.symmetric(horizontal: context.contentPadding, vertical: 40), child: ResponsiveContainer(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Carrières'.toUpperCase(), style: AppTypography.labelSm.copyWith(color: Colors.white.withOpacity(0.85))),
          const SizedBox(height: 8),
          Text('Recrutement BTP &\nIntégration Colas Gabon', style: (context.isMobile ? AppTypography.displayLgMobile : AppTypography.displayLg).copyWith(color: Colors.white)),
          const SizedBox(height: 12),
          Text('120+ postes ouverts : rejoignez le N°1 du BTP gabonais. 95% d’emplois gabonais, formation interne, parc engins intégré.', style: AppTypography.bodyXl.copyWith(color: Colors.white.withOpacity(0.9))),
          const SizedBox(height: 16),
          Wrap(spacing: 8, children: [Chip(label: Text('1 500+ collaborateurs', style: AppTypography.labelSm.copyWith(color: Colors.white)), backgroundColor: Colors.white.withOpacity(0.15)), Chip(label: Text('200 jeunes formés/an', style: AppTypography.labelSm.copyWith(color: Colors.white)), backgroundColor: Colors.white.withOpacity(0.15))]),
          const SizedBox(height: 16),
          ElevatedButton(onPressed: () {}, style: ElevatedButton.styleFrom(backgroundColor: Colors.white, foregroundColor: AppColors.primaryContainer), child: const Text('Portail E-Recrutement Colas Gabon')),
        ]))),
        Padding(padding: EdgeInsets.symmetric(horizontal: context.contentPadding, vertical: 28), child: ResponsiveContainer(child: Column(children: [
          ResponsiveGrid(desktopCols: 4, tabletCols: 2, mobileCols: 2, gap: 16, children: const [
            StatCard(label: 'Postes ouverts', value: '120+', desc: 'CDI & CDD → CDI sur tout le Gabon.', icon: Icons.work),
            StatCard(label: 'Gabonisation', value: '95%', desc: 'Emplois gabonais, transfert savoir-faire.', icon: Icons.flag),
            StatCard(label: 'Formés / an', value: '200', desc: 'Compagnonnage coffrage, engins, HSE.', icon: Icons.school),
            StatCard(label: 'Parc engins', value: '300+', desc: 'Pelles, niveleuses, compacteurs.', icon: Icons.construction),
          ]),
          const SizedBox(height: 28),
          SectionHeader(eyebrow: 'Offres actives', title: 'Postes à pourvoir immédiatement', subtitle: 'Candidature en 2 minutes — CV + lettre, réponse sous 7 jours.', eyebrowColor: AppColors.primaryContainer),
          const SizedBox(height: 16),
          ...offers.map((o) => _offer(o, context)),
          const SizedBox(height: 20),
          Container(padding: const EdgeInsets.all(20), decoration: BoxDecoration(color: AppColors.surfaceContainerLow, borderRadius: BorderRadius.circular(16)), child: Row(children: [
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Candidature spontanée', style: AppTypography.headlineSm.copyWith(color: AppColors.onSurface)), const SizedBox(height: 6), Text('Vous ne trouvez pas votre poste ? Envoyez-nous votre CV : nous conservons chaque candidature 12 mois.', style: AppTypography.bodySm.copyWith(color: AppColors.tertiary))])),
            const SizedBox(width: 16),
            ElevatedButton(onPressed: () => context.go('/contact'), child: const Text('Envoyer CV')),
          ])),
        ]))),
      ]),
    );
  }

  Widget _offer(Map<String, String> o, BuildContext context) => Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: const Color(0xFFE2E8F0))),
        child: Row(children: [
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(o['title']!, style: AppTypography.headlineSm.copyWith(color: AppColors.onSurface, fontSize: 16)),
            const SizedBox(height: 4),
            Wrap(spacing: 8, children: [
              _tag(o['loc']!, Icons.location_on),
              _tag(o['type']!, Icons.schedule),
              _tag(o['exp']!, Icons.workspace_premium),
            ]),
            const SizedBox(height: 6),
            Text(o['desc']!, style: AppTypography.bodySm.copyWith(color: AppColors.tertiary)),
          ])),
          const SizedBox(width: 12),
          ElevatedButton(onPressed: () => context.go('/contact'), child: const Text('Postuler')),
        ]),
      );

  Widget _tag(String t, IconData i) => Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4), decoration: BoxDecoration(color: AppColors.surfaceContainer, borderRadius: BorderRadius.circular(6)), child: Row(mainAxisSize: MainAxisSize.min, children: [Icon(i, size: 12, color: AppColors.tertiary), const SizedBox(width: 4), Text(t, style: AppTypography.labelSm.copyWith(color: AppColors.tertiary, fontSize: 10))]));
}
