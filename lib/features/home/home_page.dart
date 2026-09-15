import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/widgets/app_footer.dart';
import '../../core/widgets/app_header.dart';
import '../../core/widgets/section_header.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/responsive/responsive.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      child: Column(children: [
        _hero(context),
        _stats(context),
        _infoTravaux(context),
        _tournant(context),
        _grandsChantiers(context),
        _poles(context),
        _ctaContact(context),
      ]),
    );
  }

  Widget _hero(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.onSurface,
      child: Stack(children: [
        // background image
        Positioned.fill(child: Opacity(opacity: 0.28, child: Image.network('https://images.unsplash.com/photo-1504307651254-35680f356dfd?w=1600', fit: BoxFit.cover, errorBuilder: (_, __, ___) => Container(color: AppColors.onSurface)))),
        Container(
          decoration: const BoxDecoration(gradient: LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [Color(0xFF0B1C30), Color(0xE60B1C30), Colors.transparent])),
          padding: EdgeInsets.symmetric(horizontal: context.contentPadding, vertical: context.isMobile ? 32 : 64),
          child: ResponsiveContainer(
            child: context.isMobile ? _heroMobile(context) : _heroDesktop(context),
          ),
        ),
      ]),
    );
  }

  Widget _heroDesktop(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Expanded(flex: 7, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6), decoration: BoxDecoration(color: Colors.white.withOpacity(0.08), borderRadius: BorderRadius.circular(99)), child: Row(mainAxisSize: MainAxisSize.min, children: [Container(width: 8, height: 8, decoration: const BoxDecoration(color: AppColors.primaryContainer, shape: BoxShape.circle)), const SizedBox(width: 8), Text('Holding ACK S.A. • Leadership d’État'.toUpperCase(), style: AppTypography.labelSm.copyWith(color: AppColors.primaryFixed, fontSize: 10))])),
        const SizedBox(height: 16),
        Text('Le Bâtisseur N°1 des Grandes Infrastructures du Gabon', style: AppTypography.displayLg.copyWith(color: Colors.white)),
        const SizedBox(height: 14),
        Text('Filiale de la Holding ACK S.A. | Acteur souverain de la modernisation urbaine et du développement économique national sous la vision de l’essor national.', style: AppTypography.bodyXl.copyWith(color: AppColors.surfaceDim)),
        const SizedBox(height: 16),
        Container(padding: const EdgeInsets.all(12), decoration: BoxDecoration(color: Colors.white.withOpacity(0.06), borderRadius: BorderRadius.circular(12)), child: Row(children: [const Icon(Icons.verified, color: AppColors.primaryContainer, size: 20), const SizedBox(width: 8), Expanded(child: Text('Programme Estuaire (100 Mds FCFA) • Owendo Bypass 14 km (60 Mds) • Actifs Colas Gabon intégrés', style: AppTypography.labelMd.copyWith(color: Colors.white)))])),
        const SizedBox(height: 20),
        Wrap(spacing: 12, runSpacing: 12, children: [
          ElevatedButton.icon(onPressed: () => context.go('/chantiers'), icon: const Icon(Icons.arrow_forward, size: 18), label: const Text('Découvrir nos Grands Chantiers')),
          FilledButton.icon(onPressed: () => context.go('/groupe'), icon: const Icon(Icons.history_edu, size: 18), label: const Text('L’Opération Colas Gabon')),
          TextButton.icon(onPressed: () => context.go('/carrieres'), icon: const Icon(Icons.group_add, color: AppColors.primaryContainer), label: Text('Recrutement massif (120+ postes)', style: AppTypography.labelLg.copyWith(color: AppColors.primaryFixed))),
        ]),
      ])),
      const SizedBox(width: 32),
      Expanded(flex: 5, child: Container(padding: const EdgeInsets.all(20), decoration: BoxDecoration(color: Colors.white.withOpacity(0.10), borderRadius: BorderRadius.circular(16)), child: Column(children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Row(children: [Container(width: 40, height: 40, decoration: BoxDecoration(color: AppColors.primaryContainer.withOpacity(0.25), borderRadius: BorderRadius.circular(10)), child: const Icon(Icons.speed, color: AppColors.primaryFixedDim)), const SizedBox(width: 10), Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Flash Avancement Chantiers', style: AppTypography.headlineSm.copyWith(color: Colors.white, fontSize: 16)), Text('Données DGPW • Mars 2025', style: AppTypography.bodySm.copyWith(color: AppColors.surfaceDim))])]), Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4), decoration: BoxDecoration(color: AppColors.secondary.withOpacity(0.3), borderRadius: BorderRadius.circular(6)), child: Text('En Direct'.toUpperCase(), style: AppTypography.labelSm.copyWith(color: AppColors.secondaryFixed)))]),
        const SizedBox(height: 20),
        _metric('Programme Modernisation Estuaire (100 Mds)', 0.68, 'Giratoire 108 m & Fly-over Botanique : tabliers en cours d’assemblage.', AppColors.primaryContainer),
        const SizedBox(height: 16),
        _metric('Owendo Bypass Logistique (14 km)', 0.42, 'Décapage et terrassements massifs PK 04 au PK 09.', AppColors.secondaryContainer),
        const SizedBox(height: 16),
        Container(padding: const EdgeInsets.all(12), decoration: BoxDecoration(color: AppColors.onSurface.withOpacity(0.6), borderRadius: BorderRadius.circular(12)), child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [const Icon(Icons.warning_amber_rounded, color: AppColors.primaryContainer, size: 20), const SizedBox(width: 8), Expanded(child: Text('Alerte Nuit : Fermeture partielle Carrefour Charbonnages 22h00 – 05h00 pour pose d’enrobés haute densité.', style: AppTypography.bodySm.copyWith(color: AppColors.surfaceDim)))])),
      ]))),
    ]);
  }

  Widget _heroMobile(BuildContext context) => Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6), decoration: BoxDecoration(color: Colors.white.withOpacity(0.08), borderRadius: BorderRadius.circular(99)), child: Text('Holding ACK S.A. • Leadership d’État', style: AppTypography.labelSm.copyWith(color: AppColors.primaryFixed, fontSize: 10))),
    const SizedBox(height: 12),
    Text('Le Bâtisseur N°1 des Grandes Infrastructures du Gabon', style: AppTypography.displayLgMobile.copyWith(color: Colors.white)),
    const SizedBox(height: 12),
    Text('Filiale de la Holding ACK S.A. | Acteur souverain de la modernisation urbaine.', style: AppTypography.bodyLg.copyWith(color: AppColors.surfaceDim)),
    const SizedBox(height: 16),
    ElevatedButton.icon(onPressed: () => context.go('/chantiers'), icon: const Icon(Icons.arrow_forward), label: const Text('Découvrir nos Grands Chantiers')),
    const SizedBox(height: 20),
    Container(padding: const EdgeInsets.all(16), decoration: BoxDecoration(color: Colors.white.withOpacity(0.10), borderRadius: BorderRadius.circular(16)), child: Column(children: [
      _metric('Programme Modernisation Estuaire', 0.68, 'Giratoire 108 m & Fly-over Botanique', AppColors.primaryContainer),
      const SizedBox(height: 12),
      _metric('Owendo Bypass (14 km)', 0.42, 'Décapage PK 04 au PK 09', AppColors.secondaryContainer),
    ])),
  ]);

  Widget _metric(String label, double v, String desc, Color c) => Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Expanded(child: Text(label, style: AppTypography.labelMd.copyWith(color: Colors.white))), Text('${(v*100).toInt()}%', style: AppTypography.labelLg.copyWith(color: c, fontWeight: FontWeight.w800))]),
    const SizedBox(height: 6),
    ClipRRect(borderRadius: BorderRadius.circular(99), child: LinearProgressIndicator(value: v, minHeight: 8, backgroundColor: Colors.white.withOpacity(0.15), valueColor: AlwaysStoppedAnimation(c))),
    const SizedBox(height: 6),
    Text(desc, style: AppTypography.bodySm.copyWith(color: AppColors.surfaceDim)),
  ]);

  Widget _stats(BuildContext context) => Transform.translate(
    offset: const Offset(0, -24),
    child: Padding(padding: EdgeInsets.symmetric(horizontal: context.contentPadding), child: ResponsiveContainer(child: ResponsiveGrid(desktopCols: 4, tabletCols: 2, mobileCols: 2, gap: 16, children: [
      const StatCard(label: 'Volume Contractualisé', value: '160+ Mds', desc: 'FCFA engagés via la convention tripartite État / BGFIBank & Owendo Bypass.', icon: Icons.account_balance, accent: AppColors.primaryContainer),
      const StatCard(label: 'Rang National', value: 'N°1 BTP', desc: 'Constructeur routier et génie civil de référence suite à la reprise de Colas Gabon.', icon: Icons.verified, accent: AppColors.secondary),
      const StatCard(label: 'Capital Humain', value: '1 500+', desc: 'Ingénieurs, techniciens et compagnons gabonais mobilisés au quotidien.', icon: Icons.engineering, accent: AppColors.primaryContainer),
      const StatCard(label: 'Infrastructures d’Art', value: '15+ km', desc: 'De voiries urbaines rénovées, échangeur fly-over et giratoire géant de 108 m.', icon: Icons.timeline, accent: AppColors.secondary),
    ]))),
  );

  Widget _infoTravaux(BuildContext context) => Padding(padding: EdgeInsets.symmetric(horizontal: context.contentPadding, vertical: 24), child: ResponsiveContainer(child: Container(padding: const EdgeInsets.all(20), decoration: BoxDecoration(color: AppColors.surfaceContainerLow, borderRadius: BorderRadius.circular(16)), child: Column(children: [
    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Row(children: [Container(width: 10, height: 10, decoration: const BoxDecoration(color: AppColors.primary, shape: BoxShape.circle)), const SizedBox(width: 8), Text('Info Travaux & Déviations en Direct', style: AppTypography.headlineMd.copyWith(color: AppColors.onSurface))]),
      if (!context.isMobile) OutlinedButton.icon(onPressed: () {}, icon: const Icon(Icons.picture_as_pdf, size: 18), label: const Text('Télécharger les plans (PDF)')),
    ]),
    const SizedBox(height: 16),
    ResponsiveGrid(desktopCols: 3, tabletCols: 2, mobileCols: 1, children: [
      _deviationCard('Carrefour Charbonnages', 'PK 07', 'Travaux de nuit (21h-5h). Déviation active via voie secondaire élargie.', AppColors.primary, Icons.traffic),
      _deviationCard('Jardin Botanique / Fly-Over', 'Axe Triomphal', 'Pose des travées précontraintes. Circulation alternée avec encadrement.', AppColors.secondary, Icons.directions_car),
      _deviationCard('Axe Camp de Gaulle – Kalikak', 'Zone Nord', 'Terrassements profonds. Vitesse limitée à 30 km/h.', AppColors.primaryContainer, Icons.speed),
    ]),
  ]))));

  Widget _deviationCard(String title, String pk, String desc, Color c, IconData icon) => Container(padding: const EdgeInsets.all(14), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 8)]), child: Stack(children: [
    Positioned(left: 0, top: 0, bottom: 0, child: Container(width: 4, decoration: BoxDecoration(color: c, borderRadius: BorderRadius.circular(99)))),
    Padding(padding: const EdgeInsets.only(left: 12), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text(title.toUpperCase(), style: AppTypography.labelSm.copyWith(color: c)), Text(pk, style: AppTypography.labelSm.copyWith(color: AppColors.tertiary))]),
      const SizedBox(height: 6),
      Text(desc, style: AppTypography.bodySm.copyWith(color: AppColors.onSurface)),
      const SizedBox(height: 8),
      Row(children: [Icon(icon, size: 16, color: c), const SizedBox(width: 6), Expanded(child: Text('Fluidité : voir signalisation terrain', style: AppTypography.labelSm.copyWith(color: c, fontSize: 11)))]),
    ])),
  ]));

  Widget _tournant(BuildContext context) => Padding(padding: EdgeInsets.symmetric(horizontal: context.contentPadding, vertical: 16), child: ResponsiveContainer(child: Container(padding: EdgeInsets.all(context.isMobile ? 20 : 36), decoration: BoxDecoration(color: AppColors.surfaceContainerHigh, borderRadius: BorderRadius.circular(24)), child: context.isMobile ? _tournantMobile() : _tournantDesktop())));

  Widget _tournantDesktop() => Row(children: [
    Expanded(flex: 5, child: Column(children: [
      ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.asset('assets/images/accueil_tournant historique.jpg',
              height: 280, width: double.infinity, fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Image.network('https://images.unsplash.com/photo-1551836022-deb4988cc6c0?w=700', height: 280, fit: BoxFit.cover))),

      const SizedBox(height: 12),
      Wrap(spacing: 8, children: [ _chip('Souveraineté Économique', AppColors.primary), _chip('Excellence Technique', AppColors.secondary), _chip('Partenariat Public-Privé', AppColors.tertiary)]),
    ])),
    const SizedBox(width: 28),
    Expanded(flex: 7, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5), decoration: BoxDecoration(color: AppColors.secondary.withOpacity(0.12), borderRadius: BorderRadius.circular(6)), child: Text('Tournant Historique du BTP National'.toUpperCase(), style: AppTypography.labelSm.copyWith(color: AppColors.secondary))),
      const SizedBox(height: 10),
      Text('L’Émergence d’un Champion Gabonais des Grandes Infrastructures', style: AppTypography.displayMd.copyWith(color: AppColors.onSurface, fontSize: 32)),
      const SizedBox(height: 14),
      Container(padding: const EdgeInsets.all(16), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)), child: Column(children: [
        Text('« Avec le rachat de Colas Gabon par la Holding ACK S.A., MIKA SERVICES s’affirme comme le bras armé technique de la transformation de notre pays. »', style: AppTypography.bodyXl.copyWith(color: AppColors.onSurface, fontStyle: FontStyle.italic)),
        const SizedBox(height: 10),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('M. Alain-Claude Kouakoua', style: AppTypography.headlineSm.copyWith(color: AppColors.onSurface, fontSize: 16)), Text('PDG Holding ACK S.A. • Président de la FEG', style: AppTypography.bodySm.copyWith(color: AppColors.tertiary))]), const Icon(Icons.format_quote, color: AppColors.primaryContainer, size: 32)]),
      ])),
      const SizedBox(height: 14),
      Row(children: [
        Expanded(child: Container(padding: const EdgeInsets.all(14), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Row(children: [const Icon(Icons.factory, color: AppColors.secondary, size: 18), const SizedBox(width: 6), Text('Actifs Industriels Lourds', style: AppTypography.labelMd.copyWith(color: AppColors.secondary))]), const SizedBox(height: 6), Text('Absorption de 100% du parc engins de Colas Gabon.', style: AppTypography.bodySm.copyWith(color: AppColors.tertiary))] ))),
        const SizedBox(width: 12),
        Expanded(child: Container(padding: const EdgeInsets.all(14), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Row(children: [const Icon(Icons.groups, color: AppColors.primaryContainer, size: 18), const SizedBox(width: 6), Text('Maintien des Talents', style: AppTypography.labelMd.copyWith(color: AppColors.primaryContainer))]), const SizedBox(height: 6), Text('Pérennisation totale des emplois gabonais.', style: AppTypography.bodySm.copyWith(color: AppColors.tertiary))] ))),
      ]),
    ])),
  ]);

  Widget _tournantMobile() => Column(children: [
    ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.asset('assets/images/accueil_tournant historique.jpg',
            height: 200, width: double.infinity, fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => Image.network('https://images.unsplash.com/photo-1551836022-deb4988cc6c0?w=700', height: 200, fit: BoxFit.cover))),
    const SizedBox(height: 16),
    Text('L’Émergence d’un Champion Gabonais', style: AppTypography.headlineLg.copyWith(color: AppColors.onSurface)),
    const SizedBox(height: 10),
    Text('« Avec le rachat de Colas Gabon… » — M. Alain-Claude Kouakoua, PDG Holding ACK S.A.', style: AppTypography.bodyMd.copyWith(color: AppColors.onSurface, fontStyle: FontStyle.italic)),
  ]);

  Widget _chip(String t, Color c) => Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)), child: Text(t, style: AppTypography.labelSm.copyWith(color: c)));

  Widget _grandsChantiers(BuildContext context) => Padding(padding: EdgeInsets.symmetric(horizontal: context.contentPadding, vertical: 32), child: ResponsiveContainer(child: Column(children: [
    SectionHeader(eyebrow: 'Opérations Prioritaires de l’État', title: 'Grands Chantiers d’Envergure Nationale', subtitle: 'Suivi certifié conforme au cahier des charges du Ministère des Travaux Publics.', eyebrowColor: AppColors.primaryContainer),
    const SizedBox(height: 20),
    ResponsiveGrid(desktopCols: 3, tabletCols: 2, mobileCols: 1, children: [
      _projectCard('Modernisation Urbaine de l’Estuaire', 'Convention Tripartite État / BGFIBank', '100 Milliards FCFA', 0.68, 'En Travaux • 68%', AppColors.primaryContainer, 'assets/images/fly over jardin bpotanique.jpg', ['Giratoire 108 m & Fly-over Botanique', 'Carrefour Charbonnages', 'Akébé-Ndjongoni, Kango & Owendo'], context),
      _projectCard('Owendo Bypass — 14 km Stratégique', 'Groupement MIKA Services & NGE', '≈ 60 Milliards FCFA', 0.42, 'En Travaux • 42%', AppColors.secondary, 'assets/images/charbonnages.jpg', ['Raccordement ZES Nkok ↔ Port Owendo', 'Chaussée lourde haute résistance', 'Désengorgement corridor Sud'], context),
      _projectCard('Régénération Transgabonais & Moanda', 'Partenariat COMILOG / SETRAG', 'Mission Souveraine', 0.85, 'Phase Finale • 85%', AppColors.tertiary, 'https://images.unsplash.com/photo-1513828583688-c52646db42da?w=800', ['Stabilisation plateformes ferroviaires', 'Grands terrassements Bangombé', 'Sécurisation corridor manganèse'], context),
    ]),
    const SizedBox(height: 16),
    OutlinedButton.icon(onPressed: () => context.go('/chantiers'), icon: const Icon(Icons.arrow_forward), label: const Text('Voir tous les chantiers')),
  ])));

  Widget _projectCard(String title, String subtitle, String budget, double v, String badge, Color badgeColor, String img, List<String> bullets, BuildContext context) {
    Widget imageWidget = img.startsWith('assets/')
        ? Image.asset(img, height: 180, width: double.infinity, fit: BoxFit.cover, errorBuilder: (_, __, ___) => Container(height: 180, color: AppColors.surfaceDim))
        : Image.network(img, height: 180, width: double.infinity, fit: BoxFit.cover, errorBuilder: (_, __, ___) => Container(height: 180, color: AppColors.surfaceDim));
    return Container(
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 12)]),
      clipBehavior: Clip.antiAlias,
      child: Column(children: [
        Stack(children: [
          imageWidget,
        Positioned(top: 12, right: 12, child: Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5), decoration: BoxDecoration(color: badgeColor, borderRadius: BorderRadius.circular(6)), child: Text(badge, style: AppTypography.labelSm.copyWith(color: Colors.white, fontSize: 10)))),
        Positioned(bottom: 10, left: 10, child: Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5), decoration: BoxDecoration(color: AppColors.onSurface.withOpacity(0.82), borderRadius: BorderRadius.circular(99)), child: Text(budget, style: AppTypography.labelSm.copyWith(color: Colors.white)))),
      ]),
      Padding(padding: const EdgeInsets.all(16), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(subtitle.toUpperCase(), style: AppTypography.labelSm.copyWith(color: AppColors.secondary, fontSize: 10)),
        const SizedBox(height: 4),
        Text(title, style: AppTypography.headlineMd.copyWith(color: AppColors.onSurface, fontSize: 18)),
        const SizedBox(height: 10),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text('Progression certifiée', style: AppTypography.labelSm.copyWith(color: AppColors.tertiary)), Text('${(v*100).toInt()}%', style: AppTypography.labelLg.copyWith(color: AppColors.onSurface, fontWeight: FontWeight.w800))]),
        const SizedBox(height: 6),
        ProgressBar(value: v, color: badgeColor == AppColors.tertiary ? AppColors.primaryContainer : badgeColor),
        const SizedBox(height: 10),
        ...bullets.map((b) => Padding(padding: const EdgeInsets.only(bottom: 6), child: Row(children: [Icon(Icons.check_circle, size: 16, color: badgeColor == AppColors.secondary ? AppColors.secondary : AppColors.primaryContainer), const SizedBox(width: 6), Expanded(child: Text(b, style: AppTypography.bodySm.copyWith(color: AppColors.tertiary)))]))),
        const SizedBox(height: 12),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text('M.O. : État Gabonais', style: AppTypography.labelSm.copyWith(color: AppColors.tertiary, fontSize: 10)), TextButton(onPressed: () => context.go('/chantiers/estuaire'), child: Row(children: [Text('Fiche technique', style: AppTypography.labelMd.copyWith(color: AppColors.primary)), const Icon(Icons.chevron_right, size: 16, color: AppColors.primary)]))]),
      ])),
    ]),
  );
  }

  Widget _poles(BuildContext context) => Container(
    color: AppColors.surface,
    padding: EdgeInsets.symmetric(horizontal: context.contentPadding, vertical: 40),
    child: ResponsiveContainer(child: Column(children: [
      SectionHeader(eyebrow: 'Haute Ingénierie & Parcs Techniques', title: 'Nos Pôles d’Excellence Opérationnelle', subtitle: 'Une intégration verticale unique au Gabon, de la production de matériaux jusqu’à la livraison clé en main.', centered: true),
      const SizedBox(height: 24),
      ResponsiveGrid(desktopCols: 3, children: [
        _pole('Routes & Revêtements Bitumineux', 'Formulation et pose d’enrobés denses via nos centrales d’enrobage. Voiries urbaines et autoroutes nationales.', Icons.add_road, AppColors.primaryContainer, 'Centrale d’Owendo • 160 T/h'),
        _pole('Terrassements Massifs & Plateformes', 'Mouvements de terre à grande échelle, préparation de plateformes portuaires et minières.', Icons.landscape, AppColors.secondary, '+5 Millions m³ remués / an'),
        _pole('Génie Civil & Ouvrages d’Art', 'Fly-overs en béton précontraint, ponts mixtes, viaducs et giratoires de très grand gabarit.', Icons.view_in_ar, AppColors.onSurface, 'Fly-over Botanique (108 m)'),
        _pole('Hydraulique Urbaine & VRD Complexe', 'Assainissement, drainage profond et réseaux enterrés en zone équatoriale dense.', Icons.water_drop, AppColors.primary, 'Réseaux Owendo & Estuaire'),
        _pole('Production de Matériaux', 'Carrières, centrales à béton et à enrobés intégrées — souveraineté matériaux.', Icons.factory, AppColors.tertiary, 'Carrières & Centrales'),
        _pole('Logistique & Parc Engins', 'Parc engins lourds absorbé de Colas Gabon : pelles, compacteurs, niveleuses.', Icons.local_shipping, AppColors.primaryContainer, '1 500+ engins & compagnons'),
      ]),
    ])),
  );

  Widget _pole(String t, String d, IconData i, Color c, String meta) => Container(
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(color: AppColors.surfaceContainerLow, borderRadius: BorderRadius.circular(16)),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(width: 52, height: 52, decoration: BoxDecoration(color: c, borderRadius: BorderRadius.circular(12)), child: Icon(i, color: Colors.white, size: 26)),
      const SizedBox(height: 14),
      Text(t, style: AppTypography.headlineMd.copyWith(color: AppColors.onSurface, fontSize: 18)),
      const SizedBox(height: 6),
      Text(d, style: AppTypography.bodyMd.copyWith(color: AppColors.tertiary)),
      const SizedBox(height: 10),
      Row(children: [Text(meta, style: AppTypography.labelMd.copyWith(color: c == Colors.white ? AppColors.primary : c)), const SizedBox(width: 4), Icon(Icons.arrow_forward, size: 14, color: c == Colors.white ? AppColors.primary : c)]),
    ]),
  );

  Widget _ctaContact(BuildContext context) => Container(
    margin: EdgeInsets.symmetric(horizontal: context.contentPadding, vertical: 24),
    child: ResponsiveContainer(child: Container(padding: EdgeInsets.all(context.isMobile ? 20 : 32), decoration: BoxDecoration(gradient: const LinearGradient(colors: [AppColors.primaryContainer, AppColors.secondary]), borderRadius: BorderRadius.circular(20)), child: Row(children: [
      Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('Un projet d’infrastructure ? Parlons-en.', style: AppTypography.headlineLg.copyWith(color: Colors.white)),
        const SizedBox(height: 8),
        Text('De l’étude à la livraison clé en main, MIKA SERVICES mobilise son ingénierie souveraine et son parc intégré.', style: AppTypography.bodyLg.copyWith(color: Colors.white.withOpacity(0.9))),
      ])),
      const SizedBox(width: 20),
      ElevatedButton(onPressed: () => context.go('/contact'), style: ElevatedButton.styleFrom(backgroundColor: Colors.white, foregroundColor: AppColors.primary), child: const Text('Demander un devis')),
    ]))),
  );
}
