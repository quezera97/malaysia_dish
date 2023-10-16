import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ui/splash_screen.dart';
import 'widget/theme_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      title: 'Malaysian Dish',
      debugShowCheckedModeBanner: false,
      theme: themeProvider.currentTheme,
      routes: {
        '/': (context) => const SplashScreen(),
      },
    );
  }
}
