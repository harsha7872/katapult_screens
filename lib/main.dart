import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:katapult_screens/socketprovider.dart';
import 'package:sizer/sizer.dart';
import 'screens/home_screen.dart';
import 'package:provider/provider.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // FirebaseCrashlytics.instance.crash();
  FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  runZoned(() {
    runApp(MyApp(),
    );
  }, onError: FirebaseCrashlytics.instance.recordError);
}
//   runApp(MyApp());
// }


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizerUtil().init(constraints, orientation);
              return MultiProvider(
                providers: [

            ChangeNotifierProvider(
            create: (_) => Testing(),
            ),
            ],
            child:  MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Katapult',
              theme: ThemeData.light(),
              home: HomeScreen(),
            )
            );
          },
        );
      },
    );
  }
}
