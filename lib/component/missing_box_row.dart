import '../utils/utils.dart';

class MissingBoxRow extends ConsumerStatefulWidget {
  final String word;
  const MissingBoxRow({
    required this.word,
    super.key,
  });

  @override
  ConsumerState<MissingBoxRow> createState() => _MissingBoxRowState();
}

class _MissingBoxRowState extends ConsumerState<MissingBoxRow> {
  @override
  Widget build(BuildContext context) {
    final missing = ref.watch(missingProvider);
    return Wrap(
      runAlignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 30.w,
      runSpacing: 30.w,
      children: [
        for (var i = 0; i <= widget.word.length - 1; i++)
          SpellBox(
            text: i < missing.length ? missing.elementAt(i) : null,
          ),
      ],
    );
  }
}

class SpellBox extends StatelessWidget {
  final String? text;
  const SpellBox({
    this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85.h,
      width: 70.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        color: text != null ? primaryColor : Colors.grey,
        boxShadow: [
          BoxShadow(
            color: text != null ? primaryColor : Colors.grey, //dark
            offset: const Offset(1, 1),
          ),
        ],
      ),
      alignment: Alignment.center,
      child: Text(
        text ?? '',
        style: TextStyle(
          fontFamily: 'Rubik',
          color: whiteColor,
          fontWeight: FontWeight.w600,
          fontSize: 45.sp,
        ),
      ),
    );
  }
}
