import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:habit_tracker/src/features/habit_app/presentation/pages/habit_app.dart';

Future<void> app({
  AsyncCallback? firebaseInitialization,
  AsyncCallback? flavorConfiguration,
}) async {
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await firebaseInitialization?.call();
    await flavorConfiguration?.call();

    runApp(const HabitApp());
  }, (e, s) {});
}
