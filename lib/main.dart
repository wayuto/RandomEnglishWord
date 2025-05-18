import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app/app.dart';
import 'app/appState.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appState = MyAppState();
  await appState.init();
  runApp(ChangeNotifierProvider(create: (context) => appState, child: MyApp()));
}
