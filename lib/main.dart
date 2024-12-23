import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tourr/post_list_screen.dart';
import 'LocalizationProvider.dart';
import 'login_screen.dart';


void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => LocalizationProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var locale = Provider.of<LocalizationProvider>(context);

    return MaterialApp(
      title: 'Tour du lịch App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      locale: Locale(locale.languageCode),
      home: LoginScreen(),
    );
  }
}
