import 'package:flutter/material.dart';
import '../../core/widgets/app_footer.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/responsive/responsive.dart';

class LegalPage extends StatelessWidget {
  const LegalPage({super.key});
  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      child: Column(children: [
        Container(width: double.infinity, color: AppColors.surfaceContainerLow, padding: EdgeInsets.symmetric(horizontal: context.contentPadding, vertical: 32), child: ResponsiveContainer(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Juridique'.toUpperCase(), style: AppTypography.labelSm.copyWith(color: AppColors.secondary)), const SizedBox(height: 8), Text('Mentions Légales &\nConfidentialité', style: (context.isMobile ? AppTypography.displayMdMobile : AppTypography.displayMd).copyWith(color: AppColors.onSurface)), const SizedBox(height: 8), Text('Loi gabonaise N°001/2011 relative à la protection des données à caractère personnel. Mise à jour : Mars 2026.', style: AppTypography.bodyLg.copyWith(color: AppColors.tertiary)), const SizedBox(height: 12), Text('MIKA SERVICES — Holding ACK S.A. • Zone Industrielle d’Owendo, BP 1234 Libreville — Gabon • contact@mikaservices.ga', style: AppTypography.bodySm.copyWith(color: AppColors.tertiary))]))),
        Padding(padding: EdgeInsets.symmetric(horizontal: context.contentPadding, vertical: 24), child: ResponsiveContainer(child: context.isMobile ? Column(children: [_toc(), const SizedBox(height: 20), _content()]) : Row(crossAxisAlignment: CrossAxisAlignment.start, children: [SizedBox(width: 260, child: _toc()), const SizedBox(width: 24), Expanded(child: _content())]))),
      ]),
    );
  }

  Widget _toc() => Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: const Color(0xFFE2E8F0))),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Sommaire', style: AppTypography.headlineSm.copyWith(color: AppColors.onSurface)),
          const SizedBox(height: 12),
          _tocItem('1. Éditeur du site', true),
          _tocItem('2. Hébergement', false),
          _tocItem('3. Données personnelles', false),
          _tocItem('4. Cookies', false),
          _tocItem('5. Propriété intellectuelle', false),
          _tocItem('6. Contact DPO', false),
        ]),
      );

  Widget _tocItem(String t, bool active) => Padding(padding: const EdgeInsets.only(bottom: 8), child: Text(t, style: AppTypography.bodyMd.copyWith(color: active ? AppColors.primary : AppColors.tertiary, fontWeight: active ? FontWeight.w700 : FontWeight.w400)));

  Widget _content() => Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        _section('1. Éditeur du site', 'MIKA SERVICES, SARL au capital de 500 000 000 FCFA, immatriculée au RCCM de Libreville sous le numéro 2020-B2-1234, dont le siège social est situé Zone Industrielle d’Owendo, BP 1234 Libreville — Gabon. Directeur de la publication : M. Alain-Claude Kouakoua, Président Directeur Général de la Holding ACK S.A.'),
        _section('2. Hébergement', 'Site hébergé par Gabon Télécom — Cloud Souverain, Libreville. Données stockées au Gabon, sauvegardes chiffrées.'),
        _section('3. Données personnelles — Loi N°001/2011', 'MIKA SERVICES collecte nom, email, téléphone et CV via les formulaires de contact et de candidature. Finalités : réponse aux demandes, gestion des appels d’offres, recrutement. Base légale : consentement et intérêt légitime. Durée de conservation : 12 mois pour candidatures, 24 mois pour prospects commerciaux. Vous disposez d’un droit d’accès, de rectification, d’opposition et de suppression en écrivant à dpo@mikaservices.ga ou par courrier au siège. Réclamation possible auprès de la Commission Nationale de Protection des Données Personnelles (CNPDCP).'),
        _section('4. Cookies', 'Cookies strictement nécessaires (session, sécurité) et mesure d’audience anonymisée. Aucun cookie publicitaire. Vous pouvez les désactiver dans votre navigateur sans perte de fonctionnalité majeure.'),
        _section('5. Propriété intellectuelle', 'Tous les contenus (textes, photos de chantiers, plans, logos Holding ACK S.A. et MIKA SERVICES) sont protégés. Toute reproduction sans autorisation écrite est interdite. Crédits photos : MIKA SERVICES / chantiers Estuaire & Owendo Bypass.'),
        _section('6. Contact & DPO', 'Pour toute question juridique ou confidentialité : dpo@mikaservices.ga — +241 01 70 00 00. Médiation : en cas de litige, recours amiable préalable auprès du service juridique MIKA SERVICES avant toute action judiciaire.'),
        const SizedBox(height: 20),
        Container(padding: const EdgeInsets.all(16), decoration: BoxDecoration(color: AppColors.warningBg, borderRadius: BorderRadius.circular(12), border: Border.all(color: AppColors.primaryContainer.withOpacity(0.2))), child: Row(children: [const Icon(Icons.info_outline, color: AppColors.primaryContainer), const SizedBox(width: 10), Expanded(child: Text('Mise à jour : 13 mars 2026 — Version conforme à la réglementation gabonaise en vigueur.', style: AppTypography.bodySm.copyWith(color: AppColors.onSurface)))])),
      ]);

  Widget _section(String title, String body) => Padding(padding: const EdgeInsets.only(bottom: 20), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: AppTypography.headlineMd.copyWith(color: AppColors.onSurface, fontSize: 18)), const SizedBox(height: 8), Text(body, style: AppTypography.bodyMd.copyWith(color: AppColors.tertiary, height: 1.6))]));
}
