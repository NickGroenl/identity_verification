import 'dart:ui';

import 'package:json_annotation/json_annotation.dart';

import 'color_extension.dart';

part 'navigation_theme.g.dart';

@JsonEnum()
enum BarStyle {
  white, //default
  black
}

@JsonSerializable()
class NavigationTheme {  
  /*
   * Used for customization of UIBarStyle.
   *
   * Default: white
   */
  final BarStyle? barStyle;

  /*
   * Used for customization translucentcy of NavigationBar.
   *
   * Default: true
   */
  final bool isTranslucent;

  /*
  * This will only be applied to the Close bar button item on the last screen when verification is successful.
  * In a case of failure, the Close button will always be shown.
  *
  * Default: false
  */
  final bool hideBarButtonOnSuccessfulVerification;

  /// Used for customization bar tint color of NavigationBar.
  @JsonKey(toJson: ColorExtension.toJson, fromJson: ColorExtension.fromJson)
  final Color? barTintColor;

  /// Used for customization title color in NavigationBar.
  @JsonKey(toJson: ColorExtension.toJson, fromJson: ColorExtension.fromJson)
  final Color? titleColor;

  /// Used for customization bar button tint color of NavigationBar.
  @JsonKey(toJson: ColorExtension.toJson, fromJson: ColorExtension.fromJson)
  final Color? barButtonItemColor;

  const NavigationTheme({
    this.barStyle = BarStyle.white, this.isTranslucent = true, this.hideBarButtonOnSuccessfulVerification = false, 
    this.barTintColor, this.titleColor,this.barButtonItemColor
  });

  factory NavigationTheme.fromJson(Map<String, dynamic> json) =>
      _$NavigationThemeFromJson(json);

  Map<String, dynamic> toJson() => _$NavigationThemeToJson(this);


}

class NavigationThemeBuilder {
  BarStyle barStyle = BarStyle.white;
  bool isTranslucent = true;
  bool hideBarButtonOnSuccessfulVerification = false; 
  Color? barTintColor;
  Color? titleColor;
  Color? barButtonItemColor;

  NavigationTheme build() {
    return NavigationTheme(
        barStyle: barStyle,
        isTranslucent: isTranslucent,
        hideBarButtonOnSuccessfulVerification:hideBarButtonOnSuccessfulVerification,
        barTintColor:barTintColor,
        titleColor:titleColor,
        barButtonItemColor:barButtonItemColor);
  }
}