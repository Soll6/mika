import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';
import '../theme/app_spacing.dart';

class SectionHeader extends StatelessWidget {
  final String eyebrow;
  final String title;
  final String? subtitle;
  final Color eyebrowColor;
  final bool centered;
  const SectionHeader({super.key, required this.eyebrow, required this.title, this.subtitle, this.eyebrowColor = AppColors.primaryContainer, this.centered = false});
  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.sizeOf(context).width < AppSpacing.bpMobile;
    return Column(crossAxisAlignment: centered ? CrossAxisAlignment.center : CrossAxisAlignment.start, children: [
      Row(mainAxisSize: MainAxisSize.min, children: [
        Container(width: 10, height: 10, decoration: BoxDecoration(color: eyebrowColor, shape: BoxShape.circle)),
        const SizedBox(width: 8),
        Text(eyebrow.toUpperCase(), style: AppTypography.labelSm.copyWith(color: eyebrowColor, letterSpacing: 1.2)),
      ]),
      const SizedBox(height: 8),
      Text(title, style: (isMobile ? AppTypography.displayMdMobile : AppTypography.displayMd).copyWith(color: AppColors.onSurface), textAlign: centered ? TextAlign.center : TextAlign.left),
      if (subtitle != null) ...[
        const SizedBox(height: 8),
        Text(subtitle!, style: AppTypography.bodyLg.copyWith(color: AppColors.tertiary), textAlign: centered ? TextAlign.center : TextAlign.left),
      ],
    ]);
  }
}

class StatCard extends StatelessWidget {
  final String label;
  final String value;
  final String desc;
  final IconData icon;
  final Color accent;
  const StatCard({super.key, required this.label, required this.value, required this.desc, required this.icon, this.accent = AppColors.primaryContainer});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(AppSpacing.radiusLg), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 16, offset: const Offset(0,4))]),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(label.toUpperCase(), style: AppTypography.labelSm.copyWith(color: accent)),
          Icon(icon, size: 20, color: AppColors.outlineVariant),
        ]),
        const SizedBox(height: 8),
        Text(value, style: AppTypography.displayMd.copyWith(color: AppColors.onSurface, fontSize: 34)),
        const SizedBox(height: 4),
        Text(desc, style: AppTypography.bodySm.copyWith(color: AppColors.tertiary)),
      ]),
    );
  }
}

class ProgressBar extends StatelessWidget {
  final double value; // 0..1
  final Color color;
  const ProgressBar({super.key, required this.value, this.color = AppColors.primaryContainer});
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(99),
      child: LinearProgressIndicator(value: value, minHeight: 8, backgroundColor: AppColors.surfaceContainer, valueColor: AlwaysStoppedAnimation(color)),
    );
  }
}

class StatusBadge extends StatelessWidget {
  final String text;
  final Color bg;
  final Color fg;
  const StatusBadge({super.key, required this.text, required this.bg, required this.fg});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(6)),
      child: Text(text, style: AppTypography.labelSm.copyWith(color: fg, fontSize: 10)),
    );
  }
}
