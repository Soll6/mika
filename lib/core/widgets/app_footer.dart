import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';
import '../theme/app_typography.dart';
import '../responsive/responsive.dart';
import 'app_header.dart';

class AppFooter extends StatelessWidget {
  const AppFooter({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.onSurface,
      padding: EdgeInsets.symmetric(horizontal: context.contentPadding, vertical: 40),
      child: ResponsiveContainer(
        child: Column(children: [
          // columns
          LayoutBuilder(builder: (ctx, c) {
            final isMobile = context.isMobile;
            return Wrap(spacing: 32, runSpacing: 32, children: [
              SizedBox(
                width: isMobile ? double.infinity : 320,
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Row(children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        'assets/icon/logo.png',
                        width: 40,
                        height: 40,
                        fit: BoxFit.contain,
                        errorBuilder: (_, __, ___) => Container(
                          width: 40,
                          height: 40,
                          color: AppColors.primaryContainer,
                          child: const Icon(Icons.apartment, color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text('MIKA SERVICES', style: AppTypography.labelLg.copyWith(color: Colors.white, fontWeight: FontWeight.w800)),
                      Text('Holding ACK S.A.', style: AppTypography.bodySm.copyWith(color: AppColors.surfaceDim)),
                    ]),
                  ]),
                  const SizedBox(height: 12),
                  Text('Le bâtisseur N°1 des grandes infrastructures du Gabon. Filiale de la Holding ACK S.A., acteur souverain de la modernisation urbaine.', style: AppTypography.bodySm.copyWith(color: AppColors.surfaceVariant)),
                  const SizedBox(height: 16),
                  Row(children: [
                    _social(Icons.language), _social(Icons.business), _social(Icons.share),
                  ]),
                ]),
              ),
              _col('Navigation', ['Accueil', 'Le Groupe', 'Nos Activités', 'Grands Chantiers'], ['/', '/groupe', '/activites', '/chantiers'], context),
              _col('Expertises', ['Routes & Enrobés', 'Terrassements', 'Ouvrages d’Art', 'Hydraulique & VRD'], null, context),
              SizedBox(
                width: isMobile ? double.infinity : 280,
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text('Contact Siège', style: AppTypography.labelLg.copyWith(color: Colors.white)),
                  const SizedBox(height: 10),
                  Text('Zone Industrielle d’Owendo, BP 1234 Libreville — Gabon', style: AppTypography.bodySm.copyWith(color: AppColors.surfaceVariant)),
                  const SizedBox(height: 8),
                  Text('+241 01 70 00 00 — contact@mikaservices.ga', style: AppTypography.bodySm.copyWith(color: Colors.white)),
                  const SizedBox(height: 16),
                  OutlinedButton(onPressed: () => context.go('/contact'), style: OutlinedButton.styleFrom(foregroundColor: Colors.white, side: const BorderSide(color: Colors.white)), child: const Text('Nous contacter')),
                ]),
              ),
            ]);
          }),
          const SizedBox(height: 32),
          Divider(color: Colors.white.withOpacity(0.12)),
          const SizedBox(height: 16),
          Wrap(alignment: WrapAlignment.spaceBetween, crossAxisAlignment: WrapCrossAlignment.center, spacing: 12, children: [
            Text('© 2026 MIKA SERVICES — Holding ACK S.A. Tous droits réservés. N°1 du BTP au Gabon.', style: AppTypography.bodySm.copyWith(color: AppColors.surfaceDim)),
            Row(children: [
              InkWell(onTap: () => context.go('/legal'), child: Text('Mentions légales', style: AppTypography.bodySm.copyWith(color: AppColors.primaryFixedDim))),
              const SizedBox(width: 16),
              Text('Confidentialité', style: AppTypography.bodySm.copyWith(color: AppColors.surfaceDim)),
              const SizedBox(width: 16),
              Text('Espace Presse', style: AppTypography.bodySm.copyWith(color: AppColors.surfaceDim)),
            ]),
          ]),
        ]),
      ),
    );
  }

  Widget _social(IconData i) => Container(margin: const EdgeInsets.only(right: 8), width: 36, height: 36, decoration: BoxDecoration(color: Colors.white.withOpacity(0.08), borderRadius: BorderRadius.circular(8)), child: Icon(i, color: Colors.white, size: 18));

  Widget _col(String title, List<String> items, List<String>? paths, BuildContext context) {
    return SizedBox(
      width: 180,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(title, style: AppTypography.labelLg.copyWith(color: Colors.white)),
        const SizedBox(height: 12),
        ...List.generate(items.length, (i) {
          final p = paths != null && i < paths.length ? paths[i] : null;
          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: InkWell(onTap: p == null ? null : () => context.go(p), child: Text(items[i], style: AppTypography.bodySm.copyWith(color: AppColors.surfaceVariant))),
          );
        }),
      ]),
    );
  }
}

class PageScaffold extends StatelessWidget {
  final Widget child;
  final bool showHeader;
  const PageScaffold({super.key, required this.child, this.showHeader = true});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: showHeader ? const AppHeader() : null,
      body: SingleChildScrollView(
        child: Column(
          children: [
            child,
            const AppFooter(),
          ],
        ),
      ),
    );
  }
}
