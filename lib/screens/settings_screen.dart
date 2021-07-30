import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:provider/provider.dart';
import 'package:darttheme/model/theme_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context, listen: true);

    return SettingsList(
      sections: [
        SettingsSection(
          title: "MISC",
          tiles: [
            SettingsTile.switchTile(
                leading: Icon(Icons.dark_mode),
                title: "Dark Theme",
                onToggle: (bool value) {
                  themeNotifier.switchTheme();
                },
                switchValue: themeNotifier.getTheme() == ThemeMode.dark)
          ],
        ),
      ],
    );
  }
}
