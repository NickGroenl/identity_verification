import 'dart:ui';
import 'package:json_annotation/json_annotation.dart';
import 'color_extension.dart';

part 'view_theme.g.dart';
// part 'size_extension.g.dart';


@JsonSerializable(explicitToJson: true)
class ViewTheme {  

  /// Corner radius for image view on last screen with photo from document. Default is 20
  final double?  faceImageCornerRadius;
  /// Corner radius for all buttons. Default is 10
  final double?  buttonCornerRadius;
  /// Corner radius for action view. Default is 10
  final double?  actionViewCornerRadius;
  /// Corner radius for each step in action view. Default is 18
  final double?  actionStepCornerRadius;
  /// Corner radius for each step in action view. Default is 14
  final double?  resultsPersonImageCornerRadius;
  /// Shadow color for each step in action view. Default is nil
  @JsonKey(toJson: ColorExtension.toJson, fromJson: ColorExtension.fromJson)
  final Color? stepViewShadowColor;
  /// Shadow offset of layers shadow for each step in action view. Default is nil
  // @JsonKey(toJson: SizeExtension.toJson, fromJson: SizeExtension.fromJson)
  // final Size? stepViewShadowOffset;
  /// Shadow opacity of layers shadow for each step in action view. Default is nil
  final double?  stepViewShadowOpacity;
  /// Shadow blur radius for each step in action view. Default is nil
  final double?  stepViewShadowRadius;
  /// Height for all buttons. Default is 50
  final double?  buttonHeight;


  // ID Scanning

  /*
  * Instructions view corner radius
  *
  * Default: 6
  */
  final double? idInstructionsCornerRadius;

  /*
  * Flashlight warning corner radius
  *
  * Default: 4
  */
  final double? idFlashlightWarningCornerRadius;  

  factory ViewTheme.fromJson(Map<String, dynamic> json) =>
      _$ViewThemeFromJson(json);

  Map<String, dynamic> toJson() => _$ViewThemeToJson(this);

  const ViewTheme({
    this.faceImageCornerRadius, this.buttonCornerRadius, this.actionViewCornerRadius, this.actionStepCornerRadius, 
    this.resultsPersonImageCornerRadius, this.stepViewShadowColor, this.stepViewShadowOpacity, //this.stepViewShadowOffset,
    this.stepViewShadowRadius, this.buttonHeight, this.idInstructionsCornerRadius, this.idFlashlightWarningCornerRadius
  });

}


class ViewThemeBuilder {
  double faceImageCornerRadius = 20;
  double buttonCornerRadius = 10;
  double actionViewCornerRadius = 10;
  double actionStepCornerRadius = 18;
  double resultsPersonImageCornerRadius = 14;
  Color? stepViewShadowColor;
  // final Size? stepViewShadowOffset;
  double? stepViewShadowOpacity;
  double? stepViewShadowRadius;
  double buttonHeight = 50;

  ViewTheme build() {
    return ViewTheme(
        faceImageCornerRadius: faceImageCornerRadius, buttonCornerRadius:buttonCornerRadius, 
        actionViewCornerRadius:actionViewCornerRadius, actionStepCornerRadius:actionStepCornerRadius,
        resultsPersonImageCornerRadius:resultsPersonImageCornerRadius, stepViewShadowColor:stepViewShadowColor,
        stepViewShadowOpacity:stepViewShadowOpacity, stepViewShadowRadius:stepViewShadowRadius, buttonHeight:buttonHeight
    );
  }
}



/*
@JsonSerializable(explicitToJson: true)
class SizeExtension extends Size {
  const SizeExtension() : super(0.0, 0.0);

  factory SizeExtension.fromJson(Map<String, dynamic> json) =>
      _$SizeExtensionFromJson(json);

  Map<String, dynamic> toJson() => _$SizeExtensionToJson(this);

  // static int? toJson(FontWeight? weight) {
  //   if (weight != null) { 
  //     return weight.index;
  //   }
  //   return null;
  // }

  // static FontWeight? fromJson(int? index) {
  //   throw UnimplementedError();
  //   // if (index != null) { 
  //   //   return FontWeight._(index);
  //   // }
  //   // return null;
    
  // }
} */