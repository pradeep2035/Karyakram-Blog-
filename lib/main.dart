import 'package:events/providers/home_provider.dart';
import 'package:events/providers/search_provider.dart';
import 'package:events/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeDataProvider>(
            create: (_) => HomeDataProvider()),
        ChangeNotifierProvider<EventProvider>(create: (_) => EventProvider())
      ],
      child: const MaterialApp(
        title: 'The Internet Folks',
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
