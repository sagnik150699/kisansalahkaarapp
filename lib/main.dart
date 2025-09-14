import 'package:flutter/material.dart';
import 'package:kisan_salahkaar/core/router.dart';
import 'package:kisan_salahkaar/core/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Kisan Salahkaar',
      theme: AppTheme.theme,
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
