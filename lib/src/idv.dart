import 'package:flutter/material.dart';
import 'package:identity_verification_flutter/src/result/extensions.dart';
import 'dart:typed_data';

import '../identity_verification.dart';
import 'configuration/builders.dart';

class Idv extends IdvDartApi {
  Idv(this._api) {
    IdvDartApi.setup(this);
  }

  final IdvPlatformApi _api;
  Image? _facetecImage;
  DocumentResult? _documentResult;
  IdvError? _idvError;
  String? _feedbackCode;
  String? _livenessError;

  /// Launch IDV verification and return an [IdvResult] if success, [IdvError] if failed
  Future<dynamic> startVerification(IdvConfiguration idvConfiguration) async {
    validateInput(idvConfiguration);
    _idvError = null;

    final success = await _api.startVerification(idvConfiguration);
    if (success) {
      return createIdvResult(_documentResult, _facetecImage);
    } else {
      return _idvError!;
    }
  }

  bool _isValidUrl(String value) {
    String urlPattern =
        r"(https?|http)://([-A-Z0-9.]+)(/[-A-Z0-9+&@#/%=~_|!:,.;]*)?(\?[A-Z0-9+&@#/%=~_|!:‌​,.;]*)?";

    RegExp regExp = RegExp(urlPattern);
    if (value.isEmpty) {
      return false;
    } else if (!regExp.hasMatch(value)) {
      return false;
    }
    return true;
  }

  /// Validate [IdvConfiguration] and check for missing parameters
  void validateInput(IdvConfiguration idvConfiguration) {
    final scanStep = idvConfiguration.scanStep;

    if (scanStep.iOSLicense == null &&
        scanStep.androidLicenseFileName == null) {
      throw ArgumentError("License is required");
      //At least 1 should be set
    }

    if (idvConfiguration.verificationServiceSettings.url.isEmpty) {
      throw ArgumentError("Verification service url is required");
    }

    if (_isValidUrl(idvConfiguration.verificationServiceSettings.url)) {
      throw ArgumentError(
          "Verification service url is not valid, ${idvConfiguration.verificationServiceSettings.url}");
    }

    if (idvConfiguration.dateFormat != null) {
      if (DateTime.tryParse(idvConfiguration.dateFormat!) == null) {
        throw ArgumentError("DateFormat is invalid");
      }
    }
  }

  @override
  void onVerificationResult(VerificationResult verificationResult) {
    switch (verificationResult.verificationType) {
      case VerificationType.SUCCESS:
        break;
      case VerificationType.FAILED:
        _idvError = IdvError(ErrorType.Failed);
        break;
      case VerificationType.CANCELLED:
        _idvError = IdvError(ErrorType.Cancelled);
        break;
      case VerificationType.NEEDS_REVIEW:
        _idvError = IdvError(ErrorType.Needs_Review);
        break;
    }
  }

  @override
  Future<bool> validate(String value) async {
    return true;
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
    return _api.setupIdentityVerificationCustomization(
        colorTheme,
        fontTheme,
        imageTheme,
        localizationTheme,
        viewTheme,
        navigationTheme,
        dateFormatterTheme);
  }

  @override
  void onLivenessCheckSuccess(Uint8List? image) {
    if (image != null) {
       _facetecImage = Image.memory(image);
    }
  }

  @override
  void onResultConfirmed(DocumentResult documentResult) {
    _documentResult = documentResult;
  }
  
  @override
  void onLivenessCheckError(String? error) {
    _livenessError = error;
  }
  
  @override
  void onLivenessCheckFailure(String feebackCode) {
    _feedbackCode = feebackCode;
  }
}
