import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BigCard extends StatelessWidget {
  const BigCard({super.key, required this.pair});

  final WordPair pair;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );

    return Card(
      color: theme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: TextButton(
          onPressed: () async {
            var url =
                "https://dictionary.cambridge.org/zhs/%E8%AF%8D%E5%85%B8/%E8%8B%B1%E8%AF%AD-%E6%B1%89%E8%AF%AD-%E7%AE%80%E4%BD%93/${pair.first}";
            if (await canLaunchUrl(Uri.parse(url))) {
              await launchUrl(Uri.parse(url));
            } else {
              throw Exception("Failed to launcher a web page.");
            }
          },
          child: Text(pair.first, style: style),
        ),
      ),
    );
  }
}
