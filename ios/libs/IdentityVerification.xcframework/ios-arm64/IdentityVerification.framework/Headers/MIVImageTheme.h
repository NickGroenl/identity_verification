//
//  MIVImageTheme.h
//  IdentityVerification
//
//  Created by Tomislav Cvetkovic on 06/05/2020.
//  Copyright © 2020 Microblink. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MIVImageTheme : NSObject

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

+ (instancetype)sharedInstance NS_SWIFT_NAME(shared());

/// Used onn main screen, by default illustration. Can't be tinted
@property (nullable, nonatomic, strong) UIImage *landingIllustration;
/// On complete verification screen, default success checkmark icon
@property (nullable, nonatomic, strong) UIImage *iconCheckmarkLarge;
/// On complete verification screen, default error cross icon
@property (nullable, nonatomic, strong) UIImage *iconCrossLarge;
/// On complete verification screen, default background for success and error. Tinted green for success and red for fail
@property (nullable, nonatomic, strong) UIImage *iconCompleteVerificationBackground;
/// On successful action view, default checkmark icon
@property (nullable, nonatomic, strong) UIImage *iconActionCheckmark;
/// On action view, default lock icon
@property (nullable, nonatomic, strong) UIImage *iconLock;
/// On results screen, default edit icon if field is editable
@property (nullable, nonatomic, strong) UIImage *iconEditField;
/// On results screen in header, default person icon if editable/insertable field exist
@property (nullable, nonatomic, strong) UIImage *editResultsHeaderIcon;
/// On results screen in header, default person icon if editable/insertable field exist
@property (nullable, nonatomic, strong) UIImage *loadingIndicator;


// ID Scanning


/**
 * Image that animates when scanning is successful
 *
 * Default: check mark image
*/
@property (nonatomic, strong) UIImage *idSuccessScanningImage;

/**
 * First image in animation queu that is shown on first side finished scanning
 *
 * Default: check mark image
*/
@property (nonatomic, strong) UIImage *idFrontCardImage;

/**
 * Second image in animation array that is shown on first side finished scanning
 *
 * Default: check mark image
*/
@property (nonatomic, strong) UIImage *idBackCardImage;

// FaceTec Liveness

/// Image shown on FaceTec Liveness screen when Camera permissions are not (yet) allowed
@property (nonatomic, strong) UIImage *faceTecCameraPermission;
/// Placeholder image shown in case of an eeror to demonstrate to user how to idealy position face
@property (nonatomic, strong) UIImage *faceTecIdealSelfie;
/// Used on successful liveness. By default white circle
@property (nonatomic, strong) UIImage *faceTecProgressSelfieDoneBackground;
/// Close icon on FaceTec Liveness screen
@property (nonatomic, strong) UIImage *faceTecIconClose;

// iProov Liveness

/// Close icon on Iproov Liveness screen
@property (nonatomic, strong) UIImage *iproovIconClose;

// Document Verification

/**
 * Image that animates when scanning is successful
 *
 * Default: check mark image
*/
@property (nonatomic, strong) UIImage *documentVerificationSuccessScanningImage;

/**
 * First image in animation queu that is shown on first side finished scanning
 *
 * Default: check mark image
*/
@property (nonatomic, strong) UIImage *documentVerificationFrontCardImage;

/**
 * Second image in animation array that is shown on first side finished scanning
 *
 * Default: check mark image
*/
@property (nonatomic, strong) UIImage *documentVerificationBackCardImage;

/**
 * Success image after first side scan, back side scan and every tilt step.
 * Dimensions: 136x136
 *
 * Default: confirmationBlinkId
*/
@property (nonatomic) UIImage *documentVerificationSuccessStepImage;

/**
 * Help button image
 * Dimensions: 32x32
 *
 * Default: need-help-tooltip
*/
@property (nonatomic) UIImage *documentVerificationHelpButtonImage;

/**
 * Help button dark image
 * Dimensions: 32x32
 *
 * Default: need-help-tooltip-dark
*/
@property (nonatomic) UIImage *documentVerificationHelpButtonDarkImage;

@end

NS_ASSUME_NONNULL_END
