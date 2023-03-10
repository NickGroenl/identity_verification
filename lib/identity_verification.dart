library identity_verification;

import 'package:identity_verification_flutter/src/configuration/builders.dart' ;
import 'package:identity_verification_flutter/src/idv.dart';

export 'src/result/idv_result.dart';
export 'src/result/result_fields.dart';
export 'src/configuration/condition.dart';
export 'src/configuration/fields.dart';
export 'src/configuration/builders.dart' hide IdvDartApi, IdvPlatformApi;
export 'package:identity_verification_flutter/identity_verification.dart' show IdentityVerification;

class IdentityVerification {
  final Idv _idv = Idv(IdvPlatformApi());

  /// Launch IDV verification and return an [IdvResult] if success, [IdvError] if failed
  Future<dynamic> startVerification(IdvConfiguration idvConfiguration) async {
    return await _idv.startVerification(idvConfiguration);
  }

  /// Customize Idv Theme(For iOS only)
  Future<void> setupThemes(
      {IdvColorTheme? colorTheme,
      IdvFontTheme? fontTheme,
      IdvImageTheme? imageTheme,
      IdvLocalizationTheme? localizationTheme,
      IdvViewTheme? viewTheme,
      IdvNavigationTheme? navigationTheme,
      IdvDateFormatterTheme? dateFormatterTheme}) async {
    return await _idv.setupThemes(
        colorTheme: colorTheme,
        fontTheme: fontTheme,
        imageTheme: imageTheme,
        localizationTheme: localizationTheme,
        viewTheme: viewTheme,
        navigationTheme: navigationTheme,
        dateFormatterTheme: dateFormatterTheme);
  }
}
