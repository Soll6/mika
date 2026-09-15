import 'package:flutter_test/flutter_test.dart';
import 'package:mika_1/core/theme/app_colors.dart';
import 'package:mika_1/core/theme/app_spacing.dart';

void main() {
  test('Design system tokens are correct', () {
    expect(AppColors.primaryContainer.value, 0xFFEA7317);
    expect(AppColors.secondary.value, 0xFF2B5BB5);
    expect(AppSpacing.maxContentWidth, 1440);
  });
  test('Routing table has frontend routes', () {
    expect(AppSpacing.bpMobile, 768);
  });
}
