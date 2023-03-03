import '../../utils/utils.dart';

part 'view.dart';

class SpellScreen extends StatefulWidget {
  const SpellScreen({Key? key}) : super(key: key);

  @override
  State<SpellScreen> createState() => SpellController();
}

class SpellController extends State<SpellScreen> {
  @override
  Widget build(BuildContext context) {
    return SpellView(this);
  }
}
