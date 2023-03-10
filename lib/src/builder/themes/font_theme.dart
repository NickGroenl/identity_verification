import 'package:json_annotation/json_annotation.dart';
import 'font.dart';

part 'font_theme.g.dart';

@JsonSerializable(explicitToJson: true)
class FontTheme {   
  /// By default 17 semibold
  final Font? navigationBarTitleFont;
  /// By default 17 semibold
  final Font? buttonFont;
  /// By default 17 regular
  final Font? dataCaptionFont;
  /// By default 13 semibold
  final Font? dataTitleFont;
  /// By default 20 bold
  final Font? dataHeaderFont;
  /// By default 20 medium
  final Font? titleFont;
  /// By default 18 bold
  final Font? buttonStartFont;
  /// By default 18 medium
  final Font? stepTitleFont;
  /// By default 18 semibold
  final Font? stepNumberFont;
  /// By default 16 regular
  final Font? secondaryLabelFont;

  /// By default 20 regular. Only font family and weight can be customized. Size is ignored
  final Font? faceTecMessageFont;
  /// By default 29 medium. Only font family and weight can be customized. Size is ignored
  final Font? faceTecHeaderFont;
  /// By default 15 regular. Only font family and weight can be customized. Size is ignored
  final Font? faceTecSubtextFont;
  /// By default 17 semibold. Only font family and weight can be customized. Size is ignored
  final Font? faceTecButtonFont;

  // ID Scanning

  /*
   * Intructions text font
   *
   * Default: System 17.f
   */
  final Font? idInstructionsFont;

  /*
   * Flashlight warning font
   *
   * Default: System (iPhone - 14pt, iPad - 16pt)
   */
  final Font? idFlashlightWarningFont;

  const FontTheme({
    this.navigationBarTitleFont, this.buttonFont, this.dataCaptionFont, this.dataTitleFont, this.dataHeaderFont, this.titleFont,
    this.buttonStartFont, this.stepTitleFont, this.stepNumberFont, this.secondaryLabelFont, this.faceTecMessageFont, 
    this.faceTecHeaderFont, this.faceTecSubtextFont, this.faceTecButtonFont, this.idInstructionsFont, this.idFlashlightWarningFont
  });

  factory FontTheme.fromJson(Map<String, dynamic> json) =>
      _$FontThemeFromJson(json);

  Map<String, dynamic> toJson() => _$FontThemeToJson(this);
}

/*

/// Method used to change all fonts with font family name, without need to change every font
- (void)setupCustomFontFamily:(NSString *)fontFamily;
 */


class FontThemeBuilder {
  Font? navigationBarTitleFont;
  Font? buttonFont;
  Font? dataCaptionFont;
  Font? dataTitleFont;
  Font? dataHeaderFont;
  Font? titleFont;
  Font? buttonStartFont;
  Font? stepTitleFont;
  Font? stepNumberFont;
  Font? secondaryLabelFont;

  Font? faceTecMessageFont;
  Font? faceTecHeaderFont;
  Font? faceTecSubtextFont;
  Font? faceTecButtonFont;
  
  Font? idInstructionsFont;
  Font? idFlashlightWarningFont;

  FontTheme build() {
    return FontTheme(
        navigationBarTitleFont: navigationBarTitleFont, buttonFont: buttonFont, dataCaptionFont:dataCaptionFont,
        dataTitleFont:dataTitleFont, dataHeaderFont:dataHeaderFont, titleFont:titleFont, buttonStartFont:buttonStartFont,
        stepTitleFont:stepTitleFont, stepNumberFont:stepNumberFont, secondaryLabelFont:secondaryLabelFont,
        faceTecMessageFont:faceTecMessageFont, faceTecHeaderFont:faceTecHeaderFont, faceTecSubtextFont:faceTecSubtextFont,
        faceTecButtonFont:faceTecButtonFont, idInstructionsFont:idInstructionsFont, idFlashlightWarningFont:idFlashlightWarningFont  );
  }
}
