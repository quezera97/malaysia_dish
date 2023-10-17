import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';
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
  final String packageName = 'com.malaysia.recipe';

  Future<void> _shareApp() async {
    String url = 'https://play.google.com/store/apps/details?id=$packageName';

    if (await canLaunchUrl(Uri.parse(url))) {
      await Share.share(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.5),
              child: Column(
                children: [
                  const Center(
                    child: Image(
                      image: AssetImage('lib/assets/launcher_icon.png'),
                      height: 200,
                      width: 200,
                    ),
                  ),
                  const Center(
                    child: ListTile(
                      title: Center(
                        child: Text(
                          'Build Version: 1.0.0',
                          style: TextStyle(fontSize: 16.0),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: ListTile(
                      title: const Text('Theme Mode'),
                      trailing: DayNightSwitcher(
                        isDarkModeEnabled:
                            context.read<ThemeProvider>().isDarkModeEnabled,
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
                        'Share & Recommend',
                        style: TextStyle(fontSize: 16.0),
                        textAlign: TextAlign.left,
                      ),
                      onTap: _shareApp,
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
          ],
        ),
      ),
    );
  }
}
