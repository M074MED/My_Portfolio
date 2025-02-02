import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'injection_container.dart';
import 'package:flutter/material.dart';
import 'app_theme.dart';
import 'presentation/pages/home/home_page.dart';
import 'presentation/routes/routes.dart';
import 'values/values.dart';
import 'package:layout/layout.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'configure_web.dart';

// Home
// TODO:: add well rounded verbose rotating logos -> representing web, mobile & cloud
// cloud -> kubernets & docker
// mobile -> kotlin, android, flutter, jetpack compose,
// web -> react, javascript

// Certifications
// TODO:: Add Cloud Certification from Udacity

// Contact
// TODO:: Fix email service

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: "dotenv", isOptional: true);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  configureDependencies();
  configureApp();
  runApp(M074MED());
}

class M074MED extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Layout(
      child: MaterialApp(
        title: StringConst.APP_TITLE,
        theme: AppTheme.lightThemeData,
        debugShowCheckedModeBanner: false,
        initialRoute: HomePage.homePageRoute,
        onGenerateRoute: RouteConfiguration.onGenerateRoute,
        navigatorObservers: [routeObserver],
      ),
    );
  }
}
