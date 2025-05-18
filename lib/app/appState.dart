import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();
  var favorites = <String>[];

  late SharedPreferences prefs;

  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
    await loadFavorites();
  }

  Future<void> loadFavorites() async {
    final savedFavorites = prefs.getStringList("favorites");
    if (savedFavorites != null) {
      favorites = savedFavorites;
    }
    notifyListeners();
  }

  Future<void> saveFavorites() async {
    await prefs.setStringList("favorites", favorites);
  }

  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }

  Future<void> toggleFavorite() async {
    if (favorites.contains(current.first)) {
      favorites.remove(current.first);
    } else {
      favorites.add(current.first);
    }
    await saveFavorites();
    notifyListeners();
  }

  Future<void> clearFavorites() async {
    favorites.clear();
    await saveFavorites();
    notifyListeners();
  }

  Future<void> removeFavorite(String word) async {
    favorites.remove(word);
    await saveFavorites();
    notifyListeners();
  }

  bool isFavorites(String word) {
    return favorites.contains(word);
  }
}
