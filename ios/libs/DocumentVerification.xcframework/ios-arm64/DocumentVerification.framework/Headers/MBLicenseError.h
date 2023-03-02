//
//  MBLicenseError.h
//  MicroblinkDev
//
//  Created by Mijo Gracanin on 23/09/2020.
//

#ifndef MBLicenseError_h
#define MBLicenseError_h

#import <Foundation/Foundation.h>

extern NSString * const MDVLicenseErrorNotification;

typedef NS_ENUM(NSInteger, MDVLicenseError) {
    MDVLicenseErrorNetworkRequired,
    MDVLicenseErrorUnableToDoRemoteLicenceCheck,
    MDVLicenseErrorLicenseIsLocked,
    MDVLicenseErrorLicenseCheckFailed,
    MDVLicenseErrorInvalidLicense,
    MDVLicenseErrorPermissionExpired,
    MDVLicenseErrorPayloadCorrupted,
    MDVLicenseErrorPayloadSignatureVerificationFailed,
    MDVLicenseErrorIncorrectTokenState
};

typedef void(^MDVLicenseErrorBlock)(MDVLicenseError licenseError);

#endif /* MBLicenseError_h */
