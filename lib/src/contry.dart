class Country {
  final String name;

  final String dialCode;

  final String countryCode;

  String get flag {
    final int firstLetter = countryCode.codeUnitAt(0) - 0x41 + 0x1F1E6;
    final int secondLetter = countryCode.codeUnitAt(1) - 0x41 + 0x1F1E6;
    return String.fromCharCode(firstLetter) + String.fromCharCode(secondLetter);
  }

  Country({
    this.name = '',
    this.countryCode = '',
    this.dialCode = '',
  });

  @override
  String toString() => name;

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      name: json['name'] ?? '',
      countryCode: json['iso2_cc'] ?? '',
      dialCode: json['dial_code'] ?? '',
    );
  }

  @override
  bool operator ==(Object other) {
    return (other is Country) && other.countryCode == countryCode;
  }

  @override
  int get hashCode => countryCode.hashCode;
}
