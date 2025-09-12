import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:myapp/core/router.dart';
import 'package:myapp/core/theme.dart';
import 'package:myapp/features/crop_recommendations/presentation/crop_recommendation_provider.dart';
import 'package:myapp/features/government_schemes/data/government_schemes_datasource.dart';
import 'package:myapp/features/government_schemes/domain/government_schemes_repository.dart';
import 'package:myapp/features/government_schemes/presentation/government_schemes_provider.dart';
import 'package:myapp/features/pest_and_disease/data/pest_and_disease_datasource.dart';
import 'package:myapp/features/pest_and_disease/domain/pest_and_disease_repository.dart';
import 'package:myapp/features/pest_and_disease/presentation/pest_and_disease_provider.dart';
import 'package:myapp/firebase_options.dart';
import 'package:myapp/presentation/providers/theme_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => CropRecommendationProvider()),
        ChangeNotifierProvider(
          create: (context) => GovernmentSchemesProvider(
            GovernmentSchemesRepository(
              GovernmentSchemesDatasource(),
            ),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => PestAndDiseaseProvider(
            PestAndDiseaseRepository(
              PestAndDiseaseDatasource(),
            ),
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Kisan Salahkaar',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: Provider.of<ThemeProvider>(context).themeMode,
      routerConfig: router,
    );
  }
}
