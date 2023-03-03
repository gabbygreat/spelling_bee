import '../utils/utils.dart';

class SpellNotifier extends StateNotifier<List<String>> {
  SpellNotifier(super.state);

  void addText(String text, String word, BuildContext context) {
    if (state.length < word.length) {
      state = [...state, text];
    } else {
      showError('Maximum number', context: context);
    }
  }

  void removeText(BuildContext context) {
    if (state.isNotEmpty) {
      state = state.sublist(0, state.length - 1);
    }
  }

  void clearWords() {
    state = [];
  }
}
