import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:design_patterns/firebase_options.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

import 'config/config.dart';
import 'package:design_patterns/config/router/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp( options: DefaultFirebaseOptions.currentPlatform );
  runApp(
    const ProviderScope(child: MainApp())
  );
}

class MainApp extends ConsumerStatefulWidget {

  const MainApp({super.key});

  @override
  ConsumerState<MainApp> createState() => _MainAppState();
}

class _MainAppState extends ConsumerState<MainApp> {

  Color colorSeedRemoteConfig = Colors.blueAccent;

  @override
  void initState() {
    super.initState();
    final remoteConfig = FirebaseRemoteConfig.instance;
    remoteConfig.onConfigUpdated.listen((event) async {
      await remoteConfig.activate();

      // Use the new config values here.
      colorSeedRemoteConfig = remoteConfig.getString('color_seed') as Color;
    });
  }
  
  @override
  Widget build(BuildContext context) {

    final appRouter = ref.watch(appRouterProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      theme       : AppTheme().getTheme(colorSeed: colorSeedRemoteConfig),
    );
  }
}
