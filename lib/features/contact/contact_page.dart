import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/widgets/app_footer.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/responsive/responsive.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});
  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final _form = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      child: Column(children: [
        Container(width: double.infinity, color: AppColors.onSurface, padding: EdgeInsets.symmetric(horizontal: context.contentPadding, vertical: 40), child: ResponsiveContainer(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Contact'.toUpperCase(), style: AppTypography.labelSm.copyWith(color: AppColors.primaryFixed)), const SizedBox(height: 8), Text('Siège Opérationnel Owendo\n& Direction Générale', style: (context.isMobile ? AppTypography.displayLgMobile : AppTypography.displayLg).copyWith(color: Colors.white)), const SizedBox(height: 12), Text('Une question, un appel d’offres, un projet ? Écrivez-nous — réponse sous 24h ouvrées.', style: AppTypography.bodyXl.copyWith(color: AppColors.surfaceDim))]))),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: context.contentPadding, vertical: 28),
          child: ResponsiveContainer(
            child: context.isMobile
                ? Column(children: [_formCard(), const SizedBox(height: 20), _infos()])
                : Row(crossAxisAlignment: CrossAxisAlignment.start, children: [Expanded(flex: 7, child: _formCard()), const SizedBox(width: 24), Expanded(flex: 5, child: _infos())]),
          ),
        ),
      ]),
    );
  }

  Widget _formCard() => Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 12)]),
        child: Form(
          key: _form,
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Envoyer un message', style: AppTypography.headlineMd.copyWith(color: AppColors.onSurface)),
            const SizedBox(height: 6),
            Text('Appels d’offres, demandes de devis, candidatures spontanées : nous lisons chaque message.', style: AppTypography.bodySm.copyWith(color: AppColors.tertiary)),
            const SizedBox(height: 16),
            Row(children: [Expanded(child: TextFormField(decoration: const InputDecoration(labelText: 'Nom complet *', hintText: 'Ex. Jean Koumba'), validator: (v) => v == null || v.isEmpty ? 'Requis' : null)), const SizedBox(width: 12), Expanded(child: TextFormField(decoration: const InputDecoration(labelText: 'Société'),))]),
            const SizedBox(height: 12),
            Row(children: [Expanded(child: TextFormField(decoration: const InputDecoration(labelText: 'Email *', hintText: 'jean@exemple.ga'), validator: (v) => v != null && v.contains('@') ? null : 'Email invalide')), const SizedBox(width: 12), Expanded(child: TextFormField(decoration: const InputDecoration(labelText: 'Téléphone', hintText: '+241 ...')))]),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(decoration: const InputDecoration(labelText: 'Sujet *'), items: ['Demande de devis', 'Appel d’offres', 'Candidature', 'Presse / Média', 'Autre'].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(), onChanged: (_) {}),
            const SizedBox(height: 12),
            TextFormField(maxLines: 5, decoration: const InputDecoration(labelText: 'Message *', hintText: 'Décrivez votre projet, linéaire, lieu, délais...'), validator: (v) => v == null || v.length < 10 ? '10 caractères min' : null),
            const SizedBox(height: 12),
            Row(children: [Checkbox(value: false, onChanged: (_) {}), Expanded(child: Text('J’accepte la politique de confidentialité et le traitement de mes données (Loi gabonaise N°001/2011).', style: AppTypography.bodySm.copyWith(color: AppColors.tertiary)))]),
            const SizedBox(height: 16),
            SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () { if (_form.currentState!.validate()) ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Message envoyé — équipe MIKA notifiée.'))); }, child: const Text('Envoyer le message'))),
          ]),
        ),
      );

  Widget _infos() => Column(children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(color: AppColors.surfaceContainerLow, borderRadius: BorderRadius.circular(16)),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Coordonnées', style: AppTypography.headlineSm.copyWith(color: AppColors.onSurface)),
            const SizedBox(height: 12),
            _infoRow(Icons.location_on, 'Siège Owendo', 'Zone Industrielle d’Owendo, BP 1234\nLibreville — Gabon'),
            _infoRow(Icons.phone, 'Téléphone', '+241 01 70 00 00\n+241 06 00 00 00'),
            _infoRow(Icons.email, 'Email', 'contact@mikaservices.ga\ncommercial@mikaservices.ga'),
            _infoRow(Icons.schedule, 'Horaires', 'Lun–Ven 07h30–17h30\nSam 08h–12h (permanence chantier)'),
            const SizedBox(height: 16),
            const _OsmMap(),
            const SizedBox(height: 8),
            Text('Plus Code : 8FPM+84 Libreville — Zone Industrielle d’Owendo, accès Port & ZES Nkok', style: AppTypography.bodySm.copyWith(color: AppColors.tertiary)),
          ]),
        ),
        const SizedBox(height: 16),
        Container(padding: const EdgeInsets.all(16), decoration: BoxDecoration(color: AppColors.onSurface, borderRadius: BorderRadius.circular(16)), child: Row(children: [Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Espace Appels d’Offres', style: AppTypography.headlineSm.copyWith(color: Colors.white, fontSize: 16)), const SizedBox(height: 4), Text('Consultez les avis et déposez vos offres en ligne.', style: AppTypography.bodySm.copyWith(color: AppColors.surfaceDim))])), const SizedBox(width: 12), ElevatedButton(onPressed: () {}, style: ElevatedButton.styleFrom(backgroundColor: AppColors.primaryContainer), child: const Text('Accéder'))])),
      ]);

  Widget _infoRow(IconData i, String t, String d) => Padding(padding: const EdgeInsets.only(bottom: 14), child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [Container(width: 36, height: 36, decoration: BoxDecoration(color: AppColors.primaryContainer.withOpacity(0.12), borderRadius: BorderRadius.circular(8)), child: Icon(i, color: AppColors.primaryContainer, size: 18)), const SizedBox(width: 10), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(t, style: AppTypography.labelMd.copyWith(color: AppColors.onSurface)), const SizedBox(height: 2), Text(d, style: AppTypography.bodySm.copyWith(color: AppColors.tertiary))]))]));

}

class _OsmMap extends StatelessWidget {
  const _OsmMap();

  static const _center = LatLng(0.39241, 9.45356); // 8FPM+84 Libreville (approx centre-ville / Owendo corridor)

  Future<void> _openExternal() async {
    final uri = Uri.parse('https://www.openstreetmap.org/?mlat=0.39241&mlon=9.45356#map=16/0.39241/9.45356');
    if (await canLaunchUrl(uri)) await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: SizedBox(
        height: 260,
        child: Stack(
          children: [
            FlutterMap(
              options: const MapOptions(
                initialCenter: _center,
                initialZoom: 14,
                interactionOptions: InteractionOptions(flags: InteractiveFlag.all),
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.mikaservices.app',
                  maxZoom: 19,
                ),
                MarkerLayer(
                  markers: [
                    Marker(
                      point: _center,
                      width: 44,
                      height: 44,
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.primaryContainer,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 3),
                          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.25), blurRadius: 8)],
                        ),
                        child: const Icon(Icons.location_on, color: Colors.white, size: 22),
                      ),
                    ),
                  ],
                ),
                RichAttributionWidget(
                  attributions: [
                    TextSourceAttribution('© OpenStreetMap contributors', onTap: () async {
                      final u = Uri.parse('https://www.openstreetmap.org/copyright');
                      if (await canLaunchUrl(u)) await launchUrl(u, mode: LaunchMode.externalApplication);
                    }),
                  ],
                ),
              ],
            ),
            Positioned(
              bottom: 12,
              left: 12,
              right: 12,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.95),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 8)],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Text('MIKA SERVICES — Siège Owendo', style: AppTypography.labelMd.copyWith(color: AppColors.onSurface)),
                        Text('8FPM+84 Libreville • 0.39241, 9.45356', style: AppTypography.bodySm.copyWith(color: AppColors.tertiary, fontSize: 11)),
                      ]),
                    ),
                    const SizedBox(width: 8),
                    FilledButton.icon(
                      onPressed: _openExternal,
                      icon: const Icon(Icons.open_in_new, size: 16),
                      label: const Text('Itinéraire'),
                      style: FilledButton.styleFrom(
                        backgroundColor: AppColors.primaryContainer,
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        textStyle: AppTypography.labelMd.copyWith(fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
