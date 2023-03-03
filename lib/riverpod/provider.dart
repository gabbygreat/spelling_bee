import '../utils/utils.dart';

final spellProvider = StateNotifierProvider.autoDispose<SpellNotifier, List<String>>(
    (ref) => SpellNotifier([]));
