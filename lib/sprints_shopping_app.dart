import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/routes/app_route.dart';
import 'core/routes/routes.dart';
import 'features/welcome/ui/welcome_screen.dart';
import 'generated/l10n.dart';

class SprintsShoppingApp extends StatefulWidget {
  const SprintsShoppingApp({super.key});

  @override
  State<SprintsShoppingApp> createState() => _SprintsShoppingAppState();
}

class _SprintsShoppingAppState extends State<SprintsShoppingApp> {
  Locale _currentLocale = const Locale("en");

  void toggleLocale() {
    setState(() {
      _currentLocale = _currentLocale.languageCode == "en" 
          ? const Locale("ar") 
          : const Locale("en");
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: _currentLocale,
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
      ),
      initialRoute: Routes.homeScreen,
      onGenerateRoute: AppRouter.onGenerateRoute,
      builder: (context, child) {
        // Pass the toggle function to all routes
        return child != null 
            ? InheritedLocale(
                toggleLocale: toggleLocale,
                child: child,
              )
            : const SizedBox.shrink();
      },
    );
  }
}

// InheritedWidget to pass locale toggle function down the widget tree
class InheritedLocale extends InheritedWidget {
  final VoidCallback toggleLocale;

  const InheritedLocale({
    super.key,
    required this.toggleLocale,
    required super.child,
  });

  static InheritedLocale? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<InheritedLocale>();
  }

  @override
  bool updateShouldNotify(InheritedLocale oldWidget) {
    return toggleLocale != oldWidget.toggleLocale;
  }
}
