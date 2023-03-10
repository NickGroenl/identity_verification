import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../configuration/builders.dart';
import 'color_extension.dart';

part 'color_theme.g.dart';

@JsonSerializable(explicitToJson: true)
class ColorTheme {
  /// By default blue
  @JsonKey(toJson: ColorExtension.toJson, fromJson: ColorExtension.fromJson)
  Color? primaryColor;

  // By default dark gray
  @JsonKey(toJson: ColorExtension.toJson, fromJson: ColorExtension.fromJson)
  Color? stepCaptionColor;

  // By default light gray
  @JsonKey(toJson: ColorExtension.toJson, fromJson: ColorExtension.fromJson)
  Color? stepDisabledColor;

  // By default green
  @JsonKey(toJson: ColorExtension.toJson, fromJson: ColorExtension.fromJson)
  Color? successColor;

  // By default lime
  @JsonKey(toJson: ColorExtension.toJson, fromJson: ColorExtension.fromJson)
  Color? highlightColor;

  // By default transparent green
  @JsonKey(toJson: ColorExtension.toJson, fromJson: ColorExtension.fromJson)
  Color? stepBackgroundSuccessColor;

  // By default red
  @JsonKey(toJson: ColorExtension.toJson, fromJson: ColorExtension.fromJson)
  Color? errorColor;

  // By default primary color
  @JsonKey(toJson: ColorExtension.toJson, fromJson: ColorExtension.fromJson)
  Color? buttonBackgroundEnabledColor;

  // By default light gray
  @JsonKey(toJson: ColorExtension.toJson, fromJson: ColorExtension.fromJson)
  Color? buttonBackgroundDisabledColor;

  // By default white
  @JsonKey(toJson: ColorExtension.toJson, fromJson: ColorExtension.fromJson)
  Color? buttonTextDisabledColor;

  // By default white
  @JsonKey(toJson: ColorExtension.toJson, fromJson: ColorExtension.fromJson)
  Color? buttonTextEnabledColor;

  // By default white in light and black in dark mode
  @JsonKey(toJson: ColorExtension.toJson, fromJson: ColorExtension.fromJson)
  Color? defaultBackgroundColor;

  // By default white in light and black in dark mode
  @JsonKey(toJson: ColorExtension.toJson, fromJson: ColorExtension.fromJson)
  Color? stepBackgroundColor;

  // By default navy blue in light and white in dark mode
  @JsonKey(toJson: ColorExtension.toJson, fromJson: ColorExtension.fromJson)
  Color? labelColor;

  // By default medium gray
  @JsonKey(toJson: ColorExtension.toJson, fromJson: ColorExtension.fromJson)
  Color? secondaryLabelColor;

  // By default light blue
  @JsonKey(toJson: ColorExtension.toJson, fromJson: ColorExtension.fromJson)
  Color? reviewDataEditBannerBackgroundColor;

  // By default black
  @JsonKey(toJson: ColorExtension.toJson, fromJson: ColorExtension.fromJson)
  Color? reviewDataEditBannerTextColor;

  // By default white\
  @JsonKey(toJson: ColorExtension.toJson, fromJson: ColorExtension.fromJson)
  Color? stepLabelColor;

  // By default blue in light and lime in dark mode
  @JsonKey(toJson: ColorExtension.toJson, fromJson: ColorExtension.fromJson)
  Color? alertColor;

  // By default lime
  @JsonKey(toJson: ColorExtension.toJson, fromJson: ColorExtension.fromJson)
  Color? needsReviewColor;

  // ID Scanning

  /*
   * Instructions text color
   *
   * Default: white
  */
  @JsonKey(toJson: ColorExtension.toJson, fromJson: ColorExtension.fromJson)
  Color? idInstructionsTextColor;

  /*
   * Flashlight warning background color
   *
   * Default: #3A3A3C
  */
  @JsonKey(toJson: ColorExtension.toJson, fromJson: ColorExtension.fromJson)
  Color? idFlashlightWarningBackgroundColor;

  /*
   * Flashlight warning text color
   *
   * Default: white
  */
  @JsonKey(toJson: ColorExtension.toJson, fromJson: ColorExtension.fromJson)
  Color? idFlashlightWarningTextColor;

  /*
   * Reticle error color
   *
   * Default: red alpha .4f
  */
  @JsonKey(toJson: ColorExtension.toJson, fromJson: ColorExtension.fromJson)
  Color? idReticleErrorColor;

  // FaceTec

  // By default blue
  @JsonKey(toJson: ColorExtension.toJson, fromJson: ColorExtension.fromJson)
  Color? faceTecPrimaryColor;

  // By default blue
  @JsonKey(toJson: ColorExtension.toJson, fromJson: ColorExtension.fromJson)
  Color? faceTecLoadingBarRailColor;

  // By default navy blue
  @JsonKey(toJson: ColorExtension.toJson, fromJson: ColorExtension.fromJson)
  Color? faceTecMainTextColor;

  // By default gray
  @JsonKey(toJson: ColorExtension.toJson, fromJson: ColorExtension.fromJson)
  Color? faceTecSubtextColor;

  // By default white
  @JsonKey(toJson: ColorExtension.toJson, fromJson: ColorExtension.fromJson)
  Color? faceTecButtonTextColor;

  // By default white/transparent
  @JsonKey(toJson: ColorExtension.toJson, fromJson: ColorExtension.fromJson)
  Color? faceTecOvalColor;

  // By default blue, 50% transparent
  @JsonKey(toJson: ColorExtension.toJson, fromJson: ColorExtension.fromJson)
  Color? faceTecOvalProgressColor;

  // By default black
  @JsonKey(toJson: ColorExtension.toJson, fromJson: ColorExtension.fromJson)
  Color? faceTecFeedbackBarBackgroundColor;

  // By default white
  @JsonKey(toJson: ColorExtension.toJson, fromJson: ColorExtension.fromJson)
  Color? faceTecFeedbackBarTextColor;

  // By default black
  @JsonKey(toJson: ColorExtension.toJson, fromJson: ColorExtension.fromJson)
  Color? faceTecResultAnimationCheckmarkForegroundColor;

  ColorTheme(
      {this.primaryColor,
      this.stepCaptionColor,
      this.stepDisabledColor,
      this.successColor,
      this.highlightColor,
      this.stepBackgroundSuccessColor,
      this.errorColor,
      this.buttonBackgroundEnabledColor,
      this.buttonBackgroundDisabledColor,
      this.buttonTextDisabledColor,
      this.buttonTextEnabledColor,
      this.defaultBackgroundColor,
      this.stepBackgroundColor,
      this.labelColor,
      this.secondaryLabelColor,
      this.reviewDataEditBannerBackgroundColor,
      this.reviewDataEditBannerTextColor,
      this.stepLabelColor,
      this.alertColor,
      this.needsReviewColor,
      this.idInstructionsTextColor,
      this.idFlashlightWarningBackgroundColor,
      this.idFlashlightWarningTextColor,
      this.idReticleErrorColor,
      this.faceTecPrimaryColor,
      this.faceTecLoadingBarRailColor,
      this.faceTecMainTextColor,
      this.faceTecSubtextColor,
      this.faceTecButtonTextColor,
      this.faceTecOvalColor,
      this.faceTecOvalProgressColor,
      this.faceTecFeedbackBarBackgroundColor,
      this.faceTecFeedbackBarTextColor,
      this.faceTecResultAnimationCheckmarkForegroundColor});

  factory ColorTheme.fromJson(Map<String, dynamic> json) =>
      _$ColorThemeFromJson(json);

  Map<String, dynamic> toJson() => _$ColorThemeToJson(this);
}
