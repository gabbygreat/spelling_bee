import '../utils/utils.dart';

class HomeSectionCard extends StatefulWidget {
  final String cardText;
  const HomeSectionCard({
    required this.cardText,
    super.key,
  });

  @override
  State<HomeSectionCard> createState() => _HomeSectionCardState();
}

class _HomeSectionCardState extends State<HomeSectionCard> {
  void openSpellScreen() {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const SpellScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(0.0, 1.0);
          const end = Offset.zero;
          final tween = Tween(begin: begin, end: end);
          final offsetAnimation = animation.drive(tween);
          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 25.r),
      child: InkWell(
        onTap: () => openSpellScreen(),
        child: Container(
          padding: EdgeInsets.all(25.r),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            color: purpleColor,
          ),
          child: Row(
            children: [
              Container(
                width: 100.w,
                height: 100.w,
                padding: EdgeInsets.all(10.r),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: whiteColor,
                ),
              ),
              SizedBox(width: 40.w),
              Expanded(
                child: Text(
                  widget.cardText,
                  style: TextStyle(
                    fontFamily: 'Rubik',
                    color: whiteColor,
                    fontSize: 35.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Container(
                width: 50.w,
                height: 50.w,
                padding: EdgeInsets.all(10.r),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: whiteColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
