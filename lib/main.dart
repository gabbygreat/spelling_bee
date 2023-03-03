import 'utils/utils.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(720, 1600),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, _) {
        return MaterialApp(
          title: 'Spelling Bee',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const HomeScreen(),
        );
      },
    );
  }
}
