import 'package:firebase_core/firebase_core.dart';
import 'package:habit_tracker/app.dart';
import 'package:habit_tracker/src/core/core.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  await app(
    firebaseInitialization: () async {
      await Firebase.initializeApp();
    },
    flavorConfiguration: () async {
      initHive();
    },
  );
}

Future<void> initHive() async {
  final appDocumentDir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(appDocumentDir.path);

  // Hive box for whole application

  await Hive.openBox(AppConfigs.hiveBoxName);
}
