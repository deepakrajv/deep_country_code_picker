import 'package:deep_country_code_picker/src/constants.dart';
import 'package:deep_country_code_picker/src/country.dart';
import 'package:flutter/material.dart';

class CountryCodePicker extends StatefulWidget {
  static List<Country> countries =
      countryCodes.map((json) => Country.fromJson(json)).toList();

  static Country? getCountry(String name) {
    final country = countries.firstWhere(
      (element) => (element.countryCode.toUpperCase() == name ||
          (element.dialCode == name) ||
          (element.name.toUpperCase() == name.toUpperCase())),
      orElse: () => Country(),
    );
    if (country.countryCode.isEmpty) {
      return null;
    }
    return country;
  }

  const CountryCodePicker({
    super.key,
    this.initialSelection,
    this.selectedItemBuilder,
    this.menuItemBuilder,
    this.onSelected,
    this.onInit,
    this.menuConstraints,
    this.menuBackgroundColor,
  });

  final Widget Function(BuildContext context, Country item)?
      selectedItemBuilder;

  final Widget Function(BuildContext context, Country item)? menuItemBuilder;

  final void Function(Country item)? onSelected;

  final void Function(Country item)? onInit;

  final BoxConstraints? menuConstraints;

  final Color? menuBackgroundColor;

  final String? initialSelection;

  @override
  State<CountryCodePicker> createState() => _CountryCodePickerState();
}

class _CountryCodePickerState extends State<CountryCodePicker> {
  late Country selectedCountry;
  final List<Country> elements = CountryCodePicker.countries;

  @override
  void initState() {
    if (widget.initialSelection != null) {
      final country = CountryCodePicker.getCountry(widget.initialSelection!);
      selectedCountry = country ?? elements.first;
    } else {
      selectedCountry = elements.first;
    }
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _onInit(selectedCountry);
  }

  @override
  void didUpdateWidget(CountryCodePicker oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialSelection != widget.initialSelection) {
      if (widget.initialSelection != null) {
        final country = CountryCodePicker.getCountry(widget.initialSelection!);
        selectedCountry = country ?? elements.first;
      } else {
        selectedCountry = elements.first;
      }
      _onInit(selectedCountry);
    }
  }

  void _onInit(Country countryCode) {
    widget.onInit?.call(countryCode);
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<Country>(
      clipBehavior: Clip.antiAlias,
      enableFeedback: true,
      constraints: widget.menuConstraints,
      enabled: true,
      color: widget.menuBackgroundColor,
      onSelected: (value) {
        setState(() {
          selectedCountry = value;
        });
        widget.onSelected?.call(value);
      },
      itemBuilder: (BuildContext context) {
        return elements
            .map(
              (e) => PopupMenuItem<Country>(
                value: e,
                child: widget.menuItemBuilder != null
                    ? widget.menuItemBuilder!.call(context, e)
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              e.flag,
                              style: TextStyle(fontSize: 25),
                            ),
                            const SizedBox(
                              width: 8.0,
                            ),
                            Flexible(
                              child: Text(
                                e.name,
                              ),
                            ),
                            const SizedBox(
                              width: 8.0,
                            ),
                            Text(
                              '(${e.dialCode})',
                            ),
                          ],
                        ),
                      ),
              ),
            )
            .toList();
      },
      child: widget.selectedItemBuilder != null
          ? widget.selectedItemBuilder!.call(context, selectedCountry)
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    selectedCountry.flag,
                    style: TextStyle(fontSize: 25),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Text(
                    selectedCountry.dialCode,
                  ),
                ],
              ),
            ),
    );
  }
}
