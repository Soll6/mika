import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/widgets/app_footer.dart';
import '../../core/widgets/section_header.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/responsive/responsive.dart';

class ActivitesPage extends StatelessWidget {
  const ActivitesPage({super.key});
  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      child: Column(children: [
        _hero(context),
        _poles(context),
        _chaine(context),
        _capabilities(context),
        _cta(context),
      ]),
    );
  }

  Widget _hero(BuildContext context) => Container(
        width: double.infinity,
        color: AppColors.onSurface,
        padding: EdgeInsets.symmetric(horizontal: context.contentPadding, vertical: context.isMobile ? 32 : 56),
        child: ResponsiveContainer(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Nos Activités'.toUpperCase(), style: AppTypography.labelSm.copyWith(color: AppColors.primaryFixed, letterSpacing: 1.4)),
            const SizedBox(height: 8),
            Text('Travaux Publics &\nIngénierie de Haute Précision', style: (context.isMobile ? AppTypography.displayLgMobile : AppTypography.displayLg).copyWith(color: Colors.white)),
            const SizedBox(height: 12),
            Text('Six pôles d’excellence intégrés — de la formulation des enrobés à la livraison clé en main d’ouvrages d’art monumentaux. Une chaîne de valeur souveraine unique au Gabon.', style: AppTypography.bodyXl.copyWith(color: AppColors.surfaceDim)),
            const SizedBox(height: 20),
            Wrap(spacing: 10, children: [
              _badge('Centrale d’enrobés 160 T/h', AppColors.primaryContainer),
              _badge('5 M m³ remués/an', AppColors.secondaryContainer),
              _badge('Giratoire 108 m', Colors.white),
            ]),
          ]),
        ),
      );

  Widget _badge(String t, Color c) => Container(padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6), decoration: BoxDecoration(color: c.withOpacity(0.15), borderRadius: BorderRadius.circular(99), border: Border.all(color: c.withOpacity(0.3))), child: Text(t, style: AppTypography.labelSm.copyWith(color: Colors.white)));

  Widget _poles(BuildContext context) => Padding(
        padding: EdgeInsets.symmetric(horizontal: context.contentPadding, vertical: 32),
        child: ResponsiveContainer(
          child: Column(children: [
            const SectionHeader(eyebrow: 'Pôles d’excellence', title: 'Une intégration verticale unique', subtitle: 'De la production de matériaux à la mise en œuvre sur chantier, maîtrise totale de la qualité.', centered: true),
            const SizedBox(height: 24),
            ResponsiveGrid(desktopCols: 3, tabletCols: 2, mobileCols: 1, gap: 16, children: [
              _pole('Routes & Revêtements', 'Formulation et pose d’enrobés denses, BBME et BBTM via nos centrales d’enrobage d’Owendo. Voiries urbaines et autoroutes.', Icons.add_road, AppColors.primaryContainer, 'Centrale 160 T/h • BBME haute performance'),
              _pole('Terrassements Massifs', 'Mouvements de terre à grande échelle, décapage, remblais techniques, plateformes portuaires et minières.', Icons.landscape, AppColors.secondary, '+5 Millions m³ / an'),
              _pole('Génie Civil & Ouvrages d’Art', 'Fly-overs en béton précontraint, ponts mixtes acier-béton, viaducs, giratoires de grand gabarit.', Icons.account_balance, AppColors.onSurface, 'Fly-over Botanique 108 m'),
              _pole('Hydraulique & VRD', 'Assainissement, drainage profond, réseaux enterrés et voiries diverses en zone équatoriale.', Icons.water_drop, AppColors.primary, 'Réseaux Owendo & Estuaire'),
              _pole('Production de Matériaux', 'Carrières, centrales à béton et à enrobés intégrées — souveraineté matériaux absolue.', Icons.factory, AppColors.tertiary, 'Carrières & Centrales intégrées'),
              _pole('Logistique & Parc Engins', 'Parc engins lourds absorbé de Colas Gabon : pelles, compacteurs, niveleuses, camions.', Icons.local_shipping, AppColors.primaryContainer, '1 500+ compagnons mobilisés'),
            ]),
          ]),
        ),
      );

  Widget _pole(String t, String d, IconData i, Color c, String meta) => Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(color: AppColors.surfaceContainerLow, borderRadius: BorderRadius.circular(AppSpacing.radiusLg)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(width: 52, height: 52, decoration: BoxDecoration(color: c, borderRadius: BorderRadius.circular(12)), child: Icon(i, color: Colors.white, size: 26)),
          const SizedBox(height: 12),
          Text(t, style: AppTypography.headlineMd.copyWith(color: AppColors.onSurface, fontSize: 18)),
          const SizedBox(height: 6),
          Text(d, style: AppTypography.bodyMd.copyWith(color: AppColors.tertiary)),
          const SizedBox(height: 10),
          Row(children: [Text(meta, style: AppTypography.labelMd.copyWith(color: c)), const SizedBox(width: 4), Icon(Icons.arrow_forward, size: 14, color: c)]),
        ]),
      );

  Widget _chaine(BuildContext context) => Container(
        color: AppColors.surfaceContainerHigh.withOpacity(0.4),
        padding: EdgeInsets.symmetric(horizontal: context.contentPadding, vertical: 32),
        child: ResponsiveContainer(
          child: Column(children: [
            const SectionHeader(eyebrow: 'Chaîne de valeur', title: 'De l’étude à la livraison', subtitle: 'Quatre étapes maîtrisées en interne pour garantir délais, qualité et conformité.', centered: true),
            const SizedBox(height: 24),
            ResponsiveGrid(desktopCols: 4, tabletCols: 2, mobileCols: 1, gap: 16, children: [
              _step('01', 'Études & Ingénierie', 'Bureau d’études intégré, plans d’exécution, dimensionnement géotechnique.', Icons.architecture),
              _step('02', 'Production', 'Carrières, centrales béton/enrobés : matériaux contrôlés à la source.', Icons.precision_manufacturing),
              _step('03', 'Mise en œuvre', 'Terrassements, pose d’enrobés, béton précontraint par équipes internes.', Icons.construction),
              _step('04', 'Contrôle Qualité', 'Laboratoire, essais, certification DGPW et remise d’ouvrage.', Icons.verified),
            ]),
          ]),
        ),
      );

  Widget _step(String n, String t, String d, IconData i) => Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 12)]),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6), decoration: BoxDecoration(color: AppColors.primaryContainer, borderRadius: BorderRadius.circular(8)), child: Text(n, style: AppTypography.labelSm.copyWith(color: Colors.white))), const Spacer(), Icon(i, color: AppColors.secondary)]),
          const SizedBox(height: 12),
          Text(t, style: AppTypography.headlineSm.copyWith(color: AppColors.onSurface)),
          const SizedBox(height: 6),
          Text(d, style: AppTypography.bodySm.copyWith(color: AppColors.tertiary)),
        ]),
      );

  Widget _capabilities(BuildContext context) => Padding(
        padding: EdgeInsets.symmetric(horizontal: context.contentPadding, vertical: 32),
        child: ResponsiveContainer(
          child: Container(
            padding: EdgeInsets.all(context.isMobile ? 20 : 28),
            decoration: BoxDecoration(color: AppColors.onSurface, borderRadius: BorderRadius.circular(20)),
            child: Row(children: [
              if (!context.isMobile)
                Expanded(
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset('assets/images/charbonnages.jpg',
                            height: 260, fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) => Image.network('https://images.unsplash.com/photo-1504307651254-35680f356dfd?w=700', height: 260, fit: BoxFit.cover)))),
              if (!context.isMobile) const SizedBox(width: 24),
              Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('Capacités industrielles souveraines', style: AppTypography.headlineLg.copyWith(color: Colors.white)),
                const SizedBox(height: 12),
                _capRow('160 T/h', 'Centrale d’enrobés Owendo'),
                _capRow('5 M m³', 'Terrassements / an'),
                _capRow('108 m', 'Diamètre giratoire géant'),
                _capRow('1 500+', 'Compagnons & ingénieurs gabonais'),
                const SizedBox(height: 16),
                ElevatedButton(onPressed: () {}, child: const Text('Télécharger la plaquette capacités (PDF)')),
              ])),
            ]),
          ),
        ),
      );

  Widget _capRow(String v, String l) => Padding(padding: const EdgeInsets.only(bottom: 8), child: Row(children: [Text(v, style: AppTypography.headlineMd.copyWith(color: AppColors.primaryFixed)), const SizedBox(width: 10), Text(l, style: AppTypography.bodyMd.copyWith(color: AppColors.surfaceDim))]));

  Widget _cta(BuildContext context) => Padding(
        padding: EdgeInsets.symmetric(horizontal: context.contentPadding, vertical: 24),
        child: ResponsiveContainer(
          child: Row(children: [
            Expanded(child: Text('Prêt à concrétiser votre projet d’infrastructure ?', style: AppTypography.headlineLg.copyWith(color: AppColors.onSurface))),
            const SizedBox(width: 20),
            ElevatedButton(onPressed: () => context.go('/chantiers'), child: const Text('Voir nos chantiers')),
            const SizedBox(width: 10),
            OutlinedButton(onPressed: () => context.go('/contact'), child: const Text('Nous contacter')),
          ]),
        ),
      );
}
