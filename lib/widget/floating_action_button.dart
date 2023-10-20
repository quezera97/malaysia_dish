import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FloatButtonWidget extends StatefulWidget {
  final String? url;

  const FloatButtonWidget({super.key, this.url});

  @override
  State<FloatButtonWidget> createState() => _FloatButtonWidgetState();
}

class _FloatButtonWidgetState extends State<FloatButtonWidget> {
  List<String> existingList = [];
  bool changeToRemoveFavButton = false;
  late SharedPreferences _prefs;

  @override
  void initState() {
    super.initState();
    initSharedPreferences();
  }

  Future<void> initSharedPreferences() async {
    _prefs = await SharedPreferences.getInstance();
    checkExistingUrl();
  }

  void checkExistingUrl() {
    existingList = _prefs.getStringList('dishUrl') ?? [];

    if (existingList.contains(widget.url)) {
      setState(() {
        changeToRemoveFavButton = true;
      });
    }
  }

  Future<void> addToFav(String? url) async {
    if (url == null) {
      return;
    }

    if (!existingList.contains(url)) {
      existingList.add(url);

      await _prefs.setStringList('dishUrl', existingList);
    }
  }

  void popNavigator() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: FloatingActionButton(
        backgroundColor: Colors.redAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        onPressed: () {
          checkExistingUrl();
          showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  if (changeToRemoveFavButton) ...[
                    ListTile(
                      leading: const Icon(Icons.heart_broken),
                      title: const Text('Remove from Favorites'),
                      onTap: () async {
                        if (existingList.contains(widget.url)) {
                          existingList.remove(widget.url);

                          await _prefs.setStringList('dishUrl', existingList);
                        }

                        setState(() {
                          changeToRemoveFavButton = false;
                        });

                        popNavigator();
                      },
                    ),
                  ] else ...[
                    ListTile(
                      leading:
                          const Icon(Icons.favorite, color: Colors.redAccent),
                      title: const Text('Add to Favorites',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      onTap: () {
                        if (widget.url != null) {
                          addToFav(widget.url);
                        }

                        setState(() {
                          changeToRemoveFavButton = true;
                        });

                        popNavigator();
                      },
                    ),
                  ],
                  ListTile(
                    leading: const Icon(Icons.share, color: Colors.black),
                    title: const Text('Share',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    onTap: () {
                      if (widget.url != null) {
                        Share.share(widget.url!);
                      }
                      Navigator.pop(context);
                    },
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.favorite, color: Colors.white),
      ),
    );
  }
}
