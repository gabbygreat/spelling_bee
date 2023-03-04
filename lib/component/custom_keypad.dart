import '../utils/utils.dart';

class CustomKeypad extends ConsumerStatefulWidget {
  final String word;
  final CategoryScreen screen;
  const CustomKeypad({
    required this.word,
    required this.screen,
    super.key,
  });

  @override
  ConsumerState<CustomKeypad> createState() => _SpellKeypadState();
}

class _SpellKeypadState extends ConsumerState<CustomKeypad> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(left: 30.w, right: 30.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 30.w, right: 30.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextCard(
                    'A',
                    word: widget.word,
                    screen: widget.screen,
                  ),
                  TextCard(
                    'B',
                    word: widget.word,
                    screen: widget.screen,
                  ),
                  TextCard(
                    'C',
                    word: widget.word,
                    screen: widget.screen,
                  ),
                  TextCard(
                    'D',
                    word: widget.word,
                    screen: widget.screen,
                  ),
                  TextCard(
                    'E',
                    word: widget.word,
                    screen: widget.screen,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextCard(
                  'F',
                  word: widget.word,
                  screen: widget.screen,
                ),
                TextCard(
                  'G',
                  word: widget.word,
                  screen: widget.screen,
                ),
                TextCard(
                  'H',
                  word: widget.word,
                  screen: widget.screen,
                ),
                TextCard(
                  'I',
                  word: widget.word,
                  screen: widget.screen,
                ),
                TextCard(
                  'J',
                  word: widget.word,
                  screen: widget.screen,
                ),
                TextCard(
                  'K',
                  word: widget.word,
                  screen: widget.screen,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 30.w, right: 30.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextCard(
                    'L',
                    word: widget.word,
                    screen: widget.screen,
                  ),
                  TextCard(
                    'M',
                    word: widget.word,
                    screen: widget.screen,
                  ),
                  TextCard(
                    'N',
                    word: widget.word,
                    screen: widget.screen,
                  ),
                  TextCard(
                    'O',
                    word: widget.word,
                    screen: widget.screen,
                  ),
                  TextCard(
                    'P',
                    word: widget.word,
                    screen: widget.screen,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextCard(
                  'Q',
                  word: widget.word,
                  screen: widget.screen,
                ),
                TextCard(
                  'R',
                  word: widget.word,
                  screen: widget.screen,
                ),
                TextCard(
                  'S',
                  word: widget.word,
                  screen: widget.screen,
                ),
                TextCard(
                  'T',
                  word: widget.word,
                  screen: widget.screen,
                ),
                TextCard(
                  'U',
                  word: widget.word,
                  screen: widget.screen,
                ),
                TextCard(
                  'V',
                  word: widget.word,
                  screen: widget.screen,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 30.w, right: 30.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextCard(
                    'W',
                    word: widget.word,
                    screen: widget.screen,
                  ),
                  TextCard(
                    'X',
                    word: widget.word,
                    screen: widget.screen,
                  ),
                  TextCard(
                    'Y',
                    word: widget.word,
                    screen: widget.screen,
                  ),
                  TextCard(
                    'Z',
                    word: widget.word,
                    screen: widget.screen,
                  ),
                  TextCard(
                    '#',
                    word: widget.word,
                    screen: widget.screen,
                    delete: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TextCard extends ConsumerStatefulWidget {
  final String text;
  final String word;
  final CategoryScreen screen;
  final bool delete;
  const TextCard(
    this.text, {
    required this.word,
    required this.screen,
    this.delete = false,
    super.key,
  });

  @override
  ConsumerState<TextCard> createState() => _TextCardState();
}

class _TextCardState extends ConsumerState<TextCard> {
  void perforMissing() {
    if (widget.delete) {
      ref.read(missingProvider.notifier).removeText(
            context,
          );
    } else {
      ref.read(missingProvider.notifier).addText(
            widget.text,
            widget.word,
            context,
          );
    }
  }

  void performSpelling() {
    if (widget.delete) {
      if (ref.read(spellingProvider.notifier).state.isNotEmpty) {
        final word = ref.read(spellingProvider.notifier).state.toString();
        ref.read(spellingProvider.notifier).state =
            word.substring(0, word.length - 1);
      }
    } else {
      ref.read(spellingProvider.notifier).state += widget.text;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        switch (widget.screen) {
          case CategoryScreen.missing:
            perforMissing();
            break;
          case CategoryScreen.spell:
            performSpelling();
            break;
          default:
            debugPrint('Unimplemented');
        }
      },
      onLongPress: () {
        if (widget.delete) {
          switch (widget.screen) {
            case CategoryScreen.missing:
              ref.read(missingProvider.notifier).clearWords();
              break;
            case CategoryScreen.spell:
              ref.read(spellingProvider.notifier).state = '';

              break;
            default:
              debugPrint('Unimplemented');
          }
        }
      },
      child: Card(
        color: darkPurpleColor,
        elevation: 0,
        child: SizedBox(
          width: 50.w,
          height: 50.w,
          child: Center(
            child: widget.delete
                ? Icon(
                    Icons.backspace,
                    color: whiteColor,
                  )
                : Text(
                    widget.text,
                    style: TextStyle(
                      color: whiteColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 40.sp,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
