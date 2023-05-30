// ignore_for_file: public_member_api_docs, lines_longer_than_80_chars
import 'package:ai_trade/src/imports.dart';
import 'package:ai_trade/src/model/gold_summary_model.dart';
import 'package:ai_trade/src/model/main-model.dart';
import 'package:ai_trade/src/model/settings_model.dart';
import 'package:ai_trade/src/model/user-model.dart';
import 'package:ai_trade/src/model/user-profile-model.dart';
import 'package:ai_trade/src/pages/home-page.dart';


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    /// Providers are above [MyApp] instead of inside it, so that tests
    /// can use [MyApp] while mocking the providers
    MultiProvider(
      providers: [
        ChangeNotifierProvider<MainModel>(create: (_) => MainModel()),
        ChangeNotifierProvider<UserModel>(create: (_) => UserModel()),
        ChangeNotifierProvider<SettingsModel>(create: (_) => SettingsModel(hostname: '192.168.2.39:5000')),
        ChangeNotifierProvider<GoldSummaryModel>(create: (_) => GoldSummaryModel()),
        ChangeNotifierProvider<UserProfileModel>(create: (_) => UserProfileModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'AI Trade',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => Splash(),
          '/home': (context) => const HomePage(title: 'AITrade'),
          '/login': (context) => LoginPage(),
          '/signup': (context) => SignupPage(),
          '/home1': (context) => MainView(initRoute: 0.toString()),
          '/settings': (context) => SettingsPage(),
          '/edit-profile': (context) => ProfileEditPage(),
          '/gold-summary': (context) => GoldSummaryPage(),
          '/euro-summary': (context) => EuroSummaryPage(),
          '/economic-calendar': (context) => EconomicCalendarView(url: 'https://www.forexfactory.com/calendar'),
        },
      );
  }
}
