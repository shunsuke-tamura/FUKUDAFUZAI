import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fukuda_fuzai/provider/domain_providers.dart';
import 'package:fukuda_fuzai/util/constant/color_constant.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  void initState() {
    Future(() async {
      final cache = ref.read(audioCacheProvider);
      final path = await cache.load("audios/firing.mp3");
      ref.read(firingSoundProvider.notifier).update((state) => path.path);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final router = ref.watch(routerProvider);
    return MaterialApp.router(
      theme: ThemeData(
        primaryColor: ColorConstant.black100,
        fontFamily: 'NotoSans',
        dividerColor: Colors.transparent,
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
