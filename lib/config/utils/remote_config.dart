

import 'package:firebase_remote_config/firebase_remote_config.dart';

class RemoteConfigVar {

  final remoteConfig = FirebaseRemoteConfig.instance;

  void loadRemoteConfigVArs() async {
    await remoteConfig.setConfigSettings(RemoteConfigSettings(
        fetchTimeout        : const Duration(minutes: 1),
        minimumFetchInterval: const Duration(hours: 1),
    ));
  }

  FirebaseRemoteConfig getRemoteConfig() {
    return remoteConfig;
  }

  listenRemoteConfig() {
    remoteConfig.onConfigUpdated.listen((event) async {
      await remoteConfig.activate();

      // Use the new config values here.
    });
  }
  
}