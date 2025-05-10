import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:localization_demo_app/controller/language_change_provider.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

enum Languages { en, es, kn }

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context);
    return Consumer<LanguageChangeController>(
      builder: (context, provider, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text(local!.appbar_title),
            centerTitle: true,
            actions: [
              PopupMenuButton(
                  itemBuilder: (context) => <PopupMenuEntry<Languages>>[
                        const PopupMenuItem<Languages>(
                          value: Languages.en,
                          child: Text('English'),
                        ),
                        const PopupMenuItem<Languages>(
                          value: Languages.es,
                          child: Text('Spanish'),
                        ),
                        const PopupMenuItem<Languages>(
                          value: Languages.kn,
                          child: Text('Kannada'),
                        ),
                      ],
                  onSelected: (value) {
                    if (value == Languages.en) {
                      provider.setLocale(const Locale('en'));
                    } else if (value == Languages.es) {
                      provider.setLocale(const Locale('es'));
                    } else if (value == Languages.kn) {
                      provider.setLocale(const Locale('kn'));
                    }
                  })
            ],
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 60),
              
                    Text(
                      local.header,
                      style: const TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        letterSpacing: 1.5,
                      ),
                    ),
              
                    const SizedBox(height: 40),
              
                    TextField(
                      decoration: InputDecoration(
                        hintText: local.email_hint,
                        filled: true,
                        fillColor: Colors.grey[100],
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 14, horizontal: 12),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
              
                    const SizedBox(height: 16),
              
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: local.password_hint,
                        filled: true,
                        fillColor: Colors.grey[100],
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 14, horizontal: 12),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
              
                    const SizedBox(height: 10),
              
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        local.forget,
                        style: const TextStyle(
                          color: Colors.blue,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
              
                    const SizedBox(height: 30),
              
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          local.login_btn,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
              
                    const SizedBox(height: 20),
              
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          local.dont_have,
                          style: const TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          local.register,
                          style: const TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
