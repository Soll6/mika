import 'package:flutter/material.dart';
import '../../core/widgets/app_footer.dart';
import '../../core/widgets/section_header.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/responsive/responsive.dart';

class ActualitesPage extends StatelessWidget {
  const ActualitesPage({super.key});
  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      child: Column(children: [
        _hero(context),
        _filters(context),
        _grid(context),
        _newsletter(context),
      ]),
    );
  }

  Widget _hero(BuildContext context) => Container(
        width: double.infinity,
        color: AppColors.surfaceContainerLow,
        padding: EdgeInsets.symmetric(horizontal: context.contentPadding, vertical: 36),
        child: ResponsiveContainer(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Actualités & Presse'.toUpperCase(), style: AppTypography.labelSm.copyWith(color: AppColors.secondary)),
          const SizedBox(height: 8),
          Text('L’actualité du bâtisseur souverain', style: (context.isMobile ? AppTypography.displayMdMobile : AppTypography.displayMd).copyWith(color: AppColors.onSurface)),
          const SizedBox(height: 8),
          Text('Chantiers, nominations, RSE et vie du groupe — en direct du terrain.', style: AppTypography.bodyLg.copyWith(color: AppColors.tertiary)),
        ])),
      );

  Widget _filters(BuildContext context) => Padding(
        padding: EdgeInsets.symmetric(horizontal: context.contentPadding, vertical: 16),
        child: ResponsiveContainer(child: Wrap(spacing: 8, runSpacing: 8, children: ['Toutes', 'Chantiers', 'Groupe', 'RSE', 'Carrières', 'Presse'].map((e) => ChoiceChip(label: Text(e), selected: e == 'Toutes', onSelected: (_) {}, selectedColor: AppColors.primaryContainer, labelStyle: AppTypography.labelMd.copyWith(color: e == 'Toutes' ? Colors.white : AppColors.onSurface))).toList())),
      );

  Widget _grid(BuildContext context) {
    final articles = [
      {'cat': 'Chantiers', 'date': '12 Mars 2025', 'title': 'Fly-over Botanique : pose du premier tablier précontraint', 'img': 'https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?w=800', 'exc': 'Jalon majeur pour l’Estuaire : 32 m de tablier posés en 8h, circulation maintenue sur déviation.'},
      {'cat': 'Groupe', 'date': 'Avril 2026', 'title': 'Holding ACK S.A. finalise la reprise de Colas Gabon', 'img': 'https://images.unsplash.com/photo-1556761175-5973aa6160b6?w=800', 'exc': 'Opération historique : 100% des actifs, carrières et parc engins désormais gabonais.'},
      {'cat': 'RSE', 'date': '08 Mars 2025', 'title': '1 500 emplois gabonais : MIKA forme 200 jeunes compagnons', 'img': 'https://images.unsplash.com/photo-1521737711867-e3b97375f902?w=800', 'exc': 'Programme de compagnonnage avec le Ministère de l’Emploi : coffrage, ferraillage, conduite d’engins.'},
      {'cat': 'Chantiers', 'date': '02 Mars 2025', 'title': 'Owendo Bypass : terrassements PK04-PK09 à 42%', 'img': 'https://images.unsplash.com/photo-1504307651254-35680f356dfd?w=800', 'exc': 'Décapage massif et remblais techniques sur 5 km, trafic grumiers maintenu.'},
      {'cat': 'Presse', 'date': '28 Fév 2025', 'title': '160 Mds FCFA : la convention Estuaire-Owendo signée', 'img': 'https://images.unsplash.com/photo-1497366811353-253cc3d1b61b?w=800', 'exc': 'État, BGFIBank et groupement MIKA-NGE scellent le plus grand programme routier depuis 10 ans.'},
      {'cat': 'Carrières', 'date': '15 Fév 2025', 'title': '120 postes ouverts : rejoignez le N°1 du BTP', 'img': 'https://images.unsplash.com/photo-1521791136064-7986c2920216?w=800', 'exc': 'Ingénieurs, conducteurs de travaux, opérateurs engins : postulez sur le portail Colas Gabon.'},
    ];
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.contentPadding, vertical: 16),
      child: ResponsiveContainer(
        child: Column(children: [
          ResponsiveGrid(desktopCols: 3, tabletCols: 2, mobileCols: 1, gap: 16, children: articles.map((a) => _article(a, context)).toList()),
          const SizedBox(height: 20),
          OutlinedButton(onPressed: () {}, child: const Text('Charger plus d’actualités')),
        ]),
      ),
    );
  }

  Widget _article(Map<String, String> a, BuildContext context) => Container(
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 12)]),
        clipBehavior: Clip.antiAlias,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Stack(children: [Image.network(a['img']!, height: 180, width: double.infinity, fit: BoxFit.cover, errorBuilder: (_, __, ___) => Container(height: 180, color: AppColors.surfaceDim)), Positioned(top: 12, left: 12, child: Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5), decoration: BoxDecoration(color: AppColors.onSurface.withOpacity(0.85), borderRadius: BorderRadius.circular(6)), child: Text(a['cat']!.toUpperCase(), style: AppTypography.labelSm.copyWith(color: Colors.white, fontSize: 10))))]),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(a['date']!, style: AppTypography.labelSm.copyWith(color: AppColors.tertiary, fontSize: 10)),
              const SizedBox(height: 6),
              Text(a['title']!, style: AppTypography.headlineSm.copyWith(color: AppColors.onSurface, fontSize: 17)),
              const SizedBox(height: 6),
              Text(a['exc']!, style: AppTypography.bodySm.copyWith(color: AppColors.tertiary)),
              const SizedBox(height: 10),
              InkWell(onTap: () {}, child: Row(children: [Text('Lire l’article', style: AppTypography.labelMd.copyWith(color: AppColors.primary)), const SizedBox(width: 4), const Icon(Icons.arrow_forward, size: 14, color: AppColors.primary)])),
            ]),
          ),
        ]),
      );

  Widget _newsletter(BuildContext context) => Container(
        color: AppColors.onSurface,
        padding: EdgeInsets.symmetric(horizontal: context.contentPadding, vertical: 28),
        child: ResponsiveContainer(
          child: Row(children: [
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Restez informé', style: AppTypography.headlineLg.copyWith(color: Colors.white)), const SizedBox(height: 6), Text('Recevez les flash chantiers et communiqués officiels.', style: AppTypography.bodyMd.copyWith(color: AppColors.surfaceDim))])),
            const SizedBox(width: 20),
            SizedBox(width: context.isMobile ? double.infinity : 360, child: Row(children: [Expanded(child: TextField(decoration: InputDecoration(hintText: 'Votre email', filled: true, fillColor: Colors.white, border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))))), const SizedBox(width: 10), ElevatedButton(onPressed: () {}, child: const Text('S’abonner'))])),
          ]),
        ),
      );
}
