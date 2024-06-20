import 'package:flutter/material.dart';
import 'package:logaya/view/auth/presentation/view/login.dart';

import 'authorization.dart';
import 'core/helper/api.dart';
import 'core/helper/cach.dart';
import 'core/network/end_points.dart';
import 'face.dart';
import 'finger.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await ChachHelper.init();
  userToken = ChachHelper.getData(key: 'token');
  debugPrint('tokennnn in main is $userToken');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,

      home: LoginScreen(),


    );
  }
}
