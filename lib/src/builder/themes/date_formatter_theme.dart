import 'package:json_annotation/json_annotation.dart';

part 'date_formatter_theme.g.dart';

@JsonSerializable()
class DateFormatterTheme { 
  /// Custom date format. By default, date will be shown as dd MMM yyyy. Example: 10 Sep 1989
  /// You can specify custom format. Example: dd.MM.yyyy.
  final String? customDateFormat;

  const DateFormatterTheme({
    this.customDateFormat
  });

  factory DateFormatterTheme.fromJson(Map<String, dynamic> json) =>
      _$DateFormatterThemeFromJson(json);

  Map<String, dynamic> toJson() => _$DateFormatterThemeToJson(this);
}

class DateFormatterThemeBuilder {
  String? customDateFormat = 'dd MMM yyyy';

  DateFormatterTheme build() {
    return DateFormatterTheme(
        customDateFormat: customDateFormat
    );
  }
}