import '../utils/utils.dart';

class SpellKeypad extends ConsumerStatefulWidget {
  final String word;
  const SpellKeypad({
    required this.word,
    super.key,
  });

  @override
  ConsumerState<SpellKeypad> createState() => _SpellKeypadState();
}

class _SpellKeypadState extends ConsumerState<SpellKeypad> {
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
                  ),
                  TextCard(
                    'B',
                    word: widget.word,
                  ),
                  TextCard(
                    'C',
                    word: widget.word,
                  ),
                  TextCard(
                    'D',
                    word: widget.word,
                  ),
                  TextCard(
                    'E',
                    word: widget.word,
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
                ),
                TextCard(
                  'G',
                  word: widget.word,
                ),
                TextCard(
                  'H',
                  word: widget.word,
                ),
                TextCard(
                  'I',
                  word: widget.word,
                ),
                TextCard(
                  'J',
                  word: widget.word,
                ),
                TextCard(
                  'K',
                  word: widget.word,
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
                  ),
                  TextCard(
                    'M',
                    word: widget.word,
                  ),
                  TextCard(
                    'N',
                    word: widget.word,
                  ),
                  TextCard(
                    'O',
                    word: widget.word,
                  ),
                  TextCard(
                    'P',
                    word: widget.word,
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
                ),
                TextCard(
                  'R',
                  word: widget.word,
                ),
                TextCard(
                  'S',
                  word: widget.word,
                ),
                TextCard(
                  'T',
                  word: widget.word,
                ),
                TextCard(
                  'U',
                  word: widget.word,
                ),
                TextCard(
                  'V',
                  word: widget.word,
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
                  ),
                  TextCard(
                    'X',
                    word: widget.word,
                  ),
                  TextCard(
                    'Y',
                    word: widget.word,
                  ),
                  TextCard(
                    'Z',
                    word: widget.word,
                  ),
                  TextCard(
                    '#',
                    word: widget.word,
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

class TextCard extends ConsumerWidget {
  final String text;
  final String word;
  final bool delete;
  const TextCard(
    this.text, {
    required this.word,
    this.delete = false,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {
        if (delete) {
          ref.read(spellProvider.notifier).removeText(
                context,
              );
        } else {
          ref.read(spellProvider.notifier).addText(
                text,
                word,
                context,
              );
        }
      },
      child: Card(
        color: darkPurpleColor,
        elevation: 0,
        child: SizedBox(
          width: 50.w,
          height: 50.w,
          child: Center(
            child: Text(
              text,
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
