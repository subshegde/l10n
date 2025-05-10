import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:localization_demo_app/controller/language_change_provider.dart';
import 'package:localization_demo_app/pages/home.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final languageController = LanguageChangeController();
  await languageController.loadLocale();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<LanguageChangeController>.value(
          value: languageController,
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
    return Consumer<LanguageChangeController>(
      builder: (context, provider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Localization Demo',
          locale: provider.appLocale,
          supportedLocales: const [
            Locale('en', 'US'),
            Locale('es', 'ES'),
            Locale('kn', 'IN'),
          ],
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          home: const MyHomePage(),
        );
      },
    );
  }
}
