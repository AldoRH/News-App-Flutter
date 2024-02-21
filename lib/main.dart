import 'package:flutter/material.dart';

import 'package:news_app/providers/providers.dart';
import 'package:news_app/screens/screens.dart';
import 'package:news_app/services/news_service.dart';
import 'package:news_app/theme/app_theme.dart';

import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = MediaQuery.of(context).platformBrightness == Brightness.dark;

    final theme = isDarkMode ? AppTheme.darkTheme : AppTheme.lightTheme;
    
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ( _ ) => UiProvider()),
        ChangeNotifierProvider(create: ( _ ) => NewsService()),
        ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        home: const TabsScreen(),
        theme: theme,
      ),
    );
  }
}