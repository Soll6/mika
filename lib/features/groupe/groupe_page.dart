import 'package:flutter/material.dart';
import '../../core/widgets/app_footer.dart';
import '../../core/widgets/section_header.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/responsive/responsive.dart';

class GroupePage extends StatelessWidget {
  const GroupePage({super.key});
  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      child: Column(children: [
        _hero(context),
        _holding(context),
        _timeline(context),
        _gouvernance(context),
        _chiffres(context),
      ]),
    );
  }

  Widget _hero(BuildContext context) => Container(
        width: double.infinity,
        color: AppColors.onSurface,
        padding: EdgeInsets.symmetric(horizontal: context.contentPadding, vertical: 48),
        child: ResponsiveContainer(
          child: context.isMobile
              ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text('Holding ACK S.A.'.toUpperCase(), style: AppTypography.labelSm.copyWith(color: AppColors.primaryFixed)),
                  const SizedBox(height: 8),
                  Text('Le Groupe — Bâtisseur\nSouverain du Gabon', style: AppTypography.displayLgMobile.copyWith(color: Colors.white)),
                  const SizedBox(height: 12),
                  Text('MIKA SERVICES, filiale BTP de la Holding ACK S.A., incarne la souveraineté technique et industrielle du Gabon.', style: AppTypography.bodyLg.copyWith(color: AppColors.surfaceDim)),
                ])
              : Row(children: [
                  Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text('Holding ACK S.A. • N°1 du BTP au Gabon'.toUpperCase(), style: AppTypography.labelSm.copyWith(color: AppColors.primaryFixed)),
                    const SizedBox(height: 10),
                    Text('Le Groupe —\nBâtisseur Souverain du Gabon', style: AppTypography.displayLg.copyWith(color: Colors.white)),
                    const SizedBox(height: 14),
                    Text('MIKA SERVICES, filiale BTP de la Holding ACK S.A. présidée par M. Alain-Claude Kouakoua, incarne la souveraineté technique et industrielle du Gabon. Intégration verticale, excellence opérationnelle, ancrage régalien.', style: AppTypography.bodyXl.copyWith(color: AppColors.surfaceDim)),
                    const SizedBox(height: 16),
                    Wrap(spacing: 8, children: [
                      Chip(label: Text('20+ ans d’expertise', style: AppTypography.labelSm.copyWith(color: Colors.white)), backgroundColor: AppColors.primaryContainer),
                      Chip(label: Text('1 500+ collaborateurs', style: AppTypography.labelSm.copyWith(color: Colors.white)), backgroundColor: AppColors.secondary),
                    ]),
                  ])),
                  const SizedBox(width: 32),
                  Expanded(
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset('assets/images/le groupe.jpg',
                              height: 340, fit: BoxFit.cover,
                              errorBuilder: (_, __, ___) => Image.network('https://images.unsplash.com/photo-1556761175-5973aa6160b6?w=700', height: 340, fit: BoxFit.cover)))),
                ]),
        ),
      );

  Widget _holding(BuildContext context) => Padding(
        padding: EdgeInsets.symmetric(horizontal: context.contentPadding, vertical: 32),
        child: ResponsiveContainer(
          child: Column(children: [
            const SectionHeader(eyebrow: 'Vision & Gouvernance', title: 'Une holding souveraine au service de l’émergence', subtitle: 'La Holding ACK S.A. fédère industrie, BTP et services pour bâtir le Gabon de demain.', centered: true),
            const SizedBox(height: 24),
            Container(
              padding: EdgeInsets.all(context.isMobile ? 20 : 28),
              decoration: BoxDecoration(color: AppColors.surfaceContainerLow, borderRadius: BorderRadius.circular(20)),
              child: context.isMobile
                  ? Column(children: [_holdingCard('MIKA SERVICES', 'BTP & Infrastructures', 'Cœur opérationnel du groupe : routes, ouvrages d’art, terrassements.', AppColors.primaryContainer, Icons.construction), const SizedBox(height: 12), _holdingCard('COLAS GABON (intégrée)', 'Parc & Carrières', 'Actifs industriels lourds, centrales et carrières désormais 100% gabonais.', AppColors.secondary, Icons.factory), const SizedBox(height: 12), _holdingCard('ACK SERVICES', 'Support & Logistique', 'Fonctions support, achats, RH et finance du groupe.', AppColors.tertiary, Icons.support)])
                  : Row(children: [
                      Expanded(child: _holdingCard('MIKA SERVICES', 'BTP & Infrastructures', 'Cœur opérationnel du groupe : routes, ouvrages d’art, terrassements.', AppColors.primaryContainer, Icons.construction)),
                      const SizedBox(width: 16),
                      Expanded(child: _holdingCard('COLAS GABON (intégrée)', 'Parc & Carrières', 'Actifs industriels lourds, centrales et carrières désormais 100% gabonais.', AppColors.secondary, Icons.factory)),
                      const SizedBox(width: 16),
                      Expanded(child: _holdingCard('ACK SERVICES', 'Support & Logistique', 'Fonctions support, achats, RH et finance du groupe.', AppColors.tertiary, Icons.support)),
                    ]),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), border: Border.all(color: const Color(0xFFE2E8F0))),
              child: Row(children: [
                Container(width: 64, height: 64, decoration: BoxDecoration(color: AppColors.onSurface, borderRadius: BorderRadius.circular(12)), child: const Icon(Icons.person, color: Colors.white, size: 32)),
                const SizedBox(width: 16),
                Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text('M. Alain-Claude Kouakoua', style: AppTypography.headlineMd.copyWith(color: AppColors.onSurface)),
                  Text('Président Directeur Général — Holding ACK S.A. • Président de la Fédération des Entreprises du Gabon (FEG)', style: AppTypography.bodySm.copyWith(color: AppColors.tertiary)),
                  const SizedBox(height: 6),
                  Text('« Avec l’intégration de Colas Gabon, nous affirmons la capacité du capital gabonais à porter les plus grands projets de la nation, aux standards internationaux les plus rigoureux. »', style: AppTypography.bodyMd.copyWith(color: AppColors.onSurface, fontStyle: FontStyle.italic)),
                ])),
              ]),
            ),
          ]),
        ),
      );

  Widget _holdingCard(String t, String s, String d, Color c, IconData i) => Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(width: 48, height: 48, decoration: BoxDecoration(color: c, borderRadius: BorderRadius.circular(12)), child: Icon(i, color: Colors.white)),
          const SizedBox(height: 12),
          Text(t, style: AppTypography.headlineSm.copyWith(color: AppColors.onSurface)),
          Text(s.toUpperCase(), style: AppTypography.labelSm.copyWith(color: c, fontSize: 10)),
          const SizedBox(height: 8),
          Text(d, style: AppTypography.bodySm.copyWith(color: AppColors.tertiary)),
        ]),
      );

  Widget _timeline(BuildContext context) => Container(
        color: AppColors.surfaceContainerHigh.withOpacity(0.35),
        padding: EdgeInsets.symmetric(horizontal: context.contentPadding, vertical: 32),
        child: ResponsiveContainer(
          child: Column(children: [
            const SectionHeader(eyebrow: 'Histoire', title: 'Tournant historique : l’opération Colas Gabon', centered: true),
            const SizedBox(height: 20),
            ResponsiveGrid(desktopCols: 4, tabletCols: 2, mobileCols: 1, gap: 16, children: [
              _tl('2005', 'Création MIKA SERVICES', 'Fondation du groupe, premiers marchés de voiries à Libreville.', true),
              _tl('2018', 'Montée en puissance', 'Acquisition capacités terrassements massifs, labo qualité.', true),
              _tl('2024', 'Convention 160 Mds', 'Signature Estuaire 100 Mds + Owendo Bypass 60 Mds.', true),
              _tl('Avril 2026', 'Reprise Colas Gabon', 'Intégration 100% actifs, parc engins et carrières.', true),
            ]),
          ]),
        ),
      );

  Widget _tl(String d, String t, String desc, bool done) => Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Row(children: [Container(width: 10, height: 10, decoration: BoxDecoration(color: done ? AppColors.success : AppColors.outlineVariant, shape: BoxShape.circle)), const SizedBox(width: 8), Text(d, style: AppTypography.labelSm.copyWith(color: done ? AppColors.success : AppColors.tertiary))]), const SizedBox(height: 8), Text(t, style: AppTypography.headlineSm.copyWith(color: AppColors.onSurface, fontSize: 16)), const SizedBox(height: 4), Text(desc, style: AppTypography.bodySm.copyWith(color: AppColors.tertiary))]),
      );

  Widget _gouvernance(BuildContext context) => Padding(
        padding: EdgeInsets.symmetric(horizontal: context.contentPadding, vertical: 32),
        child: ResponsiveContainer(
          child: Column(children: [
            const SectionHeader(eyebrow: 'Gouvernance', title: 'Exigence, éthique et conformité', subtitle: 'Marchés publics, HSE et qualité certifiée.'),
            const SizedBox(height: 16),
            ResponsiveGrid(desktopCols: 3, children: [
              _gov('Éthique & Conformité', 'Code d’éthique groupe, lutte anti-corruption, transparence marchés publics.', Icons.gavel),
              _gov('HSE & Sécurité', 'Zéro accident, équipements EPI, formation continue compagnons.', Icons.health_and_safety),
              _gov('Qualité & Labo', 'Laboratoire intégré, essais enrobés/béton, certification DGPW.', Icons.science),
            ]),
          ]),
        ),
      );

  Widget _gov(String t, String d, IconData i) => Container(padding: const EdgeInsets.all(20), decoration: BoxDecoration(color: AppColors.surfaceContainerLow, borderRadius: BorderRadius.circular(12)), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Icon(i, color: AppColors.secondary, size: 28), const SizedBox(height: 10), Text(t, style: AppTypography.headlineSm.copyWith(color: AppColors.onSurface)), const SizedBox(height: 6), Text(d, style: AppTypography.bodySm.copyWith(color: AppColors.tertiary))]));

  Widget _chiffres(BuildContext context) => Container(color: AppColors.onSurface, padding: EdgeInsets.symmetric(horizontal: context.contentPadding, vertical: 28), child: ResponsiveContainer(child: ResponsiveGrid(desktopCols: 4, tabletCols: 2, mobileCols: 2, gap: 16, children: const [
        StatCard(label: 'Volume', value: '160+ Mds', desc: 'FCFA contractualisés.', icon: Icons.account_balance, accent: AppColors.primaryContainer),
        StatCard(label: 'Collaborateurs', value: '1 500+', desc: 'Gabonais mobilisés.', icon: Icons.groups),
        StatCard(label: 'Parc engins', value: '300+', desc: 'Engins lourds intégrés.', icon: Icons.construction),
        StatCard(label: 'Centrales', value: '3', desc: 'Enrobés + béton.', icon: Icons.factory),
      ])));
}
