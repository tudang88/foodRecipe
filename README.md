# Find Recipe

Flutter Sample /Riverpod 2.x

## Premise
T.B.D

## Concepts demonstrated

- [Flutter Riverpod Architecture](https://codewithandrea.com/articles/flutter-app-architecture-riverpod-introduction/)
  - Presentation, Application, Domain and Data Layers.
- Freezed Code Generation
- Riverpod Provider Generation
- Retrofit API calls, `toJson` function Generation.

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials, samples, guidance on
mobile development, and a full API reference.

## How to build
- run below command
```
flutter pub get
flutter packages pub run build_runner build --delete-conflicting-outputs
```

## Run 
### Android Studio
Launch Configurations are included in the `.run` folder. 

### Run iOS/Android using Visual Studio


### run iOS/Android From terminal

```
- flutter run --flavor Development -t lib/main/main_development.dart
```

### run iOS using xcode


## Sample Tests

### How to Run

`flutter test`

### Sample Unit Tests


#### "If Response Data is Null, model list should be empty"


#### "If Response Data is not null, model list should not be empty"


### Sample UI Tests


#### Should display 2 Top Anime Widgets


## Localization
- ref https://docs.flutter.dev/development/accessibility-and-localization/internationalization
- define localization string file in app_en.arb, app_ja.arb it will be automatically generated to use.
- use example - AppLocalizations.of(context)!.home_tab_profile