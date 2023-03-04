import '../../utils/utils.dart';

part 'view.dart';

class MissingScreen extends StatefulWidget {
  const MissingScreen({Key? key}) : super(key: key);

  @override
  State<MissingScreen> createState() => MissingController();
}

class MissingController extends State<MissingScreen> {
  @override
  Widget build(BuildContext context) {
    return MissingView(this);
  }
}
