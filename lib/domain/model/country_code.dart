class CountryCode {
  String country;
  String code;
  String iso;

  CountryCode({
    required this.country,
    required this.code,
    required this.iso,
  });

  Map<String, dynamic> toMap() {
    return {
      'country': this.country,
      'code': this.code,
      'iso': this.iso,
    };
  }

  factory CountryCode.fromMap(Map<String, dynamic> map) {
    return CountryCode(
      country: map['country'] as String,
      code: map['code'] as String,
      iso: map['iso'] as String,
    );
  }
}
