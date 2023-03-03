part of 'controller.dart';

class SpellView extends StatelessView<SpellScreen, SpellController> {
  const SpellView(SpellController state, {Key? key}) : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkPurpleColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.close,
            color: blackColor,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
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
                const SpellBoxRow(
                  word: 'Hello',
                ),
                SizedBox(
                  height: 100.h,
                ),
              ],
            ),
          ),
          const SpellKeypad(
            word: 'Hello',
          )
        ],
      ),
    );
  }
}
