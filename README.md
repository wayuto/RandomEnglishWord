# Random Flutter App

A simple Flutter application for generating random English word pairs, with features for favoriting, viewing, and translating words.

## Features

- **Random Word Generation**: Tap a button to generate new English word pairs.
- **Favorites**: Add your favorite words to a favorites list.
- **Favorites Management**: View, remove, or clear your favorite words.
- **Word Translation**: Tap a word to open its translation in the Cambridge Dictionary.
- **Responsive Layout**: Adapts to different screen sizes.

## Project Structure

```
lib/
  main.dart                // App entry point
  app/
    app.dart               // App theme and root widget
    appState.dart          // State management
  pages/
    homePage.dart          // Main navigation page
    generatorPage.dart     // Random word generator page
    favorites.dart         // Favorites page
  widgets/
    bigCard.dart           // Word display card widget
```

## Dependencies

- [flutter](https://flutter.dev/)
- [provider](https://pub.dev/packages/provider)
- [english_words](https://pub.dev/packages/english_words)
- [shared_preferences](https://pub.dev/packages/shared_preferences)
- [url_launcher](https://pub.dev/packages/url_launcher)

## Getting Started

1. **Clone the repository**
    ```bash
    git clone https://github.com/wayuto/RandomEnglishWord.git
    cd random
    ```

2. **Install dependencies**
    ```bash
    flutter pub get
    ```

3. **Run the app**
    ```bash
    flutter run
    ```

## Screenshots

> Add screenshots of your app here.

## License

MIT

---

Feel free to open issues or submit pull requests!