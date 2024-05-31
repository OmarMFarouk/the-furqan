import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thefurqan/blocs/quran_bloc/quran_cubit.dart';
import 'package:thefurqan/screens/auth/auth_toggle.dart';
import '../blocs/auth_bloc/auth_cubit.dart';
import '../generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class AppRoot extends StatefulWidget {
  const AppRoot({super.key});

  @override
  State<AppRoot> createState() => _AppRootState();

  static void setLocale(BuildContext context, Locale newLocale) {
    _AppRootState? state = context.findAncestorStateOfType<_AppRootState>();
    state?.setLocale(newLocale);
  }
}

class _AppRootState extends State<AppRoot> {
  Locale? _locale;

  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthCubit(),
          ),
          BlocProvider(
              create: (context) => QuranCubit()
                ..fetchQuran()
                ..fetchEnglishQuran()
                ..fetchTafseer()
                ..fetchEnglishTafseer())
        ],
        child: MaterialApp(
            locale: _locale,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            theme: ThemeData(fontFamily: 'Poppins'),
            debugShowCheckedModeBanner: false,
            home: const AuthToggle()));
  }
}
