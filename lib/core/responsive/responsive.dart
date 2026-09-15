import 'package:flutter/material.dart';
import '../theme/app_spacing.dart';

enum Breakpoint { mobile, tablet, desktop }

extension ResponsiveContext on BuildContext {
  double get w => MediaQuery.sizeOf(this).width;
  Breakpoint get breakpoint {
    if (w < AppSpacing.bpMobile) return Breakpoint.mobile;
    if (w < AppSpacing.bpTablet) return Breakpoint.tablet;
    return Breakpoint.desktop;
  }
  bool get isMobile => breakpoint == Breakpoint.mobile;
  bool get isTablet => breakpoint == Breakpoint.tablet;
  bool get isDesktop => breakpoint == Breakpoint.desktop;
  double get contentPadding {
    switch (breakpoint) {
      case Breakpoint.mobile: return AppSpacing.marginMobile;
      case Breakpoint.tablet: return AppSpacing.margin;
      case Breakpoint.desktop: return AppSpacing.marginDesktop;
    }
  }
  int get gridColumns {
    switch (breakpoint) {
      case Breakpoint.mobile: return 4;
      case Breakpoint.tablet: return 8;
      case Breakpoint.desktop: return 12;
    }
  }
}

class ResponsiveContainer extends StatelessWidget {
  final Widget child;
  final double? maxWidth;
  const ResponsiveContainer({super.key, required this.child, this.maxWidth});
  @override
  Widget build(BuildContext context) {
    final pad = context.contentPadding;
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth ?? AppSpacing.maxContentWidth),
        child: Padding(padding: EdgeInsets.symmetric(horizontal: pad), child: child),
      ),
    );
  }
}

class ResponsiveGrid extends StatelessWidget {
  final List<Widget> children;
  final double gap;
  final int mobileCols;
  final int tabletCols;
  final int desktopCols;
  const ResponsiveGrid({
    super.key,
    required this.children,
    this.gap = 16,
    this.mobileCols = 1,
    this.tabletCols = 2,
    this.desktopCols = 3,
  });
  @override
  Widget build(BuildContext context) {
    int cols;
    switch (context.breakpoint) {
      case Breakpoint.mobile: cols = mobileCols; break;
      case Breakpoint.tablet: cols = tabletCols; break;
      case Breakpoint.desktop: cols = desktopCols; break;
    }
    return LayoutBuilder(builder: (ctx, c) {
      final itemW = (c.maxWidth - gap * (cols - 1)) / cols;
      return Wrap(spacing: gap, runSpacing: gap, children: children.map((e) => SizedBox(width: itemW, child: e)).toList());
    });
  }
}
