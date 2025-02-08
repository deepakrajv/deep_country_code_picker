#### What is DeepCountryCodePicker?

It’s a Flutter package which can be used to pick country codes, it requires a minimal amount of code to customize menu items and selected item.

## Features

Can be customize the selected and listed items.

## Installing
Add DeepCountryCodePicker to your pubspec.yaml file:

```dart
dependencies:
  deep_country_code_picker:
```
Import DeepRoute in files that it will be used:
```dart
import 'package:deep_country_code_picker/deep_country_code_picker.dart';
```

## Usage

For sample code look in `/example` folder.

Step 1: Add "DeepMaterialApp" before your MaterialApp, use DeepMaterialApp instead of MaterialApp

```dart
CountryCodePicker(
  selectedItemBuilder: (context, item) => Text(item.flag),
  menuItemBuilder: (context, item) => Text(item.name),
)
```

## Additional information

This package is in its early development stage
