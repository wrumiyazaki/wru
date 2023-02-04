import 'dart:async';

import 'package:enum_to_string/enum_to_string.dart';
import 'package:fimber/fimber.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study_mvvm/foundation/constants.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (!kReleaseMode) {
    Fimber.plantTree(DebugTree());
  } else {
    debugPrint = (message, {wrapWidth}) {};
  }

  if (Constants.flavor == Flavor.dev) {
    Fluttertoast.showToast(
        msg: "flavor: ${EnumToString.convertToString(Constants.flavor)}");
  }

  runZonedGuarded(() => runApp(const ProviderScope(child: MyApp())),
      (error, stack) {
    Fimber.e(error.toString());
  });
}
