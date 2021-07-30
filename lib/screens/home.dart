import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:darttheme/model/theme_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeMode = Provider.of<ThemeNotifier>(context, listen: false).getTheme();

    return Text("$themeMode");
  }
}
