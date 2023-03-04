import '../../utils/utils.dart';

class SpellViewBoby extends ConsumerStatefulWidget {
  const SpellViewBoby({super.key});

  @override
  ConsumerState<SpellViewBoby> createState() => _SpellViewBobyState();
}

class _SpellViewBobyState extends ConsumerState<SpellViewBoby> {
  int totalQuestionCount = 5;

  Future<String?> readAloud({bool increment = true}) async {
    if (increment) {
      ref.read(spellingCount.notifier).state += 1;
    }

    return await readQuestion(
      questionNumber: ref.read(spellingCount.notifier).state,
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await readAloud(increment: false);
      ref.read(speltWordsProvider.notifier).state.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    final count = ref.watch(spellingCount);

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
            image: const DecorationImage(
              image: AssetImage(
                'assets/images/bee.png',
              ),
              fit: BoxFit.cover,
              opacity: 0.05,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Spacer(),
              const SpellingBoxRow(),
              const Spacer(),
              Align(
                alignment: Alignment.topLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      backgroundColor: purpleColor,
                      radius: 60.r,
                      child: IconButton(
                        onPressed: () async {
                          await readAloud(increment: false);
                        },
                        icon: Center(
                          child: Icon(
                            Icons.volume_up,
                            color: whiteColor,
                            size: 50.sp,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        if (count == totalQuestionCount) {
                          showSuccess(message: 'The end', context: context);
                          debugPrint(ref
                              .read(speltWordsProvider.notifier)
                              .state
                              .toString());
                        } else {
                          await readAloud();
                          final word = await readQuestion(
                              questionNumber:
                                  ref.read(spellingCount.notifier).state - 1,
                              speak: false);
                          ref.read(speltWordsProvider.notifier).state[word] =
                              ref.read(spellingProvider.notifier).state;
                        }
                        ref.read(spellingProvider.notifier).state = '';
                      },
                      child: CircleAvatar(
                        backgroundColor: purpleColor,
                        radius: 60.r,
                        child: Text(
                          count == totalQuestionCount ? 'End' : 'Next',
                          style: TextStyle(
                            color: whiteColor,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 80.h,
              ),
            ],
          ),
        ),
        const CustomKeypad(
          word: 'Hello Wor',
          screen: CategoryScreen.spell,
        )
      ],
    );
  }
}
