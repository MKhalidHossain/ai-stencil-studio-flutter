import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import '../services/hive_storage_service.dart';
import '../di/service_locator.dart';


class AppInitializer {
  static Future<void> initializeApp() async {
    WidgetsFlutterBinding.ensureInitialized();

    PaintingBinding.instance.imageCache.maximumSize = 100; // 100 images
    PaintingBinding.instance.imageCache.maximumSizeBytes = 100 << 20; // 100 MB

    // Allow all orientations at app start
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    await HiveStorageService.init();
    setupServiceLocator();

  }
}
