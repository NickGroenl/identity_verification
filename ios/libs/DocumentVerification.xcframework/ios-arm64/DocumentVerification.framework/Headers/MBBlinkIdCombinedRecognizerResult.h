//
//  MBBlinkIdCombinedRecognizerResult.h
//  MicroblinkDev
//
//  Created by Jura Skrlec on 18/06/2019.
//

#import "MBRecognizerResult.h"
#import "MBDateResult.h"
#import "MBMrzResult.h"
#import "MBBarcodeResult.h"
#import "MBVizResult.h"
#import "MBProcessingStatus.h"
#import "MBRecognitionMode.h"

#import "MBCombinedRecognizerResult.h"

#import "MBFaceImageResult.h"
#import "MBEncodedFaceImageResult.h"
#import "MBCombinedFullDocumentImageResult.h"
#import "MBEncodedCombinedFullDocumentImageResult.h"
#import "MBSignatureImageResult.h"
#import "MBEncodedSignatureImageResult.h"

#import "MBDriverLicenseDetailedInfo.h"
#import "MBClassInfo.h"
#import "MBImageAnalysisResult.h"

#import "MBAgeResult.h"
#import "MBDocumentExpirationCheckResult.h"
#import "MBDataMatchDetailedInfo.h"

NS_ASSUME_NONNULL_BEGIN

/**
 * Recognizer which can scan front and back side of the United States driver license.
 */
MB_CLASS_AVAILABLE_IOS(11.0)
@interface MDVBlinkIdCombinedRecognizerResult : MDVRecognizerResult<NSCopying, MDVCombinedRecognizerResult, MDVFaceImageResult, MDVEncodedFaceImageResult, MDVCombinedFullDocumentImageResult, MDVEncodedCombinedFullDocumentImageResult, MDVAgeResult, MDVDocumentExpirationCheckResult, MDVSignatureImageResult, MDVEncodedSignatureImageResult>

MB_INIT_UNAVAILABLE

/**
 * The address of the document owner.
 */
@property (nonatomic, readonly, nullable) NSString *address;

/**
 * The date of birth of the document owner.
 */
@property (nonatomic, readonly, nullable) MDVDateResult *dateOfBirth;

/**
 * The date of expiry of the document.
 */
@property (nonatomic, readonly, nullable) MDVDateResult *dateOfExpiry;

/**
 * The date of issue of the document.
 */
@property (nonatomic, readonly, nullable) MDVDateResult *dateOfIssue;

/**
 * Determines if date of expiry is permanent.
 */
@property (nonatomic, readonly) BOOL dateOfExpiryPermanent;

/**
 * The document number.
 */
@property (nonatomic, readonly, nullable) NSString *documentNumber;

/**
 * The first name of the document owner.
 */
@property (nonatomic, readonly, nullable) NSString *firstName;

/**
 * The full name of the document owner.
 */
@property (nonatomic, readonly, nullable) NSString *fullName;

/**
 * The last name of the document owner.
 */
@property (nonatomic, readonly, nullable) NSString *lastName;

/**
 * The father's name of the document owner.
 */
@property (nonatomic, readonly, nullable) NSString *fathersName;

/**
 * The mother's name of the document owner.
 */
@property (nonatomic, readonly, nullable) NSString *mothersName;

/**
 * The sex of the document owner.
 */
@property (nonatomic, readonly, nullable) NSString *sex;

/**
 * The localized name of the document owner.
 */
@property (nonatomic, readonly, nullable) NSString *localizedName;

/**
 * The additional name information of the document owner.
 */
@property (nonatomic, readonly, nullable) NSString *additionalNameInformation;

/**
 * The additional address information of the document owner.
 */
@property (nonatomic, readonly, nullable) NSString *additionalAddressInformation;

/**
 * The one more additional address information of the document owner.
 */
@property (nonatomic, readonly, nullable) NSString *additionalOptionalAddressInformation;

/**
 * The place of birth of the document owner.
 */
@property (nonatomic, readonly, nullable) NSString *placeOfBirth;

/**
 * The nationality of the documet owner.
 */
@property (nonatomic, readonly, nullable) NSString *nationality;

/**
 * The race of the document owner.
 */
@property (nonatomic, readonly, nullable) NSString *race;

/**
 * The religion of the document owner.
 */
@property (nonatomic, readonly, nullable) NSString *religion;

/**
 * The profession of the document owner.
 */
@property (nonatomic, readonly, nullable) NSString *profession;

/**
 * The marital status of the document owner.
 */
@property (nonatomic, readonly, nullable) NSString *maritalStatus;

/**
 * The residential stauts of the document owner.
 */
@property (nonatomic, readonly, nullable) NSString *residentialStatus;

/**
 * The employer of the document owner.
 */
@property (nonatomic, readonly, nullable) NSString *employer;

/**
 * The personal identification number.
 */
@property (nonatomic, readonly, nullable) NSString *personalIdNumber;

/**
 * The additional number of the document.
 */
@property (nonatomic, readonly, nullable) NSString *documentAdditionalNumber;

/**
 * The one more additional number of the document.
 */
@property (nonatomic, readonly, nullable) NSString *documentOptionalAdditionalNumber;

/**
 * The issuing authority of the document.
 */
@property (nonatomic, readonly, nullable) NSString *issuingAuthority;

/**
 * The data extracted from the machine readable zone
 */
@property (nonatomic, readonly, nullable) MDVMrzResult *mrzResult;

/**
 * The driver license detailed info.
 */
@property (nonatomic, readonly, nullable) MDVDriverLicenseDetailedInfo *driverLicenseDetailedInfo;

/**
 * The classification information.
 */
@property (nonatomic, readonly, nullable) MDVClassInfo *classInfo;

/**
 * Defines possible color and moire statuses determined from scanned front image.
 */
@property (nonatomic, readonly, nullable) MDVImageAnalysisResult *frontImageAnalysisResult;

/**
 * Defines possible color and moire statuses determined from scanned back image.
 */
@property (nonatomic, readonly, nullable) MDVImageAnalysisResult *backImageAnalysisResult;

/**
 * Defines the data extracted from the barcode.
 */
@property (nonatomic, readonly, nullable) MDVBarcodeResult *barcodeResult;

/**
 * Defines the data extracted from the front side visual inspection zone.
 */
@property (nonatomic, readonly, nullable) MDVVizResult *frontVizResult;

/**
 * Defines the data extracted from the back side visual inspection zone.
 */
@property (nonatomic, readonly, nullable) MDVVizResult *backVizResult;

/**
 * Defines status of the last recognition process.
 */
@property (nonatomic, readonly, assign) MDVProcessingStatus processingStatus;

/**
 * Status of the last front side recognition process.
 */
@property (nonatomic, readonly, assign) MDVProcessingStatus frontProcessingStatus;

/**
 * Status of the last back side recognition process.
 */
@property (nonatomic, readonly, assign) MDVProcessingStatus backProcessingStatus;

/**
 * Recognition mode used to scan current document.
 */
@property (nonatomic, readonly, assign) MDVRecognitionMode recognitionMode;

/**
 * The front raw camera frame.
 */
@property (nonatomic, readonly, nullable) MDVImage *frontCameraFrame;

/**
 * The back raw camera frame.
 */
@property (nonatomic, readonly, nullable) MDVImage *backCameraFrame;

/**
 * The barcode raw camera frame.
 */
@property (nonatomic, readonly, nullable) MDVImage *barcodeCameraFrame;

/**
 * Detailed info on data match.
 */
@property (nonatomic, readonly, nullable) MDVDataMatchDetailedInfo *dataMatchDetailedInfo;

@end

NS_ASSUME_NONNULL_END
