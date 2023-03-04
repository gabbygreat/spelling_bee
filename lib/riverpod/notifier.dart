import '../utils/utils.dart';

class MissingNotifier extends StateNotifier<List<String>> {
  MissingNotifier(super.state);

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