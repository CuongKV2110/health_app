import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sizer/sizer.dart';

import 'data/resources/colors.dart';
import 'generated/l10n.dart';
import 'presentation/login/pages/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          color: AppColors.white,
          debugShowCheckedModeBanner: false,
          home: const SafeArea(
            child: LoginScreen(),
          ),
          locale: const Locale('en'),
          localizationsDelegates: const [
            S.delegate,
            FallbackCupertinoLocalisationsDelegate(),
            GlobalCupertinoLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate
          ],
          supportedLocales: S.delegate.supportedLocales,
        );
      },
    );
  }
}

class FallbackCupertinoLocalisationsDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackCupertinoLocalisationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return true;
  }

  @override
  Future<MaterialLocalizations> load(Locale locale) {
    return DefaultMaterialLocalizations.load(locale);
  }

  @override
  bool shouldReload(LocalizationsDelegate<MaterialLocalizations> old) {
    return false;
  }
}
