import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '/locator.dart';
import 'manager/dialog_manager.dart';
import 'routing/route_names.dart';
import 'routing/router.dart';
import 'services/dialog_service.dart';
import 'services/navigation_service.dart';
import 'views/authentication/startup_view.dart';
import 'views/home/home_view.dart';
import 'views/layout_templates/layout_template.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hijrah Selangor',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        textTheme: Theme.of(context).textTheme.apply(fontFamily: 'Open Sans'),
      ),
      builder: (context, child) => Navigator(
        key: locator<DialogService>().dialogNavigationKey,
        onGenerateRoute: (settings) => MaterialPageRoute(
            builder: (context) => DialogManager(child: child)),
      ),
      navigatorKey: locator<NavigationService>().navigatorKey,
      onGenerateRoute: generateRoute,
      initialRoute: HomeRoute,
      home: StartUpView(),
    );
  }
}
