import 'package:json_annotation/json_annotation.dart';

part 'localization_theme.g.dart';

@JsonSerializable(explicitToJson: true)
class LocalizationTheme {
  final String localizationFileName;
  final String faceTecLocalizationFileName;

  const LocalizationTheme(
      {required this.localizationFileName,
      required this.faceTecLocalizationFileName,
    });

  factory LocalizationTheme.fromJson(Map<String, dynamic> json) =>
      _$LocalizationThemeFromJson(json);

  Map<String, dynamic> toJson() => _$LocalizationThemeToJson(this);
}

class LocalizationThemeBuilder {
  String localizationFileName = '';
  String faceTecLocalizationFileName = '';

  LocalizationTheme build() {
    return LocalizationTheme(
        localizationFileName: localizationFileName,
        faceTecLocalizationFileName: faceTecLocalizationFileName);
  }
}
