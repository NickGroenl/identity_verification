
<p align="center" alt="Microblink Logo"><img src="example/assets/logo-microblink.jpeg" /></p>

# <a name="identity-verification-sdk-for-flutter"></a>Identity Verification Plugin for Flutter

A Dart wrapper for iOS and Android Identity Verification.

Android SDK: v3.4.0

iOS SDK: v3.4.0

For maximum performance and full access, please use the native ([Android](https://github.com/IdentityVerification/identity-verification-android), [iOS](https://github.com/IdentityVerification/identity-verification-ios)) SDKs.


## Requirements
Identity Verification requires Flutter 2.17.1 or higher. Please refer to the
[official documentation](https://docs.flutter.dev/) for more details.

Set up SSH keys to your Github account to be able to access the private library. See guide [here](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account).


## Identity Verification Server compatibility
If you use on-premise (self-hosted) Identity Verification Server solution for Identity Verification, you must use a compatible server version for the Identity Verification Flutter library version that you use. Identity Verification Server is backward compatible, and this table shows a minimum version of the Identity Verification Server that you should use for each Flutter Plugin version.

| Identity Verification Flutter version | Identity Verification Server version |
|:-------------------------------------:|:------------------------------------:|
|                 3.4.0                 |              &ge; 3.4.0              |
|                 3.3.0                 |              &ge; 3.3.0              |
|                 3.2.0                 |              &ge; 3.2.0              |
|                 3.1.0                 |              &ge; 3.1.0              |

## Getting Started


### Maven integration
Android dependencies are integrated via Maven. Follow these steps: 

- Create a Github personal access token

- You will need a personal access token for github with the read:packages right.

- For more information on how to create a personal access token on github, check out the [official github documentation](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token).


Inside your android/local.properties, add the following:

```
github.packages.username=yourgithubusername
github.packages.token=yourgithubtoken

```



Add repositories to your project
To get access to our libraries in your project via maven, yo have to add the following repositories to your android project:

To get stated, first create an empty project if needed:
```yaml 
flutter create project_name
```
Add identity_verification_flutter dependency to your `pubspec.yaml` file:
```yaml

dependencies:
  identity_verification_flutter:
    git:
      url: git@github.com:IdentityVerification/identity-verification-flutter.git
      ref: release/3.4.0

```

### OR

You can run the sample app inside the repository. The folder `example` containes a sample app that uses the plugin.
 

For more information on using git packages, see the [official documentation](identity_verification_flutter).

## Plugin Usage

1. Import plugin to your file
```yaml 
import 'package:identity_verification_flutter/identity_verification.dart';
```

2. Perform identity verification by calling ` IdentityVerification().startVerification(IdvConfiguration())`. 
An `IdvConfiguration` is required to to properly start the process.


3. When the verification is complete, it will return an `IdvResult` if the identity verification is successful, otherwise `IdvError`.
```dart
Future<dynamic> verifyIdentity(IdvConfiguration idvConfig) async{
  
   final result = await idv.startVerification(idvConfig);
   if (result is IdvResult) {
      print(result.toString());
   } else {
      print(result.toString());
   }
   return result;
   
}
```
3. Result contains the following fields. You can use the `IdvResult.getResultFieldAsMap()` to collect all fields as a map
 and `DocumentResultField.getDisplayString()` to display the field's value as a String.
```dart 
  class IdvResult{
      final List<DocumentResultField> documentResultFields;
      final Image? faceImage;
      final Image? livenessImage;

      final Image? frontSideDocumentImage;
      final Image? backSideDocumentImage;
      final Image? signatureImage;

      final ClassInfo? classInfo;
      final ImageAnalysisResult? frontImageAnalysisResult;
      final ImageAnalysisResult? backImageAnalysisResult;
  }

 ```


## Configuration

Configuration example:

```dart

IdvConfiguration configureIdv(){
   final verificationServiceSettings =
   VerificationServiceSettings(url: 'https://api.idv.microblink.com');

   final livenessStep = LivenessStep(initializeInProduction: true);

   final scanSteps = BlinkIdScanStep()
      ..androidLicensePackageName =
              'com.microblink.identityverification.dev.sample.mblic'
      ..iOSLicense =
              'sRwAAAEdY29tLm1pY3JvYmxpbmsuaWR2ZXJpZnlzYW1wbGUL8d7weCSDPWXzsJjGL5SkJ/r9AjnSsLidOAaJVjzHmJlS8+ZpQzJXSWqjGIIBmN3zv/HKVYLd5ZBaAdRnNOtJDEp3PSZ6qi7wjGDFTJd+uHnY0nmQBxK+255KkCZAL9BcU4HIyXlKXNNcn40/NAmpJaKCQMgLi6n1MS5apXJFj9P7qY+IHR6JYc3MHUup4vGoMkjir16HbtjtOWJTkC83iNAf0nrPJ2ooFsLAtlG7wiQ+hSjTv950lYQhQcEyTSF46t8ZhG1L/3hsYj6W36xu3/QExCEuYZgBd3a0eeoTeVerDgmKZfu1LfRIsp5nLGmXChqbkgZXHXRZSfecaTWNLFo='
      ..attachDocumentListener = true
      ..showDocumentImages = true
      ..showResultHeader = true
      ..documentFilter = DocumentFilter(
              countries: [Country.Philippines.index, Country.Usa.index],
              types: [Type.Passport.index, Type.Visa.index],
              allowScanning: true)
      ..documentFields = fields;

   final idvConfiguration = IdvConfiguration(
      scanStep: scanSteps,
      livenessStep: livenessStep,
      verificationServiceSettings: verificationServiceSettings,
      disableScreenshots: true,
   );
   
   return idvConfiguration;
  
  
}


```


### Document Fields
Specify in the `BlinkIdScanStep` which fields will be queried and shown in the result screen
```dart
 List<DocumentField> fields = [
   FieldLastName(
           modificationConfig: ModificationConfig(
                   editable: true,
                   insertable: true,
                   validators: [
                      EqualTo(stringValue: "Dela Cruz"),
                      MinLength(intValue: 3)
                   ])),
   FieldFirstName(
           modificationConfig: ModificationConfig(
                   validators: [Required()], editable: true, insertable: false)),
   FieldAdditionalNameInformation(),
   FieldRace(),
   FieldSex(),
   FieldDateOfExpiry(),
   FieldDateOfExpiryPermanent(),
   FieldIssuingAuthority(),
   FieldDateOfBirth(),
   FieldDocumentNumber(
           modificationConfig:
           ModificationConfig(insertable: true, editable: false))
];
 ```


### Document Filter 
To allow/prevent scanning of specific documents, you can filter them
by `Country`,`Region`, and `Type` and setting `allowScanning`
to true or false.
```dart

DocumentFilter getDocumentFilter(){
   return DocumentFilter(
           countries: [Country.Philippines.index, Country.Usa.index],
           types: [Type.Passport.index, Type.Visa.index],
           allowScanning: true);
}

```

## Platform Specifics

## Android

### License
Place your license file in the `android/app/src/main/assets` folder.

### Customization
For customizations and localizations, please refer to the [IDV SDK for Android](https://github.com/IdentityVerification/identity-verification-android#customizing-the-look).




## iOS

### Running SDK
To start the sdk, provide `iOSLicense` key in `BlinkIdScanStep`.

### Permissions
To use the camera, add `NSCameraUsageDescription` key to app's `Info.plist` 

### Customize Themes
Customize colors, fonts, images, views, localization, and date format

```dart
void setupThemes() {

   final idv = IdentityVerification();

   // Use IdvColor and specify the color in a hex format
   // Also, you can set color for dark mode
   final colorTheme = IdvColorTheme()
         ..stepCaptionColor = IdvColor(color: '#ff0000')
         ..labelColor = IdvColor(color: '804948', darkModeColor: '#B3E0E7');

   // Provide the location path of the image to update
   final imageTheme = IdvImageTheme()
         ..landingIllustration = 'assets/MyCustomImage.png'
         ..faceTecIconClose = 'assets/sample.png';

   // Set size and font weight. For font weight, pass its index value
   // To change entire font family, provide its name and path of font where it is located
   final fontTheme = IdvFontTheme()
         ..navigationBarTitleFont = IdvFont(size: 24, weight: FontWeight.w900.index)
         ..fontFamily = IdvFontFamily(name: 'Spartan', path: 'assets/Spartan-Bold.ttf');

   // Update views and buttons with corner radius and shadows
   final viewTheme = IdvViewTheme()
         ..buttonCornerRadius = 20;

   // Update style of navigation bar
   final navTheme = IdvNavigationTheme()
         ..titleColor = '#ff0000'
         ..barTintColor = '#ff0000';

   // Create your localized string file in XCode. Specify here its file name to reflect changes
   final localizationTheme = IdvLocalizationTheme()
         ..localizationFileName = 'IDVLocalizable';

   // Update date format
   final dateTheme = IdvDateFormatterTheme()
         ..customDateFormat = 'MM/dd/yyyy';

   //Call setupThemes to apply UI changes
   idv.setupThemes(
        colorTheme: colorTheme,
        fontTheme: fontTheme,
        imageTheme: imageTheme,
        localizationTheme: localizationTheme,
        viewTheme: viewTheme,
        navigationTheme: navTheme,
        dateFormatterTheme: dateTheme);
  }
```


## Licensing
* A valid license key is required to initialize identity verification. You can request a free trial license key 
by registering at [Microblink Developer Hub](https://developer.microblink.com/start).
* Your Application ID/Bundle ID should match with the license you requested.