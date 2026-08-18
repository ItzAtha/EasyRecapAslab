import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_recap/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:toastification/toastification.dart';

import 'core/themes/dark_mode.dart';
import 'core/themes/light_mode.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key, this._themeMode});

  final AdaptiveThemeMode? _themeMode;

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    bool isDarkMode = false;
    if (widget._themeMode == AdaptiveThemeMode.system) {
      isDarkMode = MediaQuery.platformBrightnessOf(context) == Brightness.dark;
    } else {
      isDarkMode = widget._themeMode == AdaptiveThemeMode.dark;
    }

    return ToastificationWrapper(
      config: const ToastificationConfig(maxToastLimit: 1),
      child: AdaptiveTheme(
        debugShowFloatingThemeButton: true,
        light: LightMode.initialize(),
        dark: DarkMode.initialize(),
        initial: widget._themeMode ?? AdaptiveThemeMode.system,
        builder: (theme, darkTheme) => GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          behavior: HitTestBehavior.opaque,
          child: AnnotatedRegion<SystemUiOverlayStyle>(
            value: isDarkMode ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark,
            child: MaterialApp.router(
              title: 'Easy Recap Aslab',
              debugShowCheckedModeBanner: false,
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              theme: theme,
              darkTheme: darkTheme,
              routerConfig: AppRouter.router,
            ),
          ),
        ),
      ),
    );
  }
}
