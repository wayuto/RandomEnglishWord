import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/bigCard.dart';
import '../app/appState.dart';

class GeneratorPage extends StatelessWidget {
  const GeneratorPage({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pair = appState.current;

    IconData icon;
    if (appState.isFavorites(pair.first)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BigCard(pair: pair),
          SizedBox(height: 100),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  appState.toggleFavorite();
                },
                icon: Icon(icon),
                label: Text('Like'),
              ),

              SizedBox(width: 10),

              ElevatedButton.icon(
                onPressed: () {
                  appState.getNext();
                },
                icon: Icon(Icons.next_plan_outlined),
                label: Text("Next"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
