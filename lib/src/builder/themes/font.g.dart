// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'font.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Font _$FontFromJson(Map<String, dynamic> json) => Font(
      fontSize: (json['fontSize'] as num?)?.toDouble(),
      fontWeight: FontWeightExtension.fromJson(json['fontWeight'] as int?),
    );

Map<String, dynamic> _$FontToJson(Font instance) => <String, dynamic>{
      'fontSize': instance.fontSize,
      'fontWeight': FontWeightExtension.toJson(instance.fontWeight),
    };
