import '../../utils/utils.dart';

class MissingViewBoby extends ConsumerStatefulWidget {
  const MissingViewBoby({super.key});

  @override
  ConsumerState<MissingViewBoby> createState() => _SpellViewBobyState();
}

class _SpellViewBobyState extends ConsumerState<MissingViewBoby> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.53,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 45.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(90.r),
              bottomRight: Radius.circular(90.r),
            ),
            color: whiteColor,
          ),
          child: Column(
            children: [
              const Spacer(),
              const MissingBoxRow(
                word: 'Hello Wor',
              ),
              SizedBox(
                height: 100.h,
              ),
            ],
          ),
        ),
        const CustomKeypad(
          word: 'Hello Wor',
          screen: CategoryScreen.missing,
        )
      ],
    );
  }
}
