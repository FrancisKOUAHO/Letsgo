import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:letsgo/route/route.dart';
import 'package:letsgo/services/auth_service.dart';
import 'package:provider/provider.dart';

import 'models/user_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<AppUser?>.value(
      value: AuthService().user,
      initialData: null,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        onGenerateRoute: (settings) => RouteGenerator.generateRoute(settings),
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      ),
    );
  }
}
