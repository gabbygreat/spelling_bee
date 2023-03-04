import 'package:spelling_bee/services/local_services.dart';
import 'package:text_to_speech/text_to_speech.dart';

Future<String> readQuestion({
  required int questionNumber,
  bool speak = true,
}) async {
  final questionMap = await LocalStorage.instance.getSpelling();
  final word = questionMap?['$questionNumber'];
  String text = "Question $questionNumber, spell $word";

  TextToSpeech tts = TextToSpeech()..setLanguage('en-Us');
  if (speak) {
    await tts.speak(text);
  }
  return word;
}
