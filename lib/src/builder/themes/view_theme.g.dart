// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'view_theme.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ViewTheme _$ViewThemeFromJson(Map<String, dynamic> json) => ViewTheme(
      faceImageCornerRadius:
          (json['faceImageCornerRadius'] as num?)?.toDouble(),
      buttonCornerRadius: (json['buttonCornerRadius'] as num?)?.toDouble(),
      actionViewCornerRadius:
          (json['actionViewCornerRadius'] as num?)?.toDouble(),
      actionStepCornerRadius:
          (json['actionStepCornerRadius'] as num?)?.toDouble(),
      resultsPersonImageCornerRadius:
          (json['resultsPersonImageCornerRadius'] as num?)?.toDouble(),
      stepViewShadowColor:
          ColorExtension.fromJson(json['stepViewShadowColor'] as String?),
      stepViewShadowOpacity:
          (json['stepViewShadowOpacity'] as num?)?.toDouble(),
      stepViewShadowRadius: (json['stepViewShadowRadius'] as num?)?.toDouble(),
      buttonHeight: (json['buttonHeight'] as num?)?.toDouble(),
      idInstructionsCornerRadius:
          (json['idInstructionsCornerRadius'] as num?)?.toDouble(),
      idFlashlightWarningCornerRadius:
          (json['idFlashlightWarningCornerRadius'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ViewThemeToJson(ViewTheme instance) => <String, dynamic>{
      'faceImageCornerRadius': instance.faceImageCornerRadius,
      'buttonCornerRadius': instance.buttonCornerRadius,
      'actionViewCornerRadius': instance.actionViewCornerRadius,
      'actionStepCornerRadius': instance.actionStepCornerRadius,
      'resultsPersonImageCornerRadius': instance.resultsPersonImageCornerRadius,
      'stepViewShadowColor':
          ColorExtension.toJson(instance.stepViewShadowColor),
      'stepViewShadowOpacity': instance.stepViewShadowOpacity,
      'stepViewShadowRadius': instance.stepViewShadowRadius,
      'buttonHeight': instance.buttonHeight,
      'idInstructionsCornerRadius': instance.idInstructionsCornerRadius,
      'idFlashlightWarningCornerRadius':
          instance.idFlashlightWarningCornerRadius,
    };
