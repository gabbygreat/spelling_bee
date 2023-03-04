part of 'controller.dart';

class HomeView extends StatelessView<HomeScreen, HomeController> {
  const HomeView(HomeController state, {Key? key}) : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkPurpleColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Center(
              child: Image.asset(
                'assets/images/bee.png',
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.65,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(
              top: 80.w,
              left: 40.w,
              right: 40.w,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(80.r),
                topRight: Radius.circular(80.r),
              ),
              color: whiteColor,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Choose a category',
                    style: TextStyle(
                      fontFamily: 'TiltNeon',
                      fontSize: 45.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 60.h),
                  const HomeSectionCard(
                    cardText: 'Spell it',
                    screen: CategoryScreen.spell,
                  ),
                  const HomeSectionCard(
                    cardText: 'Missi_g word',
                    screen: CategoryScreen.missing,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
