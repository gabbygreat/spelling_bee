part of 'controller.dart';

class SpellView extends StatelessView<SpellScreen, SpellController> {
  const SpellView(SpellController state, {Key? key}) : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    final count = controller.ref.watch(spellingCount);

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
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: CircleAvatar(
              backgroundColor: primaryColor,
              child: Text(
                '$count',
                style: TextStyle(
                  color: purpleColor,
                ),
              ),
            ),
          )
        ],
      ),
      body: const SpellViewBoby(),
    );
  }
}
