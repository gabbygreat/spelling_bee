import '../utils/utils.dart';

class SpellingBoxRow extends ConsumerStatefulWidget {
  const SpellingBoxRow({super.key});

  @override
  ConsumerState<SpellingBoxRow> createState() => _SpellingBoxRowState();
}

class _SpellingBoxRowState extends ConsumerState<SpellingBoxRow> {
  @override
  Widget build(BuildContext context) {
    final spelling = ref.watch(spellingProvider);
    return Text(
      spelling,
      textAlign: TextAlign.center,
      style: TextStyle(
        decoration: TextDecoration.underline,
        fontWeight: FontWeight.w900,
        letterSpacing: 10.sp,
        fontSize: 80.sp,
      ),
    );
  }
}
