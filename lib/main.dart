import 'package:flutter/material.dart';
import 'package:mis_notas/providers/SemesterInfoProvider.dart';
import 'package:mis_notas/screens/SubjectNotesScreen.dart';
import 'package:mis_notas/screens/HomeScreen.dart';
import 'package:provider/provider.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: ( _ )=> SemesterInfoProvider(),)],
      child: MyApp(),
    );
  }
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Notas App",
      initialRoute: 'home',
      routes: {
        'home': (_) => HomeScreen(),
        'subject-notes': (_) => SubjectNotesScreen(),
      },
      theme: ThemeData.light().copyWith(
          appBarTheme: AppBarTheme(
        color: Colors.green,
      )),
    );
  }
}
