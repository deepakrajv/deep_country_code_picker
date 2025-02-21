#### What is DeepCountryCodePicker?

It’s a Flutter package which can be used to pick country codes, it requires a minimal amount of code to customize menu items and selected item.

## Features

Can be customize the selected and listed items.

<img src="https://raw.githubusercontent.com/deepakrajv/deep_country_code_picker/main/screenshots/deep_country_code_picker.gif" width="240"/>

## Installing
Add DeepCountryCodePicker to your pubspec.yaml file:

```dart
dependencies:
  deep_country_code_picker:
```
Import `CountryCodePicker` in files that it will be used:
```dart
import 'package:deep_country_code_picker/deep_country_code_picker.dart';
```

## Usage

For sample code look in `/example` folder.

```dart
CountryCodePicker(
  selectedItemBuilder: (context, item) => Text(item.flag),
  menuItemBuilder: (context, item) => Text(item.name),
)
```
Pass `null` in `selectedItemBuilder` and `selectedItemBuilder` to get default style.

### Validate Phone Numbers

```dart
final bool validation = CountryCodePicker.validateMobile(phoneNumber);
```
Using this method we can validate international phone number

## Additional information

This package is in its early development stage
