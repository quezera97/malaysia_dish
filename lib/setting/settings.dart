import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:day_night_switcher/day_night_switcher.dart';
import '../widget/alert_pop_up.dart';
import '../widget/theme_provider.dart';
import 'join_text_about_us.dart';
import 'join_text_policy.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.5),
            child: Column(
              children: [
                Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: ListTile(
                    title: const Text('Theme Mode'),
                    trailing: DayNightSwitcher(
                      isDarkModeEnabled: context.read<ThemeProvider>().isDarkModeEnabled,
                      onStateChanged: (value) {
                        context.read<ThemeProvider>().toggleTheme();
                      },
                    ),
                  ),
                ),
                Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: ListTile(
                    title: const Text(
                      'About Us',
                      style: TextStyle(fontSize: 16.0),
                      textAlign: TextAlign.left,
                    ),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertPopUp(
                            titleAlert: 'QueZ Apps',
                            contentAlert: joinedTextAboutUs(),
                          );
                        },
                      );
                    },
                  ),
                ),
                Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: ListTile(
                    title: const Text(
                      'Privacy Policy',
                      style: TextStyle(fontSize: 16.0),
                      textAlign: TextAlign.left,
                    ),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertPopUp(
                            titleAlert: 'Privacy Policy',
                            contentAlert: joinedTextPrivacyPolicy(),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: const Center(
                child: Text(
                  'Build Version: 1.0.0',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromARGB(255, 70, 70, 70),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
