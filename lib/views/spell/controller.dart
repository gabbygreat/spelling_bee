import 'package:spelling_bee/services/local_services.dart';

import '../../utils/utils.dart';

part 'view.dart';

class SpellScreen extends ConsumerStatefulWidget {
  const SpellScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SpellScreen> createState() => SpellController();
}

class SpellController extends ConsumerState<SpellScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await LocalStorage.instance.createSpelling();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SpellView(this);
  }
}
