// theme_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shazamclome/thememotifier.dart';

final themeProvider = StateNotifierProvider<ThemeNotifier, bool>((ref) {
  return ThemeNotifier();
});
