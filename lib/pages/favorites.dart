import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:provider/provider.dart';
import '../app/appState.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePage();
}

class _FavoritePage extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    if (appState.favorites.isEmpty) {
      return Center(child: Text("No favorites yet..."));
    }

    return ListView(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text("You have ${appState.favorites.length} favorites:"),
            ),

            Spacer(),

            Padding(
              padding: const EdgeInsets.all(10),
              child: ElevatedButton.icon(
                onPressed: () async {
                  var result = await showDialog(
                    context: context,
                    builder: (context) {
                      return SimpleDialog(
                        title: Text("Are you sure?"),
                        children: [
                          SimpleDialogOption(
                            child: Text("Yes"),
                            onPressed: () {
                              Navigator.pop(context, true);
                            },
                          ),
                          SimpleDialogOption(
                            child: Text("Cancel"),
                            onPressed: () {
                              Navigator.pop(context, false);
                            },
                          ),
                        ],
                      );
                    },
                  );
                  result ? appState.clearFavorites() : DoNothingAction();
                },
                icon: Icon(Icons.clear),
                label: Text("Clear"),
              ),
            ),
          ],
        ),
        for (var pair in appState.favorites)
          ListTile(
            onTap: () async {
              // appState.favorites.remove(pair);
              var result = await showDialog(
                context: context,
                builder: (context) {
                  return SimpleDialog(
                    title: Text("Choose an option: "),
                    children: [
                      SimpleDialogOption(
                        child: Text("Translate"),
                        onPressed: () {
                          Navigator.pop(context, "t");
                        },
                      ),
                      Divider(),

                      SimpleDialogOption(
                        child: Text("Remove"),
                        onPressed: () {
                          Navigator.pop(context, "r");
                        },
                      ),
                      Divider(),

                      SimpleDialogOption(
                        child: Text("Cancel"),
                        onPressed: () {
                          Navigator.pop(context, "c");
                        },
                      ),
                    ],
                  );
                },
              );

              switch (result) {
                case "t":
                  {
                    var url =
                        "https://dictionary.cambridge.org/zhs/%E8%AF%8D%E5%85%B8/%E8%8B%B1%E8%AF%AD-%E6%B1%89%E8%AF%AD-%E7%AE%80%E4%BD%93/$pair";
                    if (await canLaunchUrl(Uri.parse(url))) {
                      await launchUrl(Uri.parse(url));
                    } else {
                      throw Exception("Failed to launcher a web page.");
                    }
                    break;
                  }
                case "r":
                  {
                    appState.removeFavorite(pair);
                    break;
                  }
                case "c":
                  {
                    DoNothingAction();
                    break;
                  }
              }
              setState(() {});
            },
            leading: Icon(Icons.favorite),
            title: Text(pair),
          ),
      ],
    );
  }
}
