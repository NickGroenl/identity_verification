// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navigation_theme.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NavigationTheme _$NavigationThemeFromJson(Map<String, dynamic> json) =>
    NavigationTheme(
      barStyle: $enumDecodeNullable(_$BarStyleEnumMap, json['barStyle']) ??
          BarStyle.white,
      isTranslucent: json['isTranslucent'] as bool? ?? true,
      hideBarButtonOnSuccessfulVerification:
          json['hideBarButtonOnSuccessfulVerification'] as bool? ?? false,
      barTintColor: ColorExtension.fromJson(json['barTintColor'] as String?),
      titleColor: ColorExtension.fromJson(json['titleColor'] as String?),
      barButtonItemColor:
          ColorExtension.fromJson(json['barButtonItemColor'] as String?),
    );

Map<String, dynamic> _$NavigationThemeToJson(NavigationTheme instance) =>
    <String, dynamic>{
      'barStyle': _$BarStyleEnumMap[instance.barStyle],
      'isTranslucent': instance.isTranslucent,
      'hideBarButtonOnSuccessfulVerification':
          instance.hideBarButtonOnSuccessfulVerification,
      'barTintColor': ColorExtension.toJson(instance.barTintColor),
      'titleColor': ColorExtension.toJson(instance.titleColor),
      'barButtonItemColor': ColorExtension.toJson(instance.barButtonItemColor),
    };

const _$BarStyleEnumMap = {
  BarStyle.white: 'white',
  BarStyle.black: 'black',
};
