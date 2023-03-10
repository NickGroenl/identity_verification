import 'package:json_annotation/json_annotation.dart'; 
import 'dart:ui';

part 'font.g.dart';

@JsonSerializable()
class Font {
  // final String? fontFamily;
  final double? fontSize;
  // final FontStyle? fontStyle;
  @JsonKey(toJson: FontWeightExtension.toJson, fromJson: FontWeightExtension.fromJson)
  final FontWeight? fontWeight;

  const Font({
    this.fontSize, this.fontWeight
  }); 

  factory Font.fromJson(Map<String, dynamic> json) =>
      _$FontFromJson(json);

  Map<String, dynamic> toJson() => _$FontToJson(this);

}

class FontWeightExtension {
  const FontWeightExtension();

  static int? toJson(FontWeight? weight) {
    if (weight != null) { 
      return weight.index;
    }
    return null;
    
  }

  static FontWeight? fromJson(int? index) {
    throw UnimplementedError();
    // if (index != null) { 
    //   return FontWeight._(index);
    // }
    // return null;
    
  }
} 