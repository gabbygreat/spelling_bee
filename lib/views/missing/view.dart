part of 'controller.dart';

class MissingView extends StatelessView<MissingScreen, MissingController> {
  const MissingView(MissingController state, {Key? key})
      : super(state, key: key);

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
      body: const MissingViewBoby(),
    );
  }
}
