//
//  MBVizResult.h
//  MicroblinkDev
//
//  Created by Jura Skrlec on 08/07/2020.
//

#import <Foundation/Foundation.h>
#import "MBMicroblinkDefines.h"
#import "MBDateResult.h"
#import "MBDriverLicenseDetailedInfo.h"

NS_ASSUME_NONNULL_BEGIN

/**
 * MDVVizResult contains data extracted from the Visual Inspection Zone.
 */
MB_CLASS_AVAILABLE_IOS(11.0) MB_FINAL
@interface MDVVizResult : NSObject

MB_INIT_UNAVAILABLE

/**
* The first name of the document owner.
*/
@property (nonatomic, readonly) NSString *firstName;

/**
* The last name of the document owner.
*/
@property (nonatomic, readonly) NSString *lastName;

/**
* The full name of the document owner.
*/
@property (nonatomic, readonly) NSString *fullName;

/**
 * The father's name of the document owner.
 */
@property (nonatomic, readonly) NSString *fathersName;

/**
 * The mother's name of the document owner.
 */
@property (nonatomic, readonly) NSString *mothersName;

/**
* The additional name information of the document owner.
*/
@property (nonatomic, readonly) NSString *additionalNameInformation;

/**
* The localized name of the document owner.
*/
@property (nonatomic, readonly) NSString *localizedName;

/**
* The address of the document owner.
*/
@property (nonatomic, readonly) NSString *address;

/**
* The additional address information of the document owner.
*/
@property (nonatomic, readonly) NSString *additionalAddressInformation;

/**
 * The one more additional address information of the document owner.
 */
@property (nonatomic, readonly, nullable) NSString *additionalOptionalAddressInformation;

/**
* The place of birth of the document owner.
*/
@property (nonatomic, readonly) NSString *placeOfBirth;

/**
* The nationality of the documet owner.
*/
@property (nonatomic, readonly) NSString *nationality;

/**
* The race of the document owner.
*/
@property (nonatomic, readonly) NSString *race;

/**
* The religion of the document owner.
*/
@property (nonatomic, readonly) NSString *religion;

/**
* The profession of the document owner.
*/
@property (nonatomic, readonly) NSString *profession;

/**
* The marital status of the document owner.
*/
@property (nonatomic, readonly) NSString *maritalStatus;

/**
* The residential stauts of the document owner.
*/
@property (nonatomic, readonly) NSString *residentialStatus;

/**
* The employer of the document owner.
*/
@property (nonatomic, readonly) NSString *employer;

/**
* The sex of the document owner.
*/
@property (nonatomic, readonly) NSString *sex;

/**
* The date of birth of the document owner.
*/
@property (nonatomic, readonly) MDVDateResult *dateOfBirth;

/**
* The date of issue of the document.
*/
@property (nonatomic, readonly) MDVDateResult *dateOfIssue;

/**
* The date of expiry of the document.
*/
@property (nonatomic, readonly) MDVDateResult *dateOfExpiry;

/**
* The document number.
*/
@property (nonatomic, readonly) NSString *documentNumber;

/**
* The personal identification number.
*/
@property (nonatomic, readonly) NSString *personalIdNumber;

/**
* The additional number of the document.
*/
@property (nonatomic, readonly) NSString *documentAdditionalNumber;

/**
 * The one more additional number of the document.
 */
@property (nonatomic, readonly, nullable) NSString *documentOptionalAdditionalNumber;

/**
* TThe additional personal identification number.
*/
@property (nonatomic, readonly) NSString *additionalPersonalIdNumber;

/**
* The issuing authority of the document.
*/
@property (nonatomic, readonly) NSString *issuingAuthority;

/**
 * The driver license detailed info.
 */
@property (nonatomic, readonly, nullable) MDVDriverLicenseDetailedInfo *driverLicenseDetailedInfo;

/**
 * Flag that indicates if barcode result is empty
*/
@property (nonatomic, readonly, assign) BOOL empty;

@end

NS_ASSUME_NONNULL_END
