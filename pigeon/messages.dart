// ignore_for_file: constant_identifier_names

import 'package:pigeon/pigeon.dart';

@HostApi()
abstract class IdvPlatformApi {
  /// Call this method to start sdk
  @async
  bool startVerification(IdvConfiguration idvConfiguration);

  /// Call this method to customize the UI. Works only on iOS
  @async
  void setupIdentityVerificationCustomization(
      IdvColorTheme? colorTheme,
      IdvFontTheme? fontTheme,
      IdvImageTheme? imageTheme,
      IdvLocalizationTheme? localizationTheme,
      IdvViewTheme? viewTheme,
      IdvNavigationTheme? navigationTheme,
      IdvDateFormatterTheme? dateFormatterTheme);
}

@FlutterApi()
abstract class IdvDartApi {
  /// These methods are called after retrieving document verification information.
  void onLivenessCheckSuccess(Uint8List? image);

  void onVerificationResult(VerificationResult verificationResult);

  void onResultConfirmed(DocumentResult documentResult);

  void onLivenessCheckFailure(String feebackCode);

  void onLivenessCheckError(String? error);
}

/// Model for the result of IDV verification, to be passed on VerificationFinishListener
class VerificationResult {
  final VerificationType verificationType;

  VerificationResult(this.verificationType);
}

/// Add custom validation used in DocumentField (optional)
class FieldValidator {
  final ConditionName conditionName;
  final String? stringValue;
  final int? intValue;
  final bool? ignoreCase;

  FieldValidator(
      this.conditionName, this.stringValue, this.intValue, this.ignoreCase);
}

// We can't use enum in Pigeon as of the moment, so we List<int?> instead. 7/19/2022

/// Allow or not allow the user to scan specific documents, filtered by countries, region and type
class DocumentFilter {
  /// Pass the indices of Country. Example: [Country.Philippines.index, Country.Usa.index]
  List<int?>? countries;

  /// Pass the indices of Regions. Example: [Region.None.index]
  List<int?>? regions;

  /// Pass the indices of Type. Example: [Type.Passport.index, Type.Visa.index]
  List<int?>? types;

  /// Allow or not allow to scan documents based on filters set above
  bool allowScanning;

  DocumentFilter(this.allowScanning,
      {this.countries, this.regions, this.types});
}

class ModificationConfig {
  /// DocumentField is editable
  final bool editable;

  /// DocumentField is insertable
  final bool insertable;

  /// Array of validators for the field. If null, no validators are applied.
  final List<FieldValidator?>? validators;

  /// Set keyboard type for each field. Used in iOS only. Example: KeyboardType.NAME_PHONE_PAD
  final KeyboardType? keyboardType;

  const ModificationConfig(
      {this.editable = true,
      this.insertable = true,
      this.validators,
      this.keyboardType});
}

class DocumentField {
  /// Type of field. Example: FieldType.FULL_NAME
  final FieldType type;

  /// Config for the field. Example: ModificationConfig(editable: false)
  final ModificationConfig? modificationConfig;

  DocumentField({required this.type, this.modificationConfig});
}

class VerificationServiceSettings {
  /// Url for API calls
  final String url;

  /// Request timeout intervals
  RequestTimeout? requestTimeout;

  /// Custom headers used for API request
  Map<String?, String?>? headers;

  /// Array of public keys for SSL pining
  List<String?>? publicKeyPins;

  /// Boolean that is used to handle self-signed certificate. Default: False. For iOS only
  bool? isUsingSelfSignedCertificate;

  VerificationServiceSettings({required this.url});
}

class LivenessStep {
  /// Whether the sdk runs in development or production mode
  bool? initializeInProduction;
  final Liveness liveness;
  LivenessStepOptions? options;

  LivenessStep(this.liveness);
}

class LivenessStepOptions {
  LivenessUIFilter? filter;
}


class RequestTimeout {
  /// For Android only
  final int connectionTimeout;
  final int writeTimeout;
  final int readTimeout;

  /// The timeout interval to use when waiting for additional data. For iOS only
  final double timeoutIntervalForRequest;

  /// The maximum amount of time that a resource request should be allowed to take. For iOS only
  final double timeoutIntervalForResource;

  RequestTimeout(this.connectionTimeout, this.writeTimeout, this.readTimeout,
      this.timeoutIntervalForRequest, this.timeoutIntervalForResource);
}

class DocumentScanStep {
  final ScanStep scanStep;

  /// To use the sdk, provide package name. For Android only
  String? androidLicenseFileName;

  /// To use the sdk, provide license key. For iOS only
  String? iOSLicense;

  /// Show document images on the bottom of the Result screen. Default: true
  bool? showDocumentImages;

  /// List of fields will be shown on Results screen
  List<DocumentField?>? documentFields;

  /// Result fields that will be processed but not shown on Results screen
  List<DocumentField?>? hiddenDocumentFields;

  /// Document scanning results listener
  bool? attachDocumentListener;

  /// Document filter used for filtering by country, region or document type
  DocumentFilter? documentFilter;

  /// Skip back side capture and processing step when back side of the document is not supported. Default: false
  bool? skipUnsupportedBack;

  /// Show header with face image, name and address on the top of the Result screen. Default: true
  bool? showResultHeader;

  DocumentScanStep(this.scanStep);
}

class IdvConfiguration {
  /// One of the steps used to scan documents
  final DocumentScanStep scanStep;

  /// One of the steps used to scan face
  final LivenessStep livenessStep;

  /// Settings for REST API calls
  final VerificationServiceSettings verificationServiceSettings;

  /// Set date format. For Android only.
  final String? dateFormat;

  /// Disable screenshots. For Android only.
  final bool? disableScreenshots;

  IdvConfiguration(
      this.scanStep,
      this.livenessStep,
      this.verificationServiceSettings,
      this.dateFormat,
      this.disableScreenshots);
}

class SimpleDate {
  final int year;
  final int month;
  final int day;

  SimpleDate(this.year, this.month, this.day);
}

enum ScanStep { BlinkId, DocumentVerification }

enum Liveness { Facetec, IProov }

enum LivenessUIFilter { Classic, Shaded, Vibrant }

enum ResultFieldType {
  StringResult,
  InsertedStringResult,
  EditedStringResult,
  DateResult,
  BooleanResult
}

class ResultField {
  /// Result of field type
  final FieldType type;

  /// Determines the type of validation result
  final ResultFieldType resultFieldType;

  /// Returns the value from the document. Can be original or inserted.
  final String? value1;

  /// Returns the edited value from the document
  final String? value2;

  /// Returns the boolean value from the document
  final bool? boolValue;

  /// Returns the date from the document
  final SimpleDate? simpleDate;

  // Properties below for iOS only

  /// Shows in result if item was defined as editable
  final bool? insertable;

  /// Shows in result if item was defined as editable
  final bool? editable;

  // TODO: return for validation block
  // BOOL (^validationBlock)(id value);

  /// Shows in result if keyboard type was set. Returns KeyboardType.DEFAULT by default.
  final KeyboardType? keyboardType;

  /// Original value read from document
  final String? originalValue;

  /// Value entered if the item was defined as insertable and data was not read from the document
  final String? insertedValue;

  /// Value entered if the item was defined as editable
  final String? editedValue;

  /// Used for API request for insertable and editable field
  final String? key;

  /// Used for API request for insertable and editable field
  final String? value;

  ResultField(
      this.type,
      this.value1,
      this.value2,
      this.boolValue,
      this.simpleDate,
      this.resultFieldType,
      this.insertable,
      this.editable,
      this.keyboardType,
      this.originalValue,
      this.insertedValue,
      this.editedValue,
      this.value,
      this.key);
}

class ClassInfo {
  /// The document country
  final Country? country;

  /// The document region
  final Region? region;

  /// The document type
  final Type? type;

  /// Indicates if class info is empty. For iOS only
  final bool? empty;

  /// The name of the country that issued the scanned document. For iOS only
  final String? countryName;

  /// The ISO numeric code of the country that issued the scanned document. For iOS only
  final String? isoNumericCountryCode;

  /// The 2 letter ISO code of the country that issued the scanned document. For iOS only
  final String? isoAlpha2CountryCode;

  /// The 3 letter ISO code of the country that issued the scanned document. For iOS only
  final String? isoAlpha3CountryCode;

  ClassInfo(
      this.country,
      this.region,
      this.type,
      this.empty,
      this.countryName,
      this.isoNumericCountryCode,
      this.isoAlpha2CountryCode,
      this.isoAlpha3CountryCode);
}

class ImageAnalysisResult {
  /// Indicates whether the image is blurred
  final bool? isBlurred;

  /// The color status determined from scanned image.
  final DocumentImageColorStatus? documentImageColorStatus;

  /// The Moire pattern detection status determined from the scanned image.
  final ImageAnalysisDetectionStatus? documentImageMoireStatus;

  /// Face detection status determined from the scanned image.
  final ImageAnalysisDetectionStatus? faceDetectionStatus;

  /// Mrz detection status determined from the scanned image.
  final ImageAnalysisDetectionStatus? mrzDetectionStatus;

  /// Barcode detection status determined from the scanned image.
  final ImageAnalysisDetectionStatus? barcodeDetectionStatus;

  ImageAnalysisResult(
      this.isBlurred,
      this.documentImageColorStatus,
      this.documentImageMoireStatus,
      this.faceDetectionStatus,
      this.mrzDetectionStatus,
      this.barcodeDetectionStatus);
}

class DocumentResult {
  /// Result fields shown on Results screen
  final List<ResultField?>? resultsFields;

  /// Face image from scanned document
  final Uint8List? faceImage;

  /// Image of back side document
  final Uint8List? frontSideDocumentImage;

  /// Image of back side document
  final Uint8List? backSideDocumentImage;

  /// Signature image from scanned document
  final Uint8List? signatureImage;

  /// Document classification information
  final ClassInfo? classInfo;

  /// Defines possible color and moire statuses determined from scanned front image.
  final ImageAnalysisResult? frontImageAnalysisResult;

  /// Defines possible color and moire statuses determined from scanned back image.
  final ImageAnalysisResult? backImageAnalysisResult;

  DocumentResult(
    this.faceImage,
    this.resultsFields,
    this.frontSideDocumentImage,
    this.backSideDocumentImage,
    this.signatureImage,
    this.classInfo,
    this.frontImageAnalysisResult,
    this.backImageAnalysisResult,
  );
}

/// DocumentField

enum FieldType {
  FIRST_NAME,
  LAST_NAME,
  FULL_NAME,
  LOCALIZED_NAME,
  ADDITIONAL_NAME_INFORMATION,
  DATE_OF_BIRTH,
  PLACE_OF_BIRTH,
  DATE_OF_ISSUE,
  DATE_OF_EXPIRY,
  DATE_OF_EXPIRY_PERMANENT,
  DOCUMENT_NUMBER,
  PERSONAL_ID_NUMBER,
  DOCUMENT_ADDITIONAL_NUMBER,
  ADDRESS,
  RESIDENTIAL_STATUS,
  ADDITIONAL_ADDRESS_INFORMATION,
  NATIONALITY,
  ISSUING_AUTHORITY,
  SEX,
  MARITAL_STATUS,
  RACE,
  RELIGION,
  PROFESSION,
  EMPLOYER;
}

/// Types of verification based on result
enum VerificationType { SUCCESS, FAILED, CANCELLED, NEEDS_REVIEW }

/// Set color in hex code format. IdvColor(color: '804948', darkModeColor: '#B3E0E7')
class IdvColor {
  final String color;
  String? darkModeColor;

  IdvColor(this.color, {this.darkModeColor});
}

/// Set font size and index of font weight. IdvFont(size: 24, weight: FontWeight.w900.index)
class IdvFont {
  int size;
  int? weight;

  IdvFont(this.size, {this.weight});
}

/// Set the font family name and directory where the font is located. IdvFontFamily(name: 'Spartan', path: 'assets/Spartan-Bold.ttf')
class IdvFontFamily {
  final String name;
  final String path;

  IdvFontFamily(this.name, this.path);
}

/// Set the localization file name
class IdvLocalizationTheme {
  final String? localizationFileName;
  final String? faceTecLocalizationFileName;

  IdvLocalizationTheme(
      {this.localizationFileName, this.faceTecLocalizationFileName});
}

/// Themes: Setup color (dark mode included), fonts, navigation, date formatter, view, localization. For iOS only.

class IdvColorTheme {
  IdvColor? primaryColor;
  IdvColor? stepCaptionColor;
  IdvColor? stepDisabledColor;
  IdvColor? successColor;
  IdvColor? highlightColor;
  IdvColor? stepBackgroundSuccessColor;
  IdvColor? errorColor;
  IdvColor? buttonBackgroundEnabledColor;
  IdvColor? buttonBackgroundDisabledColor;
  IdvColor? buttonTextDisabledColor;
  IdvColor? buttonTextEnabledColor;
  IdvColor? defaultBackgroundColor;
  IdvColor? stepBackgroundColor;
  IdvColor? labelColor;
  IdvColor? secondaryLabelColor;
  IdvColor? reviewDataEditBannerBackgroundColor;
  IdvColor? reviewDataEditBannerTextColor;
  IdvColor? stepLabelColor;
  IdvColor? alertColor;
  IdvColor? needsReviewColor;
  IdvColor? idInstructionsTextColor;
  IdvColor? idFlashlightWarningBackgroundColor;
  IdvColor? idFlashlightWarningTextColor;
  IdvColor? idReticleErrorColor;
  IdvColor? faceTecPrimaryColor;
  IdvColor? faceTecLoadingBarRailColor;
  IdvColor? faceTecMainTextColor;
  IdvColor? faceTecSubtextColor;
  IdvColor? faceTecButtonTextColor;
  IdvColor? faceTecOvalColor;
  IdvColor? faceTecOvalProgressColor;
  IdvColor? faceTecFeedbackBarBackgroundColor;
  IdvColor? faceTecFeedbackBarTextColor;
  IdvColor? faceTecResultAnimationCheckmarkForegroundColor;

  IdvColorTheme(
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
}

class IdvFontTheme {
  IdvFont? navigationBarTitleFont;
  IdvFont? buttonFont;
  IdvFont? dataCaptionFont;
  IdvFont? dataTitleFont;
  IdvFont? dataHeaderFont;
  IdvFont? titleFont;
  IdvFont? buttonStartFont;
  IdvFont? stepTitleFont;
  IdvFont? stepNumberFont;
  IdvFont? secondaryLabelFont;

  IdvFont? faceTecMessageFont;
  IdvFont? faceTecHeaderFont;
  IdvFont? faceTecSubtextFont;
  IdvFont? faceTecButtonFont;

  IdvFont? idInstructionsFont;
  IdvFont? idFlashlightWarningFont;

  IdvFontFamily? fontFamily;

  IdvFontTheme(
      {this.navigationBarTitleFont,
      this.buttonFont,
      this.dataCaptionFont,
      this.dataTitleFont,
      this.dataHeaderFont,
      this.titleFont,
      this.buttonStartFont,
      this.stepTitleFont,
      this.stepNumberFont,
      this.secondaryLabelFont,
      this.faceTecMessageFont,
      this.faceTecHeaderFont,
      this.faceTecSubtextFont,
      this.faceTecButtonFont,
      this.idInstructionsFont,
      this.idFlashlightWarningFont,
      this.fontFamily});
}

/// Set image theme. Pass the directory where the image is located.
class IdvImageTheme {
  String? landingIllustration;
  String? iconCheckmarkLarge;
  String? iconCrossLarge;
  String? iconCompleteVerificationBackground;
  String? iconActionCheckmark;
  String? iconLock;
  String? iconEditField;
  String? editResultsHeaderIcon;
  String? loadingIndicator;
  String? idSuccessScanningImage;
  String? idFrontCardImage;
  String? idBackCardImage;
  String? faceTecCameraPermission;
  String? faceTecIdealSelfie;
  String? faceTecProgressSelfieDoneBackground;
  String? faceTecIconClose;

  IdvImageTheme(
      {this.landingIllustration,
      this.iconCheckmarkLarge,
      this.iconCrossLarge,
      this.iconCompleteVerificationBackground,
      this.iconActionCheckmark,
      this.iconLock,
      this.iconEditField,
      this.editResultsHeaderIcon,
      this.loadingIndicator,
      this.idSuccessScanningImage,
      this.idFrontCardImage,
      this.idBackCardImage,
      this.faceTecCameraPermission,
      this.faceTecIdealSelfie,
      this.faceTecProgressSelfieDoneBackground,
      this.faceTecIconClose});
}

class IdvSize {
  double? width;
  double? height;

  IdvSize({this.width, this.height});
}

class IdvViewTheme {
  double? faceImageCornerRadius;
  double? buttonCornerRadius;
  double? actionViewCornerRadius;
  double? actionStepCornerRadius;
  double? resultsPersonImageCornerRadius;
  String? stepViewShadowColor;
  IdvSize? stepViewShadowOffset;
  double? stepViewShadowOpacity;
  double? stepViewShadowRadius;
  double? buttonHeight;

  // ID Scanning
  double? idInstructionsCornerRadius;
  double? idFlashlightWarningCornerRadius;

  IdvViewTheme(
      {this.faceImageCornerRadius,
      this.buttonCornerRadius,
      this.actionViewCornerRadius,
      this.actionStepCornerRadius,
      this.resultsPersonImageCornerRadius,
      this.stepViewShadowColor,
      this.stepViewShadowOffset,
      this.stepViewShadowOpacity,
      this.stepViewShadowRadius,
      this.buttonHeight,
      this.idInstructionsCornerRadius,
      this.idFlashlightWarningCornerRadius});
}

class IdvNavigationTheme {
  BarStyle? barStyle;
  bool? isTranslucent;
  bool? hideBarButtonOnSuccessfulVerification;
  String? barTintColor;
  String? titleColor;
  String? barButtonItemColor;

  IdvNavigationTheme(
      {this.barStyle,
      this.isTranslucent,
      this.hideBarButtonOnSuccessfulVerification,
      this.barTintColor,
      this.titleColor,
      this.barButtonItemColor});
}

class IdvDateFormatterTheme {
  String? customDateFormat;

  IdvDateFormatterTheme({this.customDateFormat});
}

enum BarStyle {
  white, //default
  black
}

//For iOS only
enum KeyboardType {
  DEFAULT,
  ASCII_CAPABLE,
  NUMBERS_AND_PUNCTUATIONS,
  URL,
  NUMBER_PAD,
  PHONE_PAD,
  NAME_PHONE_PAD,
  EMAIL,
  DECIMAL_PAD,
  TWITTER,
  WEB_SEARCH,
  ASCII_CAPABLE_NUMPAD
}

enum DocumentImageColorStatus { NotAvailable, BlackAndWhite, Color }

enum ImageAnalysisDetectionStatus {
  NotAvailable,
  NotDetected,
  Detected;
}

enum Country {
  None,
  Albania,
  Algeria,
  Argentina,
  Australia,
  Austria,
  Azerbaijan,
  Bahrain,
  Bangladesh,
  Belgium,
  BosniaAndHerzegovina,
  Brunei,
  Bulgaria,
  Cambodia,
  Canada,
  Chile,
  Colombia,
  CostaRica,
  Croatia,
  Cyprus,
  Czechia,
  Denmark,
  DominicanRepublic,
  Egypt,
  Estonia,
  Finland,
  France,
  Georgia,
  Germany,
  Ghana,
  Greece,
  Guatemala,
  HongKong,
  Hungary,
  India,
  Indonesia,
  Ireland,
  Israel,
  Italy,
  Jordan,
  Kazakhstan,
  Kenya,
  Kosovo,
  Kuwait,
  Latvia,
  Lithuania,
  Malaysia,
  Maldives,
  Malta,
  Mauritius,
  Mexico,
  Morocco,
  Netherlands,
  NewZealand,
  Nigeria,
  Pakistan,
  Panama,
  Paraguay,
  Philippines,
  Poland,
  Portugal,
  PuertoRico,
  Qatar,
  Romania,
  Russia,
  SaudiArabia,
  Serbia,
  Singapore,
  Slovakia,
  Slovenia,
  SouthAfrica,
  Spain,
  Sweden,
  Switzerland,
  Taiwan,
  Thailand,
  Tunisia,
  Turkey,
  UAE,
  Uganda,
  UK,
  Ukraine,
  Usa,
  Vietnam,
  Brazil,
  Norway,
  Oman,
  Ecuador,
  ElSalvador,
  SriLanka,
  Peru,
  Uruguay,
  Bahamas,
  Bermuda,
  Bolivia,
  China,
  EuropeanUnion,
  Haiti,
  Honduras,
  Iceland,
  Japan,
  Luxembourg,
  Montenegro,
  Nicaragua,
  SouthKorea,
  Venezuela,
  Afghanistan,
  AlandIslands,
  AmericanSamoa,
  Andorra,
  Angola,
  Anguilla,
  Antarctica,
  AntiguaAndBarbuda,
  Armenia,
  Aruba,
  BailiwickOfGuernsey,
  BailiwickOfJersey,
  Barbados,
  Belarus,
  Belize,
  Benin,
  Bhutan,
  BonaireSaintEustatiusAndSaba,
  Botswana,
  BouvetIsland,
  BritishIndianOceanTerritory,
  BurkinaFaso,
  Burundi,
  Cameroon,
  CapeVerde,
  CaribbeanNetherlands,
  CaymanIslands,
  CentralAfricanRepublic,
  Chad,
  ChristmasIsland,
  CocosIslands,
  Comoros,
  Congo,
  CookIslands,
  Cuba,
  Curacao,
  DemocraticRepublicOfTheCongo,
  Djibouti,
  Dominica,
  EastTimor,
  EquatorialGuinea,
  Eritrea,
  Ethiopia,
  FalklandIslands,
  FaroeIslands,
  FederatedStatesOfMicronesia,
  Fiji,
  FrenchGuiana,
  FrenchPolynesia,
  FrenchSouthernTerritories,
  Gabon,
  Gambia,
  Gibraltar,
  Greenland,
  Grenada,
  Guadeloupe,
  Guam,
  Guinea,
  GuineaBissau,
  Guyana,
  HeardIslandAndMcdonaldIslands,
  Iran,
  Iraq,
  IsleOfMan,
  IvoryCoast,
  Jamaica,
  Kiribati,
  Kyrgyzstan,
  Laos,
  Lebanon,
  Lesotho,
  Liberia,
  Libya,
  Liechtenstein,
  Macau,
  Madagascar,
  Malawi,
  Mali,
  MarshallIslands,
  Martinique,
  Mauritania,
  Mayotte,
  Moldova,
  Monaco,
  Mongolia,
  Montserrat,
  Mozambique,
  Myanmar,
  Namibia,
  Nauru,
  Nepal,
  NewCaledonia,
  Niger,
  Niue,
  NorfolkIsland,
  NorthernCyprus,
  NorthernMarianaIslands,
  NorthKorea,
  NorthMacedonia,
  Palau,
  Palestine,
  PapuaNewGuinea,
  Pitcairn,
  Reunion,
  Rwanda,
  SaintBarthelemy,
  SaintHelenaAscensionAndTristianDaCunha,
  SaintKittsAndNevis,
  SaintLucia,
  SaintMartin,
  SaintPierreAndMiquelon,
  SaintVincentAndTheGrenadines,
  Samoa,
  SanMarino,
  SaoTomeAndPrincipe,
  Senegal,
  Seychelles,
  SierraLeone,
  SintMaarten,
  SolomonIslands,
  Somalia,
  SouthGeorgiaAndTheSouthSandwichIslands,
  SouthSudan,
  Sudan,
  Suriname,
  SvalbardAndJanMayen,
  Eswatini,
  Syria,
  Tajikistan,
  Tanzania,
  Togo,
  Tokelau,
  Tonga,
  TrinidadAndTobago,
  Turkmenistan,
  TurksAndCaicosIslands,
  Tuvalu,
  UnitedStatesMinorOutlyingIslands,
  Uzbekistan,
  Vanuatu,
  VaticanCity,
  VirginIslandsBritish,
  VirginIslandsUs,
  WallisAndFutuna,
  WesternSahara,
  Yemen,
  Yugoslavia,
  Zambia,
  Zimbabwe
}

enum Region {
  None,
  Alabama,
  Alaska,
  Alberta,
  Arizona,
  Arkansas,
  AustralianCapitalTerritory,
  BritishColumbia,
  California,
  Colorado,
  Connecticut,
  Delaware,
  DistrictOfColumbia,
  Florida,
  Georgia,
  Hawaii,
  Idaho,
  Illinois,
  Indiana,
  Iowa,
  Kansas,
  Kentucky,
  Louisiana,
  Maine,
  Manitoba,
  Maryland,
  Massachusetts,
  Michigan,
  Minnesota,
  Mississippi,
  Missouri,
  Montana,
  Nebraska,
  Nevada,
  NewBrunswick,
  NewHampshire,
  NewJersey,
  NewMexico,
  NewSouthWales,
  NewYork,
  NorthernTerritory,
  NorthCarolina,
  NorthDakota,
  NovaScotia,
  Ohio,
  Oklahoma,
  Ontario,
  Oregon,
  Pennsylvania,
  Quebec,
  Queensland,
  RhodeIsland,
  Saskatchewan,
  SouthAustralia,
  SouthCarolina,
  SouthDakota,
  Tasmania,
  Tennessee,
  Texas,
  Utah,
  Vermont,
  Victoria,
  Virginia,
  Washington,
  WesternAustralia,
  WestVirginia,
  Wisconsin,
  Wyoming,
  Yukon,
  CiudadDeMexico,
  Jalisco,
  NewfoundlandAndLabrador,
  NuevoLeon,
  BajaCalifornia,
  Chihuahua,
  Guanajuato,
  Guerrero,
  Mexico,
  Michoacan,
  NewYorkCity,
  Tamaulipas,
  Veracruz,
  Chiapas,
  Coahuila,
  Durango,
  GuerreroCocula,
  GuerreroJuchitan,
  GuerreroTepecoacuilco,
  GuerreroTlacoapa,
  Gujarat,
  Hidalgo,
  Karnataka,
  Kerala,
  KhyberPakhtunkhwa,
  MadhyaPradesh,
  Maharashtra,
  Morelos,
  Nayarit,
  Oaxaca,
  Puebla,
  Punjab,
  Queretaro,
  SanLuisPotosi,
  Sinaloa,
  Sonora,
  Tabasco,
  TamilNadu,
  Yucatan,
  Zacatecas,
  Aguascalientes,
  BajaCaliforniaSur,
  Campeche,
  Colima,
  QuintanaRooBenitoJuarez
}

enum Type {
  None,
  ConsularId,
  Dl,
  DlPublicServicesCard,
  EmploymentPass,
  FinCard,
  Id,
  MultipurposeId,
  MyKad,
  MyKid,
  MyPR,
  MyTentera,
  PanCard,
  ProfessionalId,
  PublicServicesCard,
  ResidencePermit,
  ResidentId,
  TemporaryResidencePermit,
  VoterId,
  WorkPermit,
  iKad,
  MilitaryId,
  MyKas,
  SocialSecurityCard,
  HealthInsuranceCard,
  Passport,
  SPass,
  AddressCard,
  AlienId,
  AlienPassport,
  GreenCard,
  MinorsId,
  PostalId,
  ProfessionalDl,
  TaxId,
  WeaponPermit,
  Visa,
  BorderCrossingCard,
  DriverCard,
  GlobalEntryCard,
  Mypolis,
  NexusCard,
  PassportCard,
  ProofOfAgeCard,
  RefugeeId,
  TribalId,
  VeteranId,
  CitizenshipCertificate
}

/// Field Validation
enum ConditionName {
  Starts_With,
  Is_Digit,
  Min_Length,
  Required,
  Equal_To,
  Not_Equal_To,
}

enum FilterName { Equal_To, Not_Equal_To, Is_In, Not_In }
