import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:identity_verification_flutter/src/configuration/builders.dart';
import 'package:identity_verification_flutter/src/idv.dart';

class FakeIdvDartApi extends Fake implements IdvDartApi {}

class FakeIdvPlatformApi extends Fake implements IdvPlatformApi, IdvDartApi {
  @override
  Future<bool> startVerification(IdvConfiguration idvConfiguration) async {
    return true;
  }

  @override
  void onResultConfirmed(DocumentResult documentResult) {}

  @override
  void onVerificationResult(VerificationResult verificationResult) {}

  @override
  void onLivenessCheckError(String? error) {}

  @override
  void onLivenessCheckFailure(String feebackCode) {}
}

class FakeDocumentField extends Fake implements DocumentField {
  @override
  final bool editable;

  FakeDocumentField({required this.editable});
}

class FakeIdentityVerificationConfiguration extends Fake
    implements IdvConfiguration {
  @override
  final FakeBlinkIdScanSteps blinkIdScanSteps;
  @override
  final String dateFormat;
  @override
  final FakeVerificationServiceSettings verificationServiceSettings;
  @override
  final FakeFacetecLivenessSteps facetecLivenessSteps;

  FakeIdentityVerificationConfiguration(
      {required this.blinkIdScanSteps,
      required this.dateFormat,
      required this.verificationServiceSettings,
      required this.facetecLivenessSteps});
}

class FakeBlinkIdScanSteps extends Fake implements DocumentScanStep {
  @override
  final List<FakeDocumentField> documentFields;
  @override
  final String iOSLicense;
  @override
  final String androidLicensePackageName;
  @override
  final bool showDocumentImages;

  @override
  FakeBlinkIdScanSteps(
      {required this.documentFields,
      required this.iOSLicense,
      required this.androidLicensePackageName,
      required this.showDocumentImages});
}

class FakeVerificationServiceSettings extends Fake
    implements VerificationServiceSettings {
  @override
  final String baseURL;

  @override
  FakeVerificationServiceSettings({required this.baseURL});
}

class FakeVerificationServiceSettingsBuilder extends Fake
    implements VerificationServiceSettings {
  @override
  String baseURL = '';

  @override
  FakeVerificationServiceSettings build() {
    return FakeVerificationServiceSettings(baseURL: baseURL);
  }
}

class FakeFacetecLivenessSteps extends Fake implements LivenessStep {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();

  final FakeIdvPlatformApi platformApi = FakeIdvPlatformApi();
  final idv = Idv(platformApi);

  FakeIdentityVerificationConfiguration? configuration;

  setUpAll(() async {});

  test(
    'throw argument error if empty url',
    () async {
      expect(
          () async => await idv.startVerification(IdvConfiguration(
              scanStep: DocumentScanStep(
                  androidLicenseFileName: 'sffdsSfgg#dd',
                  iOSLicense: '',
                  scanStep: ScanStep.BlinkId),
              livenessStep: LivenessStep(
                  liveness: Liveness.Facetec, initializeInProduction: true),
              verificationServiceSettings:
                  VerificationServiceSettings(url: ''))),
          throwsA(isInstanceOf<ArgumentError>()));

      // idv.startVerification(IdvConfiguration());

      // idv.startVerification(configuration!);
    },
  );

  test('throw argument error if no license provided', () async {
    expect(
        () async => await idv.startVerification(IdvConfiguration(
            scanStep: DocumentScanStep(
                androidLicenseFileName: null,
                iOSLicense: null,
                scanStep: ScanStep.BlinkId),
            livenessStep: LivenessStep(
                liveness: Liveness.Facetec, initializeInProduction: true),
            verificationServiceSettings:
                VerificationServiceSettings(url: 'asdasdas'))),
        throwsA(isInstanceOf<ArgumentError>()));
  });

  tearDown(() {
    // channel.setMockMethodCallHandler(null);
  });
}
