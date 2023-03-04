import '../utils/utils.dart';

final missingProvider =
    StateNotifierProvider.autoDispose<MissingNotifier, List<String>>(
        (ref) => MissingNotifier([]));

final spellingProvider = StateProvider.autoDispose<String>((ref) => '');

final spellingCount = StateProvider.autoDispose<int>((ref) => 1);

final speltWordsProvider = StateProvider<Map<String, dynamic>>((ref) => {});
